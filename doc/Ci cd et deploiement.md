# Documentation CI/CD et Déploiement — Frontend VoIP

## 1. Vue d'ensemble de l'architecture de déploiement

```
Internet / réseau local
        │
        ▼
┌─────────────────────┐  Port 8000 exposé sur la VM
│   reverse-proxy      │  (nginx:stable-alpine)
│   (seul point        │
│    d'entrée public)  │
└──────────┬───────────┘
           │
     réseau Docker interne (créé automatiquement par docker-compose)
           │
   ┌───────┴────────┐
   ▼                ▼
┌─────────────┐  ┌──────────────┐
│ voip-frontend│  │ voip-backend │
│ (nginx:      │  │ (Java/Spring,│
│  stable-     │  │  port 8080,  │
│  alpine,     │  │  jamais      │
│  port 80,    │  │  exposé à    │
│  jamais      │  │  l'extérieur)│
│  exposé à    │  │              │
│  l'extérieur)│  │              │
└─────────────┘  └──────────────┘
```

- **Seul `reverse-proxy` expose un port sur l'hôte** (`8000:80`). `voip-frontend` et `voip-backend` sont invisibles depuis l'extérieur de la VM — uniquement joignables entre conteneurs via le DNS interne Docker (résolution par nom de service).
- Le navigateur ne voit **qu'une seule origine** (`http://<ip-vm>:8000`), ce qui élimine tout problème CORS entre front et back.

## 2. Build de l'image frontend

### Dockerfile (multi-stage)

