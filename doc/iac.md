# Documentation — Infrastructure as Code du projet VoIP

## Vue d'ensemble

Ce projet reproduit intégralement, via Ansible et Vagrant, un système VoIP complet : Asterisk 20 (PJSIP) + PostgreSQL 15 + A2Billing 1.7.0 (facturation temps réel) + IVR dynamique + conférences ConfBridge + messagerie vocale + synthèse vocale Piper, plus une API Spring Boot (3 bases de données) et un frontend, déployés via Docker.

**Principe fondateur du projet** : aucune logique métier n'est codée en dur. Tout (comptes, tarification, menus IVR, textes système, salles de conférence) vit en base de données PostgreSQL et est lu dynamiquement à l'exécution par des scripts AGI Python et le moteur A2Billing.

**Machine de contrôle** : Windows. C'est la source d'un problème récurrent documenté ci-dessous (voir section « Point de vigilance transverse : CRLF »).

---

## Ordre d'exécution des rôles (tel que déclaré dans le Vagrantfile)

| # | Dossier / Fichier | Rôle en une phrase |
|---|---|---|
| — | `timezone/timezone_config.yml` | Fuseau horaire système + PostgreSQL (Indian/Antananarivo) |
| 00 | `asterisk/00_asterisk_install.yml` | Compile Asterisk 20 depuis les sources |
| 01 | `postgresql/01_postgresql_install.yml` | Installe PostgreSQL, crée les 2 bases métier |
| 02 | `connexion-db-asterisk/02_odbc_pjsip_config.yml` | Connexion realtime Asterisk ↔ PostgreSQL (ODBC) |
| 03 | `database/03_database_schema.yml` | Schéma + données des 2 bases métier |
| 04 | `piper/04_piper_install.yml` | Synthèse vocale Piper + sons français |
| 05 | `agi-scripts/05_agi_scripts.yml` | Scripts IVR/facturation Python |
| 06 | `a2billing/06_a2billing_install.yml` | Moteur PHP A2Billing patché |
| 07 | `confbridge/07_confbridge_conference.yml` | Configuration des conférences ConfBridge |
| 08 | `dialplan/08_dialplan.yml` | Dialplan final (routage de tous les appels) |
| 09 | `verify/09_restart_and_verify.yml` | Restart complet + vérification globale du système |
| 10 | `api-auth/10_api_auth_db.yml` | Base d'authentification de l'API (séparée) |
| — | `installation-docker/install_docker.yml` | Installe Docker + Docker Compose |
| — | `network-access/open_postgresql_network.yml` |  Ouvre l'accès réseau PostgreSQL (Windows + Docker) |
| 12 | `api-deployment/api_deployment.yml` | Déploie l'API + frontend via Docker Compose |



---

## Détail par rôle

### `timezone/timezone_config.yml`
**But** : aligner le fuseau horaire du système Linux **et** de PostgreSQL sur `Indian/Antananarivo` (EAT, UTC+3). Sans ce rôle, la VM démarre avec un fuseau horaire par défaut incorrect (UTC ou Europe/Paris selon la box), qui fausserait silencieusement tous les horodatages métier (CDR, historique de recharge, facturation de conférence).
**Point important** : PostgreSQL a son **propre** paramètre `timezone` dans `postgresql.conf`, indépendant du fuseau horaire système — les deux doivent être synchronisés séparément, ce que fait ce rôle.
**Fichiers** : aucun (configuration en ligne uniquement).
**Aucune donnée/fichier utilisateur** — rôle 100% système.

---

