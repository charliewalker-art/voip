# Documentation Technique — Backend API VoIP

Projet Spring Boot exposant en CRUD un système Asterisk 20 (PJSIP) + A2Billing 1.7.0, avec un sous-système de dialplan dynamique piloté par base de données.

- **Stack** : Spring Boot 4.1.0, Java 25, Maven, Spring Data JPA, Spring Security (JWT), Lombok
- **Package racine** : `com.charlie.voip`
- **Déploiement** : Docker (image publiée sur `ghcr.io/charliewalker-art/api-voip`), build/push automatique via GitHub Actions
- **Serveur cible Asterisk** : VM Vagrant/Debian, IP `192.168.0.118`

---

## 1. Architecture générale

### 1.1 Trois bases de données PostgreSQL distinctes

| Base | Contenu | Persistence Unit |
|---|---|---|
| `asterisk_realtime` | Comptes SIP, voicemail, IVR, contextes dynamiques, conférences, CDR | `asterisk` |
| `a2billing_db` | Facturation, tarification, vouchers, config A2Billing | `a2billing` |
| `api_auth_db` | Comptes admin de l'API (`api_users`) | `auth` |

Chaque base a son propre `DataSource`, `EntityManagerFactory` et `PlatformTransactionManager` (configs dans `config/AsteriskDbConfig.java`, `A2BillingDbConfig.java`, `AuthDbConfig.java`). **Aucune transaction distribuée cross-base n'est possible** — toute opération touchant 2 bases (ex. création composite d'utilisateur) utilise un rollback manuel en cas d'échec partiel, pas une vraie transaction ACID inter-bases.

### 1.2 Sécurité

Authentification JWT stateless. Un seul rôle (`ADMIN`) actuellement, mappé en `GrantedAuthority` pour permettre une extension future sans refonte. Pas d'endpoint de création de compte admin — ajout uniquement via SQL direct sur `api_users` (mot de passe haché en BCrypt).

Toutes les routes sauf `POST /api/auth/login` exigent `Authorization: Bearer <token>` (expiration 24h).

### 1.3 Sous-système "dialplan dynamique"

`asterisk_contexts` (+ tables liées) est la **source de vérité** pour le dialplan Asterisk. Un contexte est traduit en fichier `.conf` (`DialplanGeneratorService`), puis déployé sur le serveur réel via Ansible/SSH (`AnsibleApplyService`), qui gère aussi automatiquement l'inclusion (`#include`) dans `extensions.conf` et le rechargement du dialplan. Voir section 6 pour le détail des entités et section 8 pour le flux complet.

---

## 2. Arborescence des fichiers

```
src/main/java/com/charlie/voip/
│
├── VoipApplication.java                  — point d'entrée, exclut DataSourceAutoConfiguration
│
├── config/
│   ├── AsteriskDbConfig.java             — DataSource/EMF/TxManager pour asterisk_realtime
│   ├── A2BillingDbConfig.java            — idem pour a2billing_db
│   ├── AuthDbConfig.java                 — idem pour api_auth_db
│   └── SecurityConfig.java               — JWT, CORS, chaîne de filtres
│
├── security/
│   ├── JwtUtil.java                      — génération/validation des tokens
│   ├── JwtAuthenticationFilter.java      — intercepteur de requêtes
│   ├── CustomUserDetailsService.java     — charge un AdminUser pour Spring Security
│   └── SensitiveConfigKeys.java          — listes blanche/noire pour cc_config
│
├── exception/
│   └── GlobalExceptionHandler.java       — mappe les exceptions vers des réponses JSON propres
│
├── entity/                               — voir section 5 pour le détail par domaine
│   ├── auth/        (AdminUser)
│   ├── sip/          (PsEndpoint, PsAuth, PsAor)
│   ├── voicemail/    (Voicemail)
│   ├── billing/       (CcCard, CcCallerid)
│   ├── tariff/        (CcTariffplan, CcTariffgroup, CcRatecard, CcPrefix)
│   ├── voucher/       (CcVoucher, CcLogrefill)
│   ├── config/         (CcConfig)
│   ├── ivr/           (IvrMenu, IvrService, IvrOption, IvrSystemSetting)
│   ├── conference/     (ConferenceRoom, ConferenceBillingLog)
│   ├── context/        (AsteriskContext, AsteriskContextInclude, AsteriskContextIvr,
│   │                     AsteriskContextConference, AsteriskRangeRegistry)
│   └── cdr/            (Cdr)
│
├── repository/                           — un repository par entité, même arborescence
│
├── dto/                                  — CreateRequest/UpdateRequest/Response par domaine
│
├── service/                              — logique métier, un service par domaine
│   └── user/UserProvisioningService.java — orchestrateur composite (SIP+voicemail+billing)
│
└── controller/                           — un controller par domaine, exposant les endpoints REST

src/main/resources/
├── application.properties
└── ansible_storage/
    ├── apply_context.yml                 — playbook déployé sur le serveur Asterisk
    └── inventory.ini
```

