# Débogage et intégration A2Billing 1.7.0 sous PHP 8.2 — Documentation complète

Ce document récapitule l'ensemble des modifications de code, de configuration, et l'inventaire des tables de base de données réalisées pour faire fonctionner A2Billing 1.7.0 sous PHP 8.2, dans le cadre d'un projet VoIP Asterisk 20 / PostgreSQL 15.

---

## 1. Contexte général du projet

- **Asterisk 20.20.1**, transport SIP en TCP
- **PostgreSQL 15** — bases `asterisk_realtime` (PJSIP, IVR, CDR, Voicemail) et `a2billing_db` (facturation A2Billing)
- **A2Billing 1.7.0**, PHP 8.2 (`vendor/` géré par Composer, `common/lib/` = code métier A2Billing)
- **Piper TTS** (voix `fr_FR-siwis-medium`) pour toutes les annonces vocales dynamiques
- Scripts AGI en Python dans `/var/lib/asterisk/agi-bin/`
- Principe directeur du projet : **rien codé en dur** — textes, numéros de service, et paramètres doivent être modifiables en base de données

---

## 2. Correctifs PHP 8 — fichiers vendor patchés

### 2.1 Correctifs appliqués et vérifiés dans le cadre de ce travail

| # | Fichier | Ligne(s) | Problème | Correctif |
|---|---|---|---|---|
| 1 | `/var/lib/asterisk/common/lib/Class.MytoPg.php` | ~150 | `implode($tableau, $separateur)` — ordre d'arguments obsolète (PHP5), fatal en PHP8 | `implode($rep, ',')` → `implode(',', $rep)` |
| 2 | même fichier | ~135 | Même bug, occurrence différente (bloc `CONCAT`) | `implode($rep, ' \|\| ')` → `implode(' \|\| ', $rep)` |
| 3 | même fichier | ~142 (bloc `REPLACE`) | Bug de logique (pas un crash) : la boucle `foreach ($rep as &$value)` échappait aussi le texte de **remplacement**, pas seulement le motif de **recherche**, cassant la traduction du wildcard Asterisk `_.` en expression régulière PostgreSQL | Réécrit avec `preg_match()` + concaténation directe, limité au seul `$rep[1]` (le motif de recherche) |
| 4 | `/var/lib/asterisk/vendor/adodb/adodb-php/adodb-error.inc.php` | ~111 | `each()` — fonction supprimée en PHP 8.0 | `while (list($regexp,$code) = each($error_regexps))` → `foreach ($error_regexps as $regexp => $code)` |
| 5 | `/var/lib/asterisk/agi-bin/a2billing.php` | ~619 (mode `standard`, fin de boucle) | Pas un bug PHP8 — bug de logique métier : le verrou `cc_card.inuse` n'était **jamais libéré** en mode `standard`, bloquant définitivement un compte après son premier appel en conditions réelles | Ajout d'une ligne : `if ($A2B->set_inuse == 1) $A2B->callingcard_acct_start_inuse($agi, 0);` juste après `}//END FOR` |