### `asterisk/00_asterisk_install.yml`
**But** : compile Asterisk 20 depuis les sources (pas un paquet apt — confirmé par l'audit initial, `dpkg -l | grep asterisk` vide sur la VM de référence).
**Fichiers** : `files/menuselect.makeopts` — utilisé comme point de départ, mais **régénéré localement** (`make menuselect.makeopts`) puis complété par des activations forcées (`res_odbc`, `res_config_odbc`, `cdr_adaptive_odbc`, `res_srtp`, `app_mixmonitor`, `app_voicemail`, `app_confbridge`).
**Historique de correction** : une première version copiait le `menuselect.makeopts` de la VM de référence tel quel — approche abandonnée car ce fichier encode une détection de dépendances propre à la machine d'origine (`MENUSELECT_DEPSFAILED`), non valide sur une VM fraîche avec un jeu de bibliothèques différent (a causé un échec de compilation sur des modules comme `test_performance`).
**Dépendances** : paquets de compilation standards (`build-essential`, `libssl-dev`, etc.), `postgresql-client`, `libpq-dev`, `unixodbc-dev`.

---

### `postgresql/01_postgresql_install.yml`
**But** : installe PostgreSQL 15, crée les utilisateurs (`asterisk_user`, `a2billing_user`) et les deux bases (`asterisk_realtime`, `a2billing_db`) avec la locale `fr_FR.UTF-8`.
**Particularité technique** : utilise des commandes `psql` directes (`command:`) plutôt que les modules Ansible `postgresql_user`/`postgresql_db`, pour contourner un bug connu de gestion des ACL sur fichiers temporaires lors d'un `become_user` chaîné (root → postgres) sur cette VM.
**Fichiers** : aucun (SQL en ligne).

---

### `connexion-db-asterisk/02_odbc_pjsip_config.yml`
**But** : établit la connexion realtime entre Asterisk et PostgreSQL — c'est la couche qui permet à Asterisk de lire/écrire ses objets PJSIP, la messagerie vocale et le CDR directement en base, sans fichiers de configuration statiques par compte.
**Fichiers** :
- `odbc.ini` — déclaration du DSN `asterisk-connector`
- `res_odbc.conf` — pool de connexion ODBC côté Asterisk
- `sorcery.conf` — mapping des objets PJSIP (endpoint/auth/aor) vers le realtime
- `extconfig.conf` — mapping de chaque table realtime vers la connexion ODBC
- `cdr_adaptive_odbc.conf` — écriture du CDR en base (contient le correctif `quoted_identifiers="` indispensable à cause de la colonne réservée `end`)
- `voicemail.conf` — stockage de la messagerie vocale en base (BYTEA)
**Restart** : `sorcery.conf`/`extconfig.conf` nécessitent un **restart complet** d'Asterisk (lus uniquement au démarrage du noyau sorcery) — pas un simple reload.

---

### `database/03_database_schema.yml`
**But** : importe le schéma complet et les données des deux bases métier (`asterisk_realtime`, `a2billing_db`), extraites via `pg_dump` depuis la VM de référence.
**Fichiers** : `schema_asterisk_realtime.sql`, `schema_a2billing_db.sql`, `data_asterisk_realtime.sql`, `data_a2billing_db.sql`.
**Points techniques notables** :
- Import exécuté avec `-v ON_ERROR_STOP=1 --single-transaction` — arrête net et annule tout en cas d'erreur, plutôt que de laisser un état partiellement importé.
- Un correctif spécifique est appliqué après l'import du schéma A2Billing : `ALTER FUNCTION ... SET search_path = public` sur les fonctions trigger `cc_card_serial_set`/`cc_card_serial_update`, car `pg_dump` vide le `search_path` par sécurité au début des fichiers de données, ce qui casse les références non qualifiées de schéma dans ces fonctions (`UPDATE cc_card_seria` au lieu de `UPDATE public.cc_card_seria`).
- Import exécuté en tant que propriétaire réel des bases (`asterisk_user`/`a2billing_user`), jamais `postgres`, pour préserver la propriété correcte des objets.
**Fichiers à régénérer périodiquement** : ces 4 fichiers SQL doivent être re-dumpés depuis une VM de référence à jour à chaque évolution significative du schéma ou des données (nouvelles tables, tarification, comptes).

---

### `piper/04_piper_install.yml`
**But** : installe le moteur de synthèse vocale Piper (pour la génération dynamique des messages IVR à partir de texte stocké en base) et les sons français statiques d'Asterisk.
**Fichiers** : `sounds_fr.tar.gz` — copie fidèle du dossier `sounds/fr/` complet (Asterisk core + prompts A2Billing personnalisés, comme les annonces de devise `ariary`), pas le pack officiel Asterisk seul (qui ne contient pas les prompts A2Billing custom).
**Téléchargés en ligne** (pas copiés) : binaire Piper et modèle de voix française `fr_FR-siwis-medium.onnx` — artefacts tiers officiels non modifiés.
**Cache vocal** : le dossier `/var/lib/asterisk/sounds/piper-cache` est créé vide — c'est un artefact généré (hash MD5 du texte), jamais versionné.

---

### `agi-scripts/05_agi_scripts.yml`
**But** : copie les 12 scripts Python/AGI qui implémentent toute la logique métier dynamique (IVR, recharge, consultation de solde, gestion de messagerie, conférences).
**Fichiers** : 8 exécutables (`.agi`/`.py` autonomes) + 3 modules importés (`check_balance.py`, `piper_common.py`, `recharge.py`).
**Correctif CRLF→LF** : voir section dédiée ci-dessous.
**Note** : `check-balance.agi` et `recharge-agi.py` sont du code mort documenté (anciens points d'entrée AGI remplacés par le système IVR dynamique) mais conservés par précaution, sur décision explicite.

---

### `a2billing/06_a2billing_install.yml`
**But** : déploie le moteur PHP A2Billing patché pour compatibilité PHP 8.2.
**Fichiers** : `a2billing.php`, `a2billing.conf`, `common.tar.gz` (18 Mo — locales UI, images, `lib/` PHP patché), `vendor.tar.gz` (4,5 Mo — adodb patché, Smarty).
**Décision structurante** : `vendor/` n'est **jamais** régénéré via `composer install` — copié tel quel. Raison : `adodb/adodb-php` est déclaré en `dev-master` dans `composer.json` (branche mouvante), et un fichier patché (`adodb-error.inc.php`, `each()` → `foreach()` pour PHP 8) serait écrasé par une réinstallation fraîche.
**Correctif CRLF→LF** : voir section dédiée ci-dessous.
**Dossier de logs** : `/var/log/a2billing/` créé explicitement — le code PHP ne le crée pas lui-même.
**Symlink** : `agi-bin/lib` → `common/lib/`, seul lien symbolique de tout le projet.

---

### `confbridge/07_confbridge_conference.yml`
**But** : déploie la configuration ConfBridge (profils bridge/user par défaut).
**Fichiers** : `confbridge.conf`.
**Restart** : `module reload app_confbridge.so` suffit (pas de restart complet).
**Dépendances déjà en place avant ce rôle** : `conference-entry.agi` (rôle 05), table `conference_rooms` (rôle 03).

---

### `dialplan/08_dialplan.yml`
**But** : déploie le dialplan final, la pièce qui relie tous les rôles précédents entre eux.
**Fichiers** : `extensions.conf` (fichier minimal, contient uniquement `#include internal.conf`), `internal.conf` (le contenu réel : contexte `internal` avec `_1XXX` facturé, `_3XXX` conférences, menus IVR `900`/`960`/`961`/`970` déclarés individuellement).
**Évolution notable** : la structure a changé en cours de projet — le contexte s'appelait initialement `from-internal`/`ivr-entry` avec un pattern générique `_9XX`, puis a été renommé `internal` avec des menus déclarés un par un, suite à la mise en place du système de gestion dynamique de contextes (voir section correctifs).
**Restart** : `dialplan reload` suffit.
**Correctif CRLF→LF appliqué à posteriori** : voir section dédiée.

---

### `verify/09_restart_and_verify.yml`
**But** : restart complet d'Asterisk (état propre garanti) suivi d'une vérification exhaustive de tous les composants déployés par les rôles `00` à `08` (modules, connexion ODBC, endpoints PJSIP, dialplan, comptages de tables, scripts présents, symlink, Piper, sons FR).
**Fichiers** : aucun — rôle 100% vérification, ne déploie rien de nouveau.

---

### `api-auth/10_api_auth_db.yml`
**But** : crée une **troisième base de données**, `api_auth_db`, volontairement séparée des deux bases métier VoIP, dédiée à l'authentification de l'API elle-même (table `api_users` : username, password_hash BCrypt, role, enabled).
**Fichiers** : `schema.sql` (structure de `api_users`), `seed_user.sql` (compte admin initial, `ON CONFLICT DO NOTHING` pour l'idempotence).
**Justification de la séparation** : découplage propre entre la gestion des accès à l'API et les données métier de téléphonie/facturation — évite qu'une évolution de l'un affecte l'autre.

---

### `installation-docker/install_docker.yml`
**But** : installe Docker et Docker Compose sur la VM, prérequis du rôle `api-deployment`.

---

### `network-access/open_postgresql_network.yml`
**But** : ouvre l'accès réseau externe à PostgreSQL (`listen_addresses = '*'`) avec deux règles `pg_hba.conf` :
- `192.168.0.0/24` (scram-sha-256) — accès depuis la machine hôte Windows (IDE, psql), **dev uniquement**.
- `172.16.0.0/12` (md5) — accès depuis le réseau bridge Docker.


**Non intégré au Vagrantfile par défaut** — à exécuter manuellement quand nécessaire.

---

### `api-deployment/api_deployment.yml`
**But** : déploie l'API Spring Boot et le frontend via Docker Compose, en tirant des images publiées sur GitHub Container Registry (`ghcr.io/charliewalker-art/api-voip`, `ghcr.io/charliewalker-art/voip-front-end`) — aucune image n'est construite sur place.
**Fichiers** : `docker-compose.yml`, `.env` (secrets — mots de passe des 3 bases, `JWT_SECRET`, `ASTERISK_SSH_PASSWORD`), `nginx-proxy.conf`.
**Comportement volontairement non bloquant** : le rôle télécharge les images (étape naturellement bloquante) puis lance `docker compose up -d` **sans** attendre ni vérifier que les containers démarrent effectivement avec succès — l'IP/configuration réseau pouvant varier selon l'environnement de déploiement, un healthcheck bloquant donnerait de faux échecs.

---
