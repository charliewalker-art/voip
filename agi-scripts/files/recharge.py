#!/usr/bin/env python3
"""
recharge.py

Logique de recharge de compte par code voucher. Anciennement script AGI
autonome (recharge-agi.py, numéro 960 en dur dans extensions.conf),
converti en module importable pour être piloté depuis ivr_menus (colonne
is_recharge), comme le fait déjà ivr-dynamic.agi pour la messagerie
vocale (is_voicemail_access).

Ce fichier n'est plus appelé directement depuis le dialplan.
"""

import sys
import logging
import psycopg2

import piper_common

LOG_FILE = "/var/log/asterisk/recharge-agi.log"
logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
)

DB_CONFIG = {
    "host": "127.0.0.1",
    "port": 5432,
    "dbname": "a2billing_db",
    "user": "a2billing_user",
    "password": "a2billing",
}

MAX_TRIES = 3
GET_DATA_TIMEOUT_MS = 15000
GET_DATA_MAX_DIGITS = 20


def agi_send(command):
    sys.stdout.write(command + "\n")
    sys.stdout.flush()
    result = sys.stdin.readline().strip()
    logging.info("AGI command: %s -> %s", command, result)
    return result


def parse_get_data_result(raw_result):
    if "result=" not in raw_result:
        return ""
    after = raw_result.split("result=", 1)[1]
    digits = after.split(" ", 1)[0].strip()
    return digits


def get_setting(setting_key, **kwargs):
    return piper_common.get_setting_text(setting_key, **kwargs)


def play_setting(setting_key, **kwargs):
    try:
        text = get_setting(setting_key, **kwargs)
    except Exception as e:
        logging.error("Impossible de récupérer le setting '%s' : %s", setting_key, e)
        return
    try:
        path = piper_common.get_or_generate(text)
    except RuntimeError as e:
        logging.error("Erreur génération audio : %s", e)
        return
    agi_send('STREAM FILE "%s" ""' % path)


def get_data_with_setting(setting_key, **kwargs):
    try:
        text = get_setting(setting_key, **kwargs)
    except Exception as e:
        logging.error("Impossible de récupérer le setting '%s' : %s", setting_key, e)
        return ""
    try:
        path = piper_common.get_or_generate(text)
    except RuntimeError as e:
        logging.error("Erreur génération audio : %s", e)
        return ""
    result = agi_send(
        'GET DATA "%s" %d %d' % (path, GET_DATA_TIMEOUT_MS, GET_DATA_MAX_DIGITS)
    )
    return parse_get_data_result(result)


def get_card_for_callerid(conn, callerid):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT cc_card.id, cc_card.credit "
            "FROM cc_callerid "
            "JOIN cc_card ON cc_callerid.id_cc_card = cc_card.id "
            "WHERE cc_callerid.cid = %s AND cc_callerid.activated = true",
            (callerid,),
        )
        return cur.fetchone()


def get_voucher(conn, code):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT id, credit, activated, used, expirationdate "
            "FROM cc_voucher WHERE voucher = %s",
            (code,),
        )
        return cur.fetchone()


def apply_voucher(conn, voucher_id, card_id, voucher_credit, callerid):
    with conn.cursor() as cur:
        cur.execute(
            "UPDATE cc_card SET credit = credit + %s WHERE id = %s",
            (voucher_credit, card_id),
        )
        cur.execute(
            "UPDATE cc_voucher SET used = 1, usedate = now(), usedcardnumber = %s "
            "WHERE id = %s",
            (callerid, voucher_id),
        )
        cur.execute(
            "INSERT INTO cc_logrefill (credit, card_id, description, refill_type) "
            "VALUES (%s, %s, %s, %s)",
            (voucher_credit, card_id, "Recharge par voucher (960) - code: %s" % callerid, 1),
        )
    conn.commit()


def format_credit(value):
    value = float(value)
    if value == int(value):
        return "%d" % int(value)
    return "%.2f" % value


def run(callerid):
    """Point d'entrée appelé depuis ivr-dynamic.agi. `callerid` est déjà
    connu (lu par l'appelant), on ne relit jamais l'environnement AGI ici."""
    logging.info("Début recharge pour CallerID=%s", callerid)

    if not callerid:
        play_setting("recharge_no_callerid_text")
        return

    try:
        conn = psycopg2.connect(**DB_CONFIG)
    except Exception as e:
        logging.error("Connexion PostgreSQL échouée : %s", e)
        play_setting("recharge_technical_error_text")
        return

    try:
        card = get_card_for_callerid(conn, callerid)
        if not card:
            logging.info("Aucun compte trouvé pour CallerID=%s", callerid)
            play_setting("recharge_no_account_text")
            return

        card_id, current_credit = card

        success = False
        for attempt in range(1, MAX_TRIES + 1):
            if attempt > 1:
                invalid_prefix = get_setting("recharge_invalid_prefix_text")
                enter_code = get_setting("recharge_enter_code_text")
                try:
                    path = piper_common.get_or_generate(invalid_prefix + " " + enter_code)
                except RuntimeError as e:
                    logging.error("Erreur génération audio : %s", e)
                    code = ""
                else:
                    result = agi_send(
                        'GET DATA "%s" %d %d' % (path, GET_DATA_TIMEOUT_MS, GET_DATA_MAX_DIGITS)
                    )
                    code = parse_get_data_result(result)
            else:
                code = get_data_with_setting("recharge_enter_code_text")

            code = code.strip()
            logging.info("Tentative %d/%d - code saisi : %s", attempt, MAX_TRIES, code)

            if not code:
                continue

            voucher = get_voucher(conn, code)
            if not voucher:
                logging.info("Code voucher inconnu : %s", code)
                continue

            voucher_id, voucher_credit, activated, used, expirationdate = voucher

            if not activated:
                logging.info("Voucher désactivé : %s", code)
                continue
            if used:
                logging.info("Voucher déjà utilisé : %s", code)
                continue
            if expirationdate is not None:
                with conn.cursor() as cur:
                    cur.execute("SELECT expirationdate < now() FROM cc_voucher WHERE id = %s", (voucher_id,))
                    expired = cur.fetchone()[0]
                if expired:
                    logging.info("Voucher expiré : %s", code)
                    continue

            apply_voucher(conn, voucher_id, card_id, voucher_credit, callerid)
            new_credit = float(current_credit) + float(voucher_credit)
            logging.info(
                "Recharge réussie : card_id=%s, +%.4f, nouveau solde=%.4f",
                card_id, float(voucher_credit), new_credit,
            )
            play_setting("recharge_success_template", credit=format_credit(new_credit))
            success = True
            break

        if not success:
            logging.info("Échec de la recharge après %d tentative(s)", MAX_TRIES)
            play_setting("recharge_max_tries_text")

    finally:
        conn.close()