```dockerfile
# --- Étape 1 : Construction ---
FROM node:20-alpine AS build

ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# --- Étape 2 : Serveur de production ---
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

**Points importants :**
- `VITE_API_BASE_URL` est une variable **de build** (Vite l'injecte dans le JS au moment de `npm run build`), pas une variable d'environnement runtime — elle doit être passée en `ARG` Docker, jamais lue depuis un `.env` monté dans le conteneur final.
- En production, cette variable est buildée **vide** (`VITE_API_BASE_URL=`) : les appels axios deviennent relatifs à l'origine courante, qui passe systématiquement par le reverse-proxy.
- `npm install` est utilisé plutôt que `npm ci` : le `package-lock.json` généré sous Windows peut différer de ce qu'attend `npm ci` sous Linux Alpine (dépendances optionnelles liées à la plateforme, ex. `@emnapi/*`) — `npm install` est tolérant à cet écart, `npm ci` ne l'est pas.

### nginx.conf (fallback SPA, embarqué dans l'image frontend)

```nginx
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

Nécessaire car `react-router-dom` (mode `createBrowserRouter`) gère la navigation côté client — sans ce fallback, un rafraîchissement de page sur une route comme `/tarification` renverrait une 404 nginx (le fichier `tarification` n'existe pas sur le disque).

## 3. Pipeline CI/CD — GitHub Actions

### `.github/workflows/docker-build.yml`

```yaml
name: Docker Build and Publish

on:
  push:
    branches: [ "main" ]

env:
  REGISTRY: ghcr.io

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      packages: write
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Lowercase repo name
        run: echo "IMAGE_NAME=${GITHUB_REPOSITORY,,}" >> $GITHUB_ENV

      - name: Bump version and push tag
        id: tag_version
        uses: anothrNick/github-tag-action@1.71.0
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          WITH_V: true
          DEFAULT_BUMP: patch
          RELEASE_BRANCHES: main

      - name: Log in to the Container registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=raw,value=${{ steps.tag_version.outputs.new_tag }}
            type=raw,value=latest

      - name: Build and push Docker image
        uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          build-args: |
            VITE_API_BASE_URL=
          cache-from: type=gha
          cache-to: type=gha,mode=max
```

**Comportement :**
- Déclenché à chaque push sur `main`.
- `anothrNick/github-tag-action` incrémente automatiquement un tag SemVer (`v0.0.1` → `v0.0.2` → ...) à chaque exécution.
- L'image est publiée sur `ghcr.io/<owner>/<repo>` avec deux tags : la version générée ET `latest`.
- `VITE_API_BASE_URL=` (vide) est fixé ici, une fois pour toutes — le reverse-proxy se charge de tout le routage ensuite, jamais d'IP en dur dans le code buildé.

## 4. Déploiement — Docker Compose

### `docker-compose.yml`

```yaml
services:
  voip-backend:
    image: ghcr.io/charliewalker-art/api-voip:v0.0.19
    container_name: voip-backend
    env_file:
      - .env
    volumes:
      - /opt/ansible_storage:/opt/ansible_storage
    restart: unless-stopped
    extra_hosts:
      - "host.docker.internal:host-gateway"

  voip-frontend:
    image: ghcr.io/charliewalker-art/voip-front-end:v0.0.3
    container_name: voip-frontend
    restart: unless-stopped

  reverse-proxy:
    image: nginx:stable-alpine
    container_name: reverse-proxy
    ports:
      - "8000:80"
    volumes:
      - ./nginx-proxy.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - voip-backend
      - voip-frontend
    restart: unless-stopped
```

- Les tags d'image (`v0.0.19`, `v0.0.3`) sont mis à jour **en dur** ici après chaque nouveau build validé — pas de variable d'environnement pour ça, pour rester cohérent avec la façon dont le backend est géré.
- `voip-backend` monte `/opt/ansible_storage` (contient les playbooks copiés au runtime pour le déploiement/nettoyage de contextes Asterisk).

### `.env` (secrets, jamais committé)

```
# --- Base asterisk_realtime ---
ASTERISK_DB_HOST=192.168.0.102
ASTERISK_DB_PORT=5432
ASTERISK_DB_NAME=asterisk_realtime
ASTERISK_DB_USER=asterisk_user
ASTERISK_DB_PASSWORD=asterisk

# --- Base a2billing_db ---
A2BILLING_DB_HOST=192.168.0.102
A2BILLING_DB_PORT=5432
A2BILLING_DB_NAME=a2billing_db
A2BILLING_DB_USER=a2billing_user
A2BILLING_DB_PASSWORD=a2billing

# --- Base api_auth_db ---
AUTH_DB_HOST=192.168.0.102
AUTH_DB_PORT=5432
AUTH_DB_NAME=api_auth_db
AUTH_DB_USER=api_user
AUTH_DB_PASSWORD=changeme_api

# --- JWT ---
JWT_SECRET=<secret>

# --- Ansible / Asterisk ---
ANSIBLE_STORAGE_PATH=/opt/ansible_storage
ASTERISK_SSH_HOST=192.168.0.102
ASTERISK_SSH_USER=vagrant
ASTERISK_SSH_PASSWORD=vagrant

# --- Frontend / Reverse proxy ---
FRONTEND_ORIGIN=http://voip-frontend
```

**Point clé sur `FRONTEND_ORIGIN`** : reste toujours fixé au nom de service interne (`http://voip-frontend`), **jamais** à une IP publique — voir section 5 ci-dessous pour comprendre pourquoi.

## 5. Configuration du reverse-proxy

### `nginx-proxy.conf`

```nginx
server {
    listen 80;
    server_name _;

    location /api/ {
        proxy_pass http://voip-backend:8080/api/;
        proxy_set_header Host $host;
        proxy_set_header Origin http://voip-frontend;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        proxy_pass http://voip-frontend:80/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Fonctionnement du routage

nginx distingue les requêtes par préfixe d'URL :
- Tout ce qui commence par `/api/` → redirigé vers `voip-backend:8080`
- Tout le reste (`/`, `/tarification`, `/ivr`, ...) → redirigé vers `voip-frontend:80`

### Pourquoi `proxy_set_header Origin http://voip-frontend` est indispensable

Le backend valide l'en-tête HTTP `Origin` de chaque requête contre `FRONTEND_ORIGIN` (protection CORS). Sans cette ligne, le backend recevrait l'`Origin` réel envoyé par le navigateur (ex. `http://192.168.0.111:8000`, l'adresse publique de la VM) — qui ne correspondrait jamais à `FRONTEND_ORIGIN=http://voip-frontend`, et rejetterait systématiquement les requêtes avec un `403`.

Cette ligne **réécrit** l'`Origin` juste avant de transmettre la requête au backend, qui voit alors toujours la même valeur peu importe l'IP/le domaine réel utilisé pour accéder au frontend. C'est ce qui permet de ne **jamais** mettre d'IP dans les `.env` du frontend ni du backend — le reverse-proxy absorbe entièrement cette logique.

## 6. Résumé du trajet d'une requête (exemple : login)

```
Navigateur (http://<ip-vm>:8000)
   │  POST /api/auth/login
   ▼
reverse-proxy (nginx, port 8000→80)
   │  - match /api/ → proxy_pass vers voip-backend:8080
   │  - réécrit Origin: http://voip-frontend
   ▼
voip-backend (port 8080, jamais exposé à l'extérieur)
   │  - vérifie Origin == FRONTEND_ORIGIN ✓
   │  - vérifie les identifiants, génère le token
   ▼
reverse-proxy relaie la réponse JSON telle quelle
   ▼
Navigateur reçoit le token, le stocke en localStorage
```

## 7. Procédure de mise à jour d'une nouvelle version du frontend

1. Développer/tester en local (`npm run dev`).
2. Commit + push sur `main`.
3. GitHub Actions build automatiquement une nouvelle image et l'incrémente (ex. `v0.0.4`).
4. Sur la VM, éditer `docker-compose.yml` : mettre à jour le tag de `voip-frontend` (`v0.0.3` → `v0.0.4`).
5. `sudo docker compose pull voip-frontend`
6. `sudo docker compose up -d voip-frontend`

## 8. Points de vigilance / bugs déjà rencontrés et corrigés

- **`npm ci` échoue en CI mais pas en local** → causé par un `package-lock.json` désynchronisé entre plateformes (Windows vs Linux Alpine). Résolu en utilisant `npm install` dans le Dockerfile.
- **Workflow GitHub Actions "No event triggers defined in `on`"** → causé par la duplication accidentelle de deux workflows collés dans le même fichier YAML. Toujours ne garder qu'un seul bloc `name/on/env/jobs` par fichier.
- **`403` sur `/api/auth/login` en prod** → causé par un `FRONTEND_ORIGIN` ne correspondant pas à l'`Origin` réel envoyé par le navigateur. Résolu par la réécriture d'`Origin` au niveau du reverse-proxy (voir section 5), pas en mettant une IP dans le `.env`.
- **Ansible : `couldn't resolve module/action 'community.docker.docker_compose_v2_pull'`** → l'environnement Ansible utilisé par `ansible_local` (Vagrant) peut différer de celui où la collection a été installée. Résolu en remplaçant ce module par un simple `command: docker compose pull`, qui ne dépend d'aucune collection externe.