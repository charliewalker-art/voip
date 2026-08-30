# Documentation Frontend — Interface d'administration VoIP

## 1. Stack technique

- **React 19** + **Vite** + **TypeScript**
- **Tailwind CSS v4**
- **react-router-dom v7** (mode data router : `createBrowserRouter`)
- **axios** — appels HTTP vers le backend
- **lucide-react** / **react-icons** — icônes
- **jspdf** — export PDF (utilisé pour les lots de vouchers)
- **qrcode.react** — génération de QR codes (vouchers)
- **@stomp/stompjs** + **sockjs-client** — présents dans les dépendances pour un futur usage temps réel (non utilisés à ce jour)

## 2. Arborescence des fichiers

```
src/
├── main.tsx                  # Point d'entrée Vite/React
├── App.tsx                   # Monte <RouterProvider router={router} />
├── router.tsx                # Déclaration de toutes les routes (createBrowserRouter)
├── index.css                 # Import Tailwind
│
├── config/
│   └── navigation.ts          # Liste des entrées de la sidebar (label, path, icône)
│
├── components/
│   ├── Layout.tsx              # Structure globale : Sidebar + <Outlet /> avec scroll indépendant
│   ├── Sidebar.tsx              # Menu de navigation latéral + bouton déconnexion
│   └── ProtectedRoute.tsx        # Vérifie la présence du token, redirige vers /login sinon
│
├── hooks/
│   ├── axios.ts                # Instance axios centralisée (baseURL + intercepteur Authorization)
│   ├── useAuth.ts               # Connexion/déconnexion, état isAuthenticated
│   ├── useTarification.ts       # State + CRUD Tarification
│   ├── useIvr.ts                # State + CRUD IVR (menus/services/options/textes système/ring-timeout)
│   ├── useContexts.ts           # State + CRUD Contextes + generate/apply
│   ├── useUsers.ts              # State + CRUD Utilisateurs (fusion sip-accounts + billing-accounts)
│   ├── useVouchers.ts           # State + CRUD Vouchers (cartes de crédit) + logrefill
│   ├── useConferences.ts        # State + CRUD Conférences + billing-log
│   ├── useCdr.ts                # State + recherche CDR (tout / par numéro / par période)
│   └── useDashboard.ts          # Agrège les stats du tableau de bord
│
├── services/
│   ├── auth.service.ts
│   ├── tarification.service.ts
│   ├── ivr.service.ts
│   ├── context.service.ts
│   ├── user.service.ts
│   ├── voucher.service.ts
│   ├── conference.service.ts
│   ├── cdr.service.ts
│   └── dashboard.service.ts     # Agrège plusieurs endpoints existants
│
├── types/
│   ├── auth.types.ts
│   ├── api.types.ts
│   ├── tarification.types.ts
│   ├── ivr.types.ts
│   ├── context.types.ts
│   ├── user.types.ts
│   ├── voucher.types.ts
│   ├── conference.types.ts
│   ├── cdr.types.ts
│   └── dashboard.types.ts
│
├── pages/
│   ├── LoginPage.tsx
│   ├── DashboardPage.tsx
│   ├── TarificationPage.tsx
│   ├── IvrPage.tsx
│   ├── ContextPage.tsx
│   ├── UsersPage.tsx
│   ├── VouchersPage.tsx          # Affichée sous le titre "Cartes de crédit"
│   ├── ConferencesPage.tsx
│   └── CdrPage.tsx
│
└── ui/
    ├── shared/
    │   ├── Field.tsx              # Label + input réutilisable (seul composant visuel partagé entre sections)
    │   └── LogoutConfirmModal.tsx  # Popup de confirmation de déconnexion
    │
    ├── login/                    # Composants spécifiques à LoginPage
    ├── tarification/             # Tables/Forms/DeleteConfirmModal dédiés à cette section
    ├── ivr/                      # idem, + MenuDetailPanel, OptionTable/Form, SystemSettingsTable, RingTimeoutCard
    ├── contexts/                 # idem, + GenerateResultModal, ApplyResultModal
    ├── users/                    # idem, + PasswordModal (SIP/voicemail), CreditModal
    ├── vouchers/                 # idem, + VoucherQrModal, BatchResultModal, RefillLogSearch/Modal
    ├── conferences/              # idem, + BillingLogModal
    ├── cdr/                      # CdrFilters, CdrStatsBar, CdrTable
    └── dashboard/                # StatCard, RecentCallsTable, QuickActions
```

### Convention de duplication (choix assumé du projet)

Chaque section (`tarification/`, `ivr/`, `contexts/`, `users/`, `vouchers/`, `conferences/`) a **son propre** `DeleteConfirmModal.tsx`, ses propres fonctions de service, etc. — le code est volontairement dupliqué entre sections plutôt que partagé, pour garder chaque domaine métier totalement indépendant et modifiable sans risque de régression ailleurs.