**Ces correctifs sont indispensables** : sans eux, `rate_engine_findrates()` provoquait un crash PHP fatal silencieux à chaque recherche de tarif (bugs #1-3), et le calcul de coût d'appel plantait après un appel réussi (bug #4). Le bug #5 aurait bloqué chaque compte définitivement dès le premier appel réel.

### 2.2 Correctifs pré-existants (session antérieure, non vérifiés personnellement)

D'après le document de contexte transmis en début de reprise de ce projet, les 7 correctifs suivants avaient déjà été appliqués **avant** ce travail, dans une session précédente. Le code exact de ces correctifs n'a jamais été relu ni vérifié dans le cadre de ce travail — ils sont listés ici tels que documentés à l'origine :

1. Patch `FSROOT` (non défini dans le chemin AGI pur) — ajouté en haut de `a2billing.php`
2. `Misc.php` inclus deux fois → `include` → `include_once` (dans `a2billing.php`)
3. Syntaxe `{}` obsolète (30 occurrences) → `[]` dans `phpagi.php`
4. `phpagi_error_handler()` incompatible PHP8 → 5e paramètre rendu optionnel
5. Port manquant dans DSN PostgreSQL → `Class.Connection.php` corrigé
6. Même correction DSN dans `Class.A2Billing.php` (fonction `DbConnect()`, 2 occurrences)
7. Cache ADOdb cassé (`csv2rs()`) → désactivé pour la requête `cc_currencies`

---

## 3. Bugs de configuration/données découverts et corrigés

Distincts des bugs PHP8 — ce sont des valeurs de configuration en base incorrectes ou manquantes, sans lien avec le code.

| # | Table / Clé | Problème | Correctif |
|---|---|---|---|
| 1 | `cc_config.cid_enable` | À `0` (le fichier `/etc/a2billing.conf` n'est **jamais lu** au runtime — seule la base compte) | Mis à `1` |
| 2 | `cc_config.use_dnid` | À `0`, demandait une saisie DTMF au lieu d'utiliser l'extension composée | Mis à `1` |
| 3 | `cc_trunk` | Aucun trunk lié au tarif → aucun appel routable | Trunk réutilisé : `providertech='PJSIP'`, `providerip='%dialingnumber%'` (routage vers PJSIP interne) |
| 4 | `cc_trunk.trunkprefix` | Résidu `'011'` de l'ancien trunk d'exemple → préfixait tous les numéros composés | Vidé |
| 5 | `cc_ratecard.id_trunk` | `-1` (aucun lien) | Lié au trunk ci-dessus (`id_trunk=1`) |
| 6 | `cc_tariffgroup_plan` | Table vide — jamais peuplée lors de la config initiale, empêchant toute recherche de tarif | Ligne `(idtariffgroup=1, idtariffplan=1)` insérée |
| 7 | `cc_ratecard.chargea` | `1` — **piège de modèle de données** : A2Billing interprète toujours `chargea` comme un tarif **par minute**, pas par seconde. `chargea=1` signifiait donc involontairement "1 Ar = 1 minute" | Changé en `60` (60 Ar/minute = 1 Ar/seconde réel) |
| 8 | `cc_config.asterisk_version` | `1_4` — faisait générer une syntaxe `Dial()` avec des `\|` (pipe), incompatible avec Asterisk 20 moderne | Changé en `1_8` |
| 9 | `cc_config.auto_setcallerid` | `1` — protection anti-fraude d'A2Billing qui **écrase le CallerID par `0`** quand il est identique au compte appelant (systématique en usage interne où `username=extension=CallerID`), polluant le CDR (`src=0`) | Mis à `0` (système 100% interne, pas de risque de fraude externe) |
| 10 | `cc_config.dialcommand_param` | Contenait des paramètres d'avertissement périodique `L(%timeout%:61000:30000)` (annonces répétées "il vous reste X minutes", jugées gênantes) | Simplifié en `\|X\|HRirL(%timeout%)` (X = secondes de sonnerie avant `NOANSWER`, réglable ici) |
| 11 | `cc_config.number_try` | `3` — provoquait des ré-essais inutiles avec le même compte, source d'effets de bord sur le verrou `inuse` | Réduit à `1` |
| 12 | `cc_config.say_balance_after_auth` / `say_timetocall` | `1` — annonçaient systématiquement le solde/temps restant avant **chaque** appel, jugé trop intrusif | Passés à `0` (remplacés par un numéro de consultation dédié, voir section 5) |
| 13 | `cc_ratecard.rateinitial` / `initblock` / `billingblock` | **Incident découvert sur une VM reconstruite en IaC** : ces 3 colonnes valaient `0` (au lieu de `1`/`1`/`1`), alors que les fichiers PHP étaient identiques (mêmes hash) à la VM d'origine — preuve que le problème était un jeu de données incomplet, pas le code. Avec `rateinitial<=0`, A2Billing attribue une durée d'appel fixe énorme sans jamais vérifier le crédit réel | Restaurés à `1`/`1`/`1` |
| 14 | `cc_config.dialcommand_param` (absent) | Sur cette même VM IaC, la clé était **totalement absente** de `cc_config`, désactivant la limite de durée d'appel (`L()`) | Réinsérée manuellement |

**Point de vigilance pour les scripts de seed/Ansible** : l'incident #13/#14 montre qu'un dump ou script de seed incomplet de `a2billing_db` peut désactiver silencieusement à la fois la facturation correcte ET la coupure d'appel à crédit épuisé, sans qu'aucune erreur ne soit visible. Une contrainte SQL `CHECK` a été suggérée en garde-fou (non appliquée, à valider avant ajout) :
```sql
ALTER TABLE cc_ratecard ADD CONSTRAINT chk_timechargea_coherent
CHECK (chargea = 0 OR timechargea > 0);
```

---

## 4. Devise et tarification finale

- Devise : **Ariary (Ar)**, code `MGA`
- `cc_config.currency_association` : `usd:dollars,mxn:pesos,eur:euros,mga:ariarys,all:credit`
- Fichiers audio Piper générés : `/var/lib/asterisk/sounds/fr/ariary.gsm` et `ariarys.gsm` (contenu identique, l'Ariary ne se déclinant pas au singulier/pluriel)
- **Tarif final validé** : `cc_ratecard` (`id=1`) → `chargea=60` (= 1 Ar/seconde réel), `billingblocka=1`, `timechargea=999999`, `rateinitial=1`, `initblock=1`, `billingblock=1`, `id_trunk=1`, `dialprefix='_.'` (tout numéro)

---

## 5. Nouveaux services créés (numéros 960/961)

### Architecture retenue — entièrement pilotée par base de données

Comme pour l'IVR principal (`900`) et la messagerie (`970`), **aucune ligne `exten =>` dédiée** n'existe dans `extensions.conf` pour ces services — tout passe par le pattern générique `_9XX` déjà en place, et la table `ivr_menus`.

### Schéma `ivr_menus` (colonnes ajoutées)
```sql
ALTER TABLE ivr_menus ADD COLUMN is_balance_check boolean NOT NULL DEFAULT false;
ALTER TABLE ivr_menus ADD COLUMN is_recharge boolean NOT NULL DEFAULT false;
```
Lignes :
```
number='960', name='Recharge de compte',    is_recharge=true
number='961', name='Consultation de solde', is_balance_check=true
```

### Modules Python créés
- `/var/lib/asterisk/agi-bin/check_balance.py` — consultation de solde, fonction `run(callerid)`
- `/var/lib/asterisk/agi-bin/recharge.py` — recharge par code voucher, fonction `run(callerid)`, saisie via `GET DATA` (nouveauté introduite dans le projet pour la saisie multi-chiffres terminée par `#`)

**Contrainte technique notable** : ces deux modules ont dû être **renommés** (depuis `check-balance.agi` et `recharge-agi.py`) car un nom de fichier avec tiret est syntaxiquement invalide pour une instruction `import` Python. Ils sont maintenant importés directement par `ivr-dynamic.agi`, qui détecte `is_balance_check`/`is_recharge` dans `run_menu()` (même position/pattern que `is_voicemail_access` déjà existant) et leur délègue l'appel avec le `callerid` déjà lu.

### Textes vocaux — tous en base, aucun codé en dur
9 clés ajoutées à `ivr_system_settings` (`balance_no_credit_text`, `balance_announcement_template`, `recharge_no_callerid_text`, `recharge_technical_error_text`, `recharge_no_account_text`, `recharge_enter_code_text`, `recharge_invalid_prefix_text`, `recharge_success_template`, `recharge_max_tries_text`), lues via une nouvelle fonction centralisée `piper_common.get_setting_text(setting_key, **kwargs)` (gère sa propre connexion vers `asterisk_realtime`, support de templates avec placeholders `{credit}`/`{duration}`). `system-message.agi` a aussi été migré vers cette fonction pour éliminer la duplication de code.

**Test de validation de la modularité** : renommage temporaire `961→999` en base, confirmé fonctionnel par appel réel, sans toucher au dialplan ni redémarrer Asterisk.

---

## 6. Script anti-blocage : `reset-stale-inuse.agi`

Le correctif #5 (section 2.1) répare le cas normal, mais ne protège pas contre un processus PHP **tué brutalement** par Asterisk (ex: l'appelant raccroche pendant que `Dial()` sonne) — dans ce cas, aucun code PHP placé après ne peut s'exécuter, quel que soit l'endroit.

**Solution retenue (double protection)** : nouveau script `/var/lib/asterisk/agi-bin/reset-stale-inuse.agi`, appelé juste avant `a2billing.php` dans le dialplan :
```ini
same => n,AGI(reset-stale-inuse.agi,${CALLERID(num)})
same => n,AGI(a2billing.php,1)
```
Libère automatiquement le verrou `inuse` du compte appelant, uniquement s'il date de plus de **30 secondes** (`STALE_SECONDS`), pour ne jamais interrompre un appel réellement en cours. Validée comme l'architecture finale retenue pour ce problème (le nettoyage PHP normal ne peut pas être rendu 100% fiable seul).

---

## 7. Dialplan final — bloc `_1XXX` (`/etc/asterisk/extensions.conf`, contexte `[from-internal]`)

```ini
exten => _1XXX,1,AGI(get-setting.agi,max_call_duration_seconds,MAXCALLDURATION)
 same => n,Set(TIMEOUT(absolute)=${MAXCALLDURATION})
 same => n,AGI(reset-stale-inuse.agi,${CALLERID(num)})
 same => n,AGI(a2billing.php,1)
 same => n,GotoIf($["${DIALSTATUS}" = "CHANUNAVAIL"]?nonexist)
 same => n,GotoIf($["${DIALSTATUS}" = "BUSY"]?leavemsg)
 same => n,GotoIf($["${DIALSTATUS}" = "NOANSWER"]?leavemsg)
 same => n,Hangup()
 same => n(nonexist),Ringing()
 same => n,Wait(3)
 same => n,AGI(system-message.agi,nonexistent_number_text)
 same => n,Hangup()
 same => n(leavemsg),Set(CHANNEL(language)=fr)
 same => n,AGI(system-message.agi,unavailable_leave_message_text)
 same => n,VoiceMail(${EXTEN}@default)
 same => n,Hangup()
```

**Point d'architecture important** : le `Dial()` réel n'est **jamais** dans `extensions.conf` — il est exécuté **à l'intérieur** d'`a2billing.php` lui-même (via `$agi->exec("DIAL $dialstr")` dans `Class.RateEngine.php`, fonction `run_dial()`). Le dialplan ne fait que lire ensuite `${DIALSTATUS}`, déjà positionné par ce `Dial()` interne. Conséquence pratique : le **timeout de sonnerie** (avant `NOANSWER`) n'est pas modifiable dans `extensions.conf`, mais dans `cc_config.dialcommand_param` (le nombre entre les deux premiers `|`, ex: `|20|HRirL(%timeout%)` = 20 secondes de sonnerie).

**Points non résolus/à tester** (mentionnés en fin de session, sans confirmation finale) :
- Les valeurs exactes de `DIALSTATUS` pour les cas `BUSY`/`NOANSWER` n'ont jamais été confirmées empiriquement dans ce projet — seul `CHANUNAVAIL` et `ANSWER` ont été observés en conditions réelles
- Un cas signalé où un numéro composé mais indisponible jouait deux messages successifs ("indisponible" puis "n'existe pas"), et un cas où un numéro totalement inexistant bloquait l'appel sans aucun message — cause non formellement isolée avant la fin de ce travail

---

## 8. Inventaire des tables de base de données utilisées

### Base `asterisk_realtime`
| Domaine | Tables |
|---|---|
| PJSIP Realtime | `ps_endpoints`, `ps_auths`, `ps_aors`, `ps_transports` |
| Messagerie vocale | `voicemail`, `voicemail_messages` |
| IVR dynamique | `ivr_menus` (+ colonnes `is_voicemail_access`, `is_balance_check`, `is_recharge`), `ivr_options`, `ivr_services` |
| Textes système modifiables | `ivr_system_settings` (clé/valeur, utilisée par tous les scripts AGI) |

### Base `a2billing_db`
| Domaine | Tables |
|---|---|
| Comptes de facturation | `cc_card`, `cc_callerid` |
| Tarification | `cc_tariffplan`, `cc_tariffgroup`, `cc_tariffgroup_plan`, `cc_ratecard` |
| Routage | `cc_trunk` |
| Recharge | `cc_voucher`, `cc_logrefill` |
| CDR A2Billing | `cc_call` |
| Configuration | `cc_config` (clé/valeur/type/groupe, lue au runtime — **le fichier `/etc/a2billing.conf` ne sert qu'à la connexion DB initiale, jamais relu ensuite**) |
| Devises | `cc_currencies` |

---

## 9. Fichiers de code créés ou modifiés — récapitulatif final

| Fichier | Statut |
|---|---|
| `/var/lib/asterisk/common/lib/Class.MytoPg.php` | Vendor patché (3 correctifs PHP8) |
| `/var/lib/asterisk/vendor/adodb/adodb-php/adodb-error.inc.php` | Vendor patché (1 correctif PHP8) |
| `/var/lib/asterisk/agi-bin/a2billing.php` | Vendor patché (1 ligne, nettoyage `inuse`) |
| `/var/lib/asterisk/agi-bin/ivr-dynamic.agi` | Modifié (route `Dial`→`Goto`, ajout `callerid`, détection `is_balance_check`/`is_recharge`) |
| `/var/lib/asterisk/agi-bin/piper_common.py` | Modifié (ajout `get_setting_text()`) |
| `/var/lib/asterisk/agi-bin/system-message.agi` | Modifié (migration vers `get_setting_text()`) |
| `/var/lib/asterisk/agi-bin/reset-stale-inuse.agi` | Nouveau |
| `/var/lib/asterisk/agi-bin/check_balance.py` | Nouveau (remplace l'ancien `check-balance.agi`, supprimé) |
| `/var/lib/asterisk/agi-bin/recharge.py` | Nouveau (remplace l'ancien `recharge-agi.py`, supprimé) |
| `/etc/asterisk/extensions.conf` | Modifié (bloc `_1XXX`, suppression des lignes `960`/`961` en dur) |
| `/var/lib/asterisk/sounds/fr/ariary.gsm`, `ariarys.gsm` | Nouveaux (générés via Piper) |

---

## 10. Points restés ouverts en fin de mission

1. Test explicite du `960` (recharge) non refait après la migration vers `ivr_menus` (seul `961` a été retesté par renommage) — logique identique, mais pas revalidé empiriquement
2. `DIALSTATUS` exacts pour `BUSY`/`NOANSWER` jamais confirmés par test réel isolé
3. Bug de double message vocal / blocage silencieux sur numéro inexistant — cause non formellement isolée
4. Origine de l'incident #13/#14 (section 3) sur la VM IaC reconstruite — jamais identifiée avec certitude (script de seed suspecté, non confirmé)
5. Fonctionnalité ConfBridge (salles de conférence, plage `_3XXX`) — restée au stade de discussion de conception dans ce fil ; aucun code, script ou table (`conference_rooms`) n'a été réellement écrit ou vérifié ici malgré des références y faisant allusion dans des échanges ultérieurs (probablement issues d'une autre session de travail sur le même projet)