---

## 3. Variables d'environnement (`.env`)

```bash
# --- Base asterisk_realtime ---
ASTERISK_DB_HOST=192.168.0.118
ASTERISK_DB_PORT=5432
ASTERISK_DB_NAME=asterisk_realtime
ASTERISK_DB_USER=asterisk_user
ASTERISK_DB_PASSWORD=<...>

# --- Base a2billing_db ---
A2BILLING_DB_HOST=192.168.0.118
A2BILLING_DB_PORT=5432
A2BILLING_DB_NAME=a2billing_db
A2BILLING_DB_USER=a2billing_user
A2BILLING_DB_PASSWORD=<...>

# --- Base api_auth_db ---
AUTH_DB_HOST=192.168.0.118
AUTH_DB_PORT=5432
AUTH_DB_NAME=api_auth_db
AUTH_DB_USER=api_user
AUTH_DB_PASSWORD=<...>

# --- JWT ---
JWT_SECRET=<clé aléatoire ≥256 bits>

# --- Ansible / déploiement Asterisk ---
ANSIBLE_STORAGE_PATH=/opt/ansible_storage    # /chemin/local en dev Windows
ASTERISK_SSH_HOST=192.168.0.118
ASTERISK_SSH_USER=vagrant
ASTERISK_SSH_PASSWORD=<...>

# --- CORS (frontend) ---
FRONTEND_ORIGIN=http://192.168.0.120:3000
```

Toutes ces variables sont référencées dans `application.properties` via `${VAR}` et injectées dans les `*DbConfig.java`/services via `@Value`. Jamais de credentials en dur dans le code.

**Paramètres JPA fixes (non liés à `.env`)** : `spring.jpa.hibernate.ddl-auto=validate` (jamais `update`/`create` — le schéma existe déjà, Hibernate ne fait que vérifier la correspondance), `spring.sql.init.mode=never`.

---

## 4. Résumé des entités par domaine (avec pièges connus)

### 4.1 Auth (`api_auth_db`)
- **`AdminUser`** → `api_users`. `id` en `Integer` (⚠️ `SERIAL`, pas `BIGINT`).