**Exception** : les composants **purement visuels, sans logique métier** (`Field`, `LogoutConfirmModal`) sont mutualisés dans `ui/shared/`.

## 3. Rôle de chaque page

| Page | Route | Rôle |
|---|---|---|
| **Login** | `/login` | Authentification (`POST /api/auth/login`), stocke le token en `localStorage` |
| **Dashboard** | `/dashboard` | Vue d'ensemble : KPI (utilisateurs, appels du jour, contextes déployés, vouchers disponibles), 5 derniers appels, accès rapides |
| **Tarification** | `/tarification` | Gestion des Plans tarifaires, Groupes tarifaires, Préfixes et Grilles tarifaires (4 onglets) |
| **IVR** | `/ivr` | Gestion des Menus IVR (avec leurs options DTMF imbriquées), des Services (destinations), des Textes système (13 clés), et du Délai de sonnerie global (4 onglets) |
| **Contextes** | `/contextes` | Création/édition de contextes Asterisk (facturation, conférence, IVR/contextes/salles inclus), génération et déploiement du dialplan (`.conf`) |
| **Utilisateurs** | `/utilisateurs` | Création composite (SIP + messagerie vocale + facturation), consultation des mots de passe, crédit/débit, suppression composite |
| **Cartes de crédit** | `/vouchers` | Génération de lots de vouchers (avec export PDF et QR code), suppression, recherche d'historique de recharge par numéro d'utilisateur |
| **Conférences** | `/conferences` | Gestion des salles de conférence, consultation du journal de facturation par salle |
| **CDR** | `/cdr` | Historique d'appels : tous / par numéro / par période, avec statistiques agrégées |

## 4. Communication avec le backend

- **`hooks/axios.ts`** : instance axios unique, `baseURL` lue depuis `import.meta.env.VITE_API_BASE_URL` (variable de **build**, jamais d'IP en dur dans le code source).
- **En production**, cette variable est buildée **vide** — tous les appels API deviennent des chemins relatifs (`/api/...`), qui partent vers le même hôte que la page web. C'est le reverse-proxy qui route ensuite `/api/*` vers le backend (voir le second document `CI_CD_ET_DEPLOIEMENT.md`).
- Un intercepteur ajoute automatiquement `Authorization: Bearer <token>` sur chaque requête, et nettoie le `localStorage` en cas de `401`.

## 5. Authentification et routes protégées

- `ProtectedRoute.tsx` vérifie la simple présence d'un token dans `localStorage` (pas d'appel serveur à chaque navigation).
- `router.tsx` imbrique toutes les routes métier sous `ProtectedRoute` → `Layout` → `<Outlet />`.
- La déconnexion (`Sidebar.tsx`) affiche une popup de confirmation, vide le token, **et navigue explicitement** vers `/login` (point important : sans cette navigation explicite, React Router ne réagit pas seul à un changement brut de `localStorage`).

## 6. Système de design

- **Palette** : fond clair `#F7F8FA`, texte `#1A1D23`, accent sarcelle `#0EA5A8`, bordures `#E2E5EA`. Couleurs de statut : vert `#16A34A` (succès), ambre `#D97706` (attente), rouge `#DC2626` (échec).
- **Typographie** : `Inter` pour l'UI, police monospace pour toutes les données techniques (numéros, ids, durées, montants, codes).
- **Composants récurrents** : badges de statut colorés (actif/inactif, facturé/gratuit, disposition d'appel...), icônes d'action `lucide-react` (plutôt que des boutons texte), boutons "Actualiser" avec icône qui tourne pendant le chargement, `Field` (label toujours visible au-dessus du champ, jamais de placeholder seul).
- **Modals de confirmation de suppression** systématiques avant toute action destructive.

## 7. Limitations connues

- **Suppression de contexte** : nettoie la base ET le serveur Asterisk (fichier `.conf` + ligne `#include` + reload dialplan) via un playbook Ansible dédié (`remove_context.yml`), en best-effort (n'échoue pas si le serveur est injoignable).
- **Suppression d'utilisateur** : utilise `DELETE /api/users/{id}`, endpoint composite qui nettoie SIP + messagerie vocale + compte de facturation en une fois.
- **Flag `activated` (billing-accounts)** : actuellement masqué de l'interface (`BillingEditModal`) — son comportement exact sur les appels classiques n'a pas été confirmé côté backend (seul confirmé : il ne touche jamais l'enregistrement SIP). À réactiver une fois le comportement vérifié.
- **Options IVR** : pas de modification possible (uniquement créer/lister/supprimer), l'API ne documentant pas de `PUT` pour cette entité.
- **Numéros de menu IVR** : contrainte backend stricte `^9\d{2}$` (doit commencer par 9, 3 chiffres) — non assouplie à ce jour.