# Système de VoIP Interne

# Architecture du Projet

* **Serveur VoIP** : Asterisk (avec dialplan dynamique)
* **Facturation** : A2Billing (via scripts AGI en PHP pour le calcul de la facturation)
* **Base de données** : PostgreSQL (commune pour Asterisk et A2Billing)
* **Synthèse Vocale** : Piper (génération des voix)
* **Scripts IVR & Conférence** : Python (gestion des flux vocaux générés par Piper)
* **API Backend** : Spring Boot (gestion de la création des contextes utilisateurs dans Asterisk et A2Billing)
* **Interface Web** : React (simplification de la configuration et création des contextes et utilisateurs)
* **Conteneurisation** : Docker Compose (déploiement des images Spring Boot et React)

# Fonctionnalités

* Création des utilisateurs rattachés à un contexte
* Appels entre les utilisateurs
* Messagerie vocale
* CDR (Historique des appels)
* Création de numéros IVR (9xx)
* Création de numéros de conférence (3xxx)
* Création de cartes de crédit pour les utilisateurs

# Documentation Détaillée

* **Configuration des fichiers YAML (IaC)** : [/doc/iac.md](doc/iac.md)
* **Détails des endpoints de l'API** : [/doc/backend.md](doc/backend.md)
* **Documentation Frontend** : [/doc/frontend.md](doc/frontend.md)
* **Réseau, architecture et reverse proxy Nginx** : [/doc/Ci%20cd%20et%20deploiement.md](doc/Ci%20cd%20et%20deploiement.md)
* **Changements apportés au code PHP A2Billing** : [/doc/Documentation%20a2billing.md](doc/Documentation%20a2billing.md)

# Prérequis pour Lancer le Projet

* **Vagrant** : version minimum `Vagrant 2.4.9`
* **VirtualBox** : version minimum `7.2.4 r170995` (`Qt6.8.0` sur Windows)
* Une connexion Internet assez stable

# Guide d'Installation

**1 - Clonage du projet**
On va commencer par cloner le projet, soit en le clonant via l'interface web de GitHub, soit en lançant la commande suivante :

```bash
git clone https://github.com/charliewalker-art/voip.git

```

**2 - Accès au répertoire**
Deuxième étape, on va entrer dans le dossier du projet :

```bash
cd voip-main

```

**3 - Lancement de la machine virtuelle**
Troisième étape, on lance la commande :

```bash
vagrant up

```

Ce processus peut prendre plusieurs minutes car Vagrant va automatiquement télécharger la box virtuelle Debian ([package.box v1.0.0](https://github.com/charliewalker-art/boxe-image-debian/releases/download/v1.0.0/package.box)), puis installer et configurer l'ensemble des services
Cela va installer et configurer tout le projet. La configuration réseau de VirtualBox sera en mode NAT par défaut ; on le laisse comme ça d'abord jusqu'à ce que l'installation soit finie.

Quand c'est fini, on va faire une petite configuration réseau pour accéder à l'interface web du frontend. Il faut donner une IP statique à la VM. Pour cela, il y a plusieurs façons : soit mettre le réseau de la machine virtuelle en accès par pont, soit créer une carte réseau interne.

On va mettre le mode accès par pont car c'est conseillé pour que les utilisateurs des numéros puissent se connecter via Linphone, Zoiper ou autre. Ne pas oublier d'éteindre la VM quand on change la configuration de la carte réseau.

Aller dans les paramètres de VirtualBox et mettre le premier adaptateur en accès par pont (et bien sûr, il faut que votre ordinateur soit connecté à un réseau Wi-Fi), comme pour cet exemple :
![Bridge VirtualBox](image/bridget%20virtualbox.png)

**4 - Connexion SSH**
Quand c'est fait, on allume la VM et on se connecte en SSH :

```bash
ssh vagrant@votre-ip -p 22

```

Mot de passe : `vagrant`

Une fois connecté, aller dans le dossier :

```bash
cd /opt/voip-api/

```

Il faut éditer le fichier `.env` :

```bash
sudo nano .env

```

Dans le fichier, il faut changer toutes les adresses IP par votre IP actuelle. Actuellement, elle est probablement définie à `192.168.0.117`. Remplacez toutes les occurrences de `192.168.0.117` par votre adresse IP.

Quand c'est fini, enregistrer les changements.

**5 - Redémarrage des conteneurs**
Ensuite, lancer la commande suivante pour détruire les conteneurs :

```bash
sudo docker compose down -v

```

Puis lancer la commande suivante pour recréer les conteneurs :

```bash
sudo docker compose up -d

```

Attendre quelques minutes pour que les conteneurs puissent démarrer.

**6 - Accès à l'application**
Ouvrir un navigateur et taper l'URL suivante :
`http://ip-du-vm:8000`

**7 - Connexion à l'interface web**

* **Login** : `admin`
* **Password** : `admin123`