### 4.2 SIP (`asterisk_realtime`)
- **`PsEndpoint`**, **`PsAuth`**, **`PsAor`** → `ps_endpoints`/`ps_auths`/`ps_aors`.
- ⚠️ `ps_auths.auth_type` et `ps_aors.remove_existing` et `ps_endpoints.direct_media` sont des **ENUM PostgreSQL** (`pjsip_auth_type_values_v2`, `ast_bool_values`) — nécessitent `@ColumnTransformer(write = "?::type_enum")`, pas de simple `varchar`.
- ⚠️ **Règle métier verrouillée** : `ps_auths.username` DOIT toujours être égal à `ps_endpoints.id` (confirmé par test réel Linphone — sinon Asterisk PJSIP `identify_by=username` ne trouve pas l'endpoint avant même de vérifier le mot de passe). Jamais exposé en écriture indépendante.

### 4.3 Voicemail (`asterisk_realtime`)
- **`Voicemail`** → `voicemail`. Seuls `context`, `mailbox`, `password`, `fullname`, `email` exposés.
- ⚠️ `voicemail.mailbox` DOIT toujours être égal au numéro utilisateur (même logique que `ps_auths.username`).
- `voicemail.password` (consultation messagerie) doit être exactement 4 chiffres.

### 4.4 Billing (`a2billing_db`)
- **`CcCard`** → `cc_card`. `tariff` en `Integer` (référence `cc_tariffplan.id`, pas un texte). Triggers PostgreSQL gèrent `id_seria`/`serial` automatiquement — jamais mappés. `activated` forcé à `true`, `currency`/`language` forcés à `MGA`/`fr` à la création.
- **`CcCallerid`** → `cc_callerid`.

### 4.5 Tarification (`a2billing_db`)
- **`CcTariffplan`** → `cc_tariffplan`. `UNIQUE(iduser, tariffname)` en base.
- **`CcTariffgroup`** → `cc_tariffgroup`. **Aucune contrainte unique en base** — vérification applicative sur `tariffgroupname`. **Étape souvent oubliée mais indispensable** : sans ligne dans cette table, le moteur A2Billing ne peut pas relier `cc_card.tariff` à la grille tarifaire, même si tout le reste existe.
- **`CcRatecard`** → `cc_ratecard`. ⚠️ **Piège critique double** :
  - `chargea` est un tarif **par minute** en base — l'API expose/reçoit `ratePerSecondDisplay`, converti automatiquement (`×60` en écriture, `÷60` en lecture).
  - `billingblocka`/`timechargea` **ne doivent jamais être 0/NULL** quand `chargea>0`, sinon A2Billing bascule silencieusement vers un ancien modèle de tarification cassé (incident réel documenté). Le service force toujours `billingblocka=1`, `timechargea=999999`. Une contrainte `CHECK` en base (`chk_timechargea_coherent`) protège aussi contre une écriture SQL directe incorrecte.
  - `id_trunk` fixé automatiquement en interne (`DEFAULT_TRUNK_ID=1`), pas exposé publiquement.
- **`CcPrefix`** → `cc_prefix`. Référencé par `cc_ratecard.destination`.

### 4.6 Vouchers (`a2billing_db`)
- **`CcVoucher`** → `cc_voucher`. `usedcardnumber`/`usedate` jamais en écriture (remplis par `recharge.py`, hors périmètre). Génération de codes 12 chiffres via `SecureRandom`, unicité vérifiée en base.
- **`CcLogrefill`** → `cc_logrefill`, lecture seule. ⚠️ `refill_type`/`added_invoice` sont en `SMALLINT` (`Short` en Java, pas `Integer`/`Boolean`).

### 4.7 Config A2Billing (`a2billing_db`)
- **`CcConfig`** → `cc_config`. PK simple sur `id` (pas composite). 🔴 `manager_secret`, `api_security_key`, `transaction_key`, `csrf_token_salt` **jamais exposés**, même en lecture (`SensitiveConfigKeys`). Table jamais vidée par le nettoyage (config système).
- Endpoint dédié `ring-timeout` : modifie uniquement le délai de sonnerie dans `dialcommand_param` sans risquer de casser le reste du format.

### 4.8 IVR (`asterisk_realtime`)
- **`IvrMenu`** → `ivr_menus`. `number` doit matcher `^9\d{2}$`. 3 flags (`isVoicemailAccess`/`isBalanceCheck`/`isRecharge`) mutuellement exclusifs, incompatibles avec la présence d'options. ⚠️ Dans les DTO, ces champs sont en **`Boolean`** (objet), jamais `boolean` primitif — un booléen primitif préfixé `is` casse la désérialisation Jackson (Lombok génère `setVoicemailAccess()` sans le `is`, Jackson cherche `setIsVoicemailAccess()` → la valeur envoyée est silencieusement ignorée).
- **`IvrService`** → `ivr_services`. Aucune contrainte unique en base — vérification applicative sur `name`.
- **`IvrOption`** → `ivr_options`. `menu_id` en vraie FK (`ON DELETE CASCADE`). ⚠️ `action_target` est un `varchar` en base (pas un `integer`), toujours en `String` côté Java.
- **`IvrSystemSetting`** → `ivr_system_settings`. Liste blanche stricte de 13 clés, jamais de création libre. Table jamais vidée par le nettoyage. Templates (`balance_announcement_template`, `recharge_success_template`) contiennent des placeholders `{credit}`/`{duration}` jamais interprétés côté API.

### 4.9 Conférences (`asterisk_realtime`)
- **`ConferenceRoom`** → `conference_rooms`. `ratePerSecond` **déjà** en tarif/seconde réel (pas de conversion, contrairement à `cc_ratecard.chargea`) — système de facturation totalement indépendant de la tarification des appels classiques.
- **`ConferenceBillingLog`** → `conference_billing_log`, lecture seule.

### 4.10 Dialplan dynamique (`asterisk_realtime`)
- **`AsteriskContext`** → `asterisk_contexts`. Représente un contexte Asterisk complet (facturation/conférence/IVR inclus).
- **`AsteriskContextInclude`** → `asterisk_context_includes`. Autres contextes inclus (`include =>`).
- **`AsteriskContextIvr`** → `asterisk_context_ivrs`. Référence directement `IvrMenu` (⚠️ historiquement référençait une table `asterisk_ivr_catalog` séparée, supprimée après détection d'une redondance de données dangereuse — `ivr_menus` est l'unique source de vérité désormais).
- **`AsteriskContextConference`** → `asterisk_context_conferences`. Référence `ConferenceRoom`.
- **`AsteriskRangeRegistry`** → `asterisk_range_registry`. Registre des plages de numérotation déjà allouées, pré-rempli avec les plages legacy (`_1XXX`, `_3XXX`, `_9XX`) pour ne jamais les réattribuer par erreur.

### 4.11 CDR (`asterisk_realtime`) — lecture seule
- **`Cdr`** → `cdr`. Aucune vraie clé primaire en base ; `uniqueid` sert d'identifiant technique. ⚠️ `end` est un mot réservé SQL (`@Column(name = "\"end\"")`). Asterisk peut légitimement écrire des lignes dupliquées (canaux Local, certains `NO ANSWER`/`BUSY`) — **dédoublonnage automatique sur `uniqueid` côté service**, jamais côté client à gérer.

---

## 5. Endpoints — résumé par domaine

Voir `API_DOCUMENTATION.md` pour le détail complet des requêtes/réponses JSON. Résumé :

| Domaine | Base path | Notes |
|---|---|---|
| Auth | `/api/auth/login` | Seule route publique |
| Comptes SIP | `/api/sip-accounts` | + `/{id}/password` |
| **Création composite utilisateur** | `/api/users` | `POST` = SIP+voicemail+billing en une fois avec rollback manuel ; `DELETE` = suppression en cascade sur les 3 |
| Voicemail | `/api/voicemail/{id}/password` | Lecture seule du mot de passe messagerie |
| Facturation | `/api/billing-accounts` | + `/{username}/credit` (PATCH, delta +/-) |
| Contextes | `/api/contexts` | + `/{nom}/generate`, `/{nom}/apply` |
| Menus IVR | `/api/ivr-menus` | + `/{id}/full`, `/{menuId}/options` |
| Services IVR | `/api/ivr-services` | |
| Options IVR | `/api/ivr-options/{id}` | DELETE seul (création via `/ivr-menus/{menuId}/options`) |
| Textes système IVR | `/api/ivr-system-settings` | Pas de POST/DELETE |
| Conférences | `/api/conference-rooms` | + `/{roomNumber}/billing-log` |
| Plans tarifaires | `/api/tariffplans` | |
| Groupes tarifaires | `/api/tariffgroups` | |
| Préfixes | `/api/prefixes` | |
| Grille tarifaire | `/api/ratecards` | |
| Vouchers | `/api/vouchers` | + `/batch` (POST), `/logrefill/{cardId}` |
| Config A2Billing | `/api/config` | + `/ring-timeout` |
| CDR | `/api/cdr` | Lecture seule, + `/by-number/{n}`, `/by-date-range`, `/stats` |

---

## 6. Flux de démarrage (ordre des dépendances)

Pour provisionner un environnement complet depuis zéro, l'ordre **obligatoire** (dépendances entre domaines) :

1. Login
2. Tarification complète : `tariffplans` → `tariffgroups` → `prefixes` → `ratecards` (les 4, sinon la facturation échoue silencieusement)
3. Menus IVR (+ services/options si menus interactifs)
4. Contexte (`POST /api/contexts` puis `POST /api/contexts/{nom}/apply`)
5. Utilisateurs (`POST /api/users`) — nécessite un contexte et un tariffplan existants

Voir `RAPPORT_FLUX_FRONTEND.md` pour le détail requête par requête.

---

## 7. Incidents/pièges déjà rencontrés et corrigés (récapitulatif)

1. Types ENUM PostgreSQL PJSIP non gérés par défaut par Hibernate → `@ColumnTransformer`
2. Packages Spring Boot 4.1.0 réorganisés en modules (`DataSourceAutoConfiguration`, `DataSourceProperties` déplacés vers `org.springframework.boot.jdbc.autoconfigure`)
3. `DataSourceBuilder` ne supporte pas le binding `@ConfigurationProperties` direct → utiliser `DataSourceProperties`
4. Incohérences de types entre le schéma documenté initialement et le schéma réel (`tariff` integer pas varchar, `action_target` varchar pas integer, `added_invoice`/`refill_type` smallint pas boolean/integer) — **toujours vérifier le schéma réel via `\d table` avant de mapper une entité**
5. Bug Jackson/Lombok sur les booléens primitifs préfixés `is` → toujours utiliser `Boolean` (objet) dans les DTO pour ce cas
6. `extensions.conf` non géré automatiquement à l'origine → playbook corrigé pour gérer `#include` de façon idempotente + rechargement du module `pbx_config` si absent au démarrage
7. Chaîne de tarification incomplète (`tariffgroup` manquant) → appels non facturables silencieusement
8. `cc_ratecard.billingblocka`/`timechargea` à 0 → bascule silencieuse vers un modèle de tarification cassé (incident documenté, corrigé par valeurs forcées + contrainte CHECK)
9. CDR avec doublons (pas de clé primaire réelle sur `cdr`) → dédoublonnage applicatif sur `uniqueid`