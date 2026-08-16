"""
piper_common.py

Module partagé contenant la logique de génération vocale Piper avec cache.
Utilisé à la fois par piper-tts.agi (appel direct depuis le dialplan) et
ivr-dynamic.agi (moteur IVR dynamique).
"""

import os
import hashlib
import subprocess
import logging
import psycopg2

CACHE_DIR = "/var/lib/asterisk/sounds/piper-cache"

# Base contenant les textes modifiables du projet (ivr_system_settings).
# Toujours celle-ci, independamment de la base metier utilisee par le
# script appelant (a2billing_db pour check-balance.agi/recharge-agi.py,
# par exemple).
SETTINGS_DB_CONFIG = {
    "host": "127.0.0.1",
    "port": 5432,
    "dbname": "asterisk_realtime",
    "user": "asterisk_user",
    "password": "asterisk",
}


def get_setting_text(setting_key, **kwargs):
    """Recupere un texte depuis ivr_system_settings, avec substitution
    optionnelle de placeholders (ex: {credit}, {duration}).
    Ouvre et referme sa propre connexion a la base des settings."""
    conn = psycopg2.connect(**SETTINGS_DB_CONFIG)
    try:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT setting_value FROM ivr_system_settings WHERE setting_key = %s",
                (setting_key,),
            )
            row = cur.fetchone()
    finally:
        conn.close()

    if not row:
        raise RuntimeError("Setting manquant : %s" % setting_key)

    text = row[0]
    if kwargs:
        text = text.format(**kwargs)
    return text
PIPER_BIN = "/usr/src/piper/piper"
PIPER_MODEL = "/usr/src/piper/voices/fr_FR-siwis-medium.onnx"


def get_cache_path(text):
    """Calcule le chemin (sans extension) du fichier de cache basé sur le hash MD5 du texte."""
    text_hash = hashlib.md5(text.encode("utf-8")).hexdigest()
    return os.path.join(CACHE_DIR, text_hash)


def generate_audio(text, output_path_no_ext):
    """Génère l'audio avec Piper puis le convertit au format téléphonique
    (8kHz, mono, 16-bit PCM). Ne fait rien si le fichier existe déjà."""
    final_wav = output_path_no_ext + ".wav"
    if os.path.exists(final_wav):
        logging.info("Fichier trouvé en cache : %s", final_wav)
        return final_wav

    raw_wav = output_path_no_ext + ".raw.wav"

    piper_cmd = [PIPER_BIN, "--model", PIPER_MODEL, "--output_file", raw_wav]
    result = subprocess.run(piper_cmd, input=text, text=True, capture_output=True)
    if result.returncode != 0:
        logging.error("Piper a échoué : %s", result.stderr)
        raise RuntimeError("Échec de la génération Piper")

    sox_cmd = ["sox", raw_wav, "-r", "8000", "-c", "1", "-b", "16", final_wav]
    result = subprocess.run(sox_cmd, capture_output=True, text=True)
    if result.returncode != 0:
        logging.error("Sox a échoué : %s", result.stderr)
        raise RuntimeError("Échec de la conversion audio")

    if os.path.exists(raw_wav):
        os.remove(raw_wav)

    logging.info("Audio généré et converti : %s", final_wav)
    return final_wav


def get_or_generate(text):
    """Fonction pratique : retourne le chemin (sans extension) du fichier
    audio prêt à jouer pour ce texte, en le générant si besoin."""
    cache_path_no_ext = get_cache_path(text)
    generate_audio(text, cache_path_no_ext)
    return cache_path_no_ext
