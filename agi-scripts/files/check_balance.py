#!/usr/bin/env python3
"""
check_balance.py

Logique de consultation de solde. Anciennement script AGI autonome
(check-balance.agi, numéro 961 en dur dans extensions.conf), converti en
module importable pour être piloté depuis ivr_menus (colonne
is_balance_check), comme le fait déjà ivr-dynamic.agi pour la messagerie
vocale (is_voicemail_access).

Ce fichier n'est plus appelé directement depuis le dialplan.
"""

import logging
import psycopg2

import piper_common

LOG_FILE = "/var/log/asterisk/check-balance.log"
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

AR_PAR_SECONDE = 1


def agi_send(command):
    import sys
    sys.stdout.write(command + "\n")
    sys.stdout.flush()
    result = sys.stdin.readline().strip()
    logging.info("AGI command: %s -> %s", command, result)
    return result


def get_credit(conn, username):
    with conn.cursor() as cur:
        cur.execute(
            "SELECT credit FROM cc_card WHERE username = %s",
            (username,),
        )
        row = cur.fetchone()
        return row[0] if row else None


def format_duration(total_seconds):
    total_seconds = int(total_seconds)
    minutes = total_seconds // 60
    seconds = total_seconds % 60
    parts = []
    if minutes > 0:
        parts.append("%d minute%s" % (minutes, "s" if minutes > 1 else ""))
    parts.append("%d seconde%s" % (seconds, "s" if seconds != 1 else ""))
    return " et ".join(parts)


def play_setting(setting_key, **kwargs):
    try:
        text = piper_common.get_setting_text(setting_key, **kwargs)
    except Exception as e:
        logging.error("Impossible de récupérer le setting '%s' : %s", setting_key, e)
        return
    try:
        path = piper_common.get_or_generate(text)
    except RuntimeError as e:
        logging.error("Erreur génération audio : %s", e)
        return
    agi_send('STREAM FILE "%s" ""' % path)


def run(callerid):
    """Point d'entrée appelé depuis ivr-dynamic.agi. `callerid` est déjà
    connu (lu par l'appelant), on ne relit jamais l'environnement AGI ici."""
    logging.info("Consultation solde pour CallerID=%s", callerid)

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
        credit = get_credit(conn, callerid)
    finally:
        conn.close()

    if credit is None:
        logging.info("Aucun compte trouvé pour CallerID=%s", callerid)
        play_setting("recharge_no_account_text")
        return

    credit = float(credit)

    if credit <= 0:
        play_setting("balance_no_credit_text")
    else:
        temps_restant = credit / AR_PAR_SECONDE
        duree_txt = format_duration(temps_restant)
        credit_txt = "%d" % int(credit) if credit == int(credit) else "%.2f" % credit
        play_setting("balance_announcement_template", credit=credit_txt, duration=duree_txt)
