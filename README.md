# Sys-Elo

## Présentation

Sys-Elo est une application de gestion de matchs en temps réel, composée d'un backend ExpressJS et d'un frontend Angular. Elle permet la création, le suivi et la gestion de matchs avec un système de score en direct, l'utilisation de Redis pour la gestion des états temporaires, et la persistance des données dans une base PostgreSQL.

## URL de production

Application en ligne : https://sys-elo-front-cynwkjdhm-sylvainmjcs-projects.vercel.app/

## Architecture

- **Frontend** : Angular 17+ (dossier `front/`)
- **Backend** : ExpressJS (dossier `back/`)
- **Base de données** : PostgreSQL (hébergée sur Clever Cloud)
- **Cache temps réel** : Redis (local ou Docker)
- **Notifications** : Intégration Discord (backend)

## Installation et démarrage

### Prérequis

- Node.js 18 ou supérieur
- PostgreSQL
- Redis

### Backend

1. Rendez-vous dans le dossier `back/`
2. Installez les dépendances :  
   `npm install`
3. Configurez les variables d'environnement (voir `.env.example` si disponible)
4. Démarrez le serveur :  
   `npm run dev`  
   Le backend sera accessible sur `http://localhost:3000/`

### Frontend

1. Rendez-vous dans le dossier `front/`
2. Installez les dépendances :  
   `npm install`
3. Lancez l'application Angular :  
   `ng serve`  
   Le frontend sera accessible sur `http://localhost:4200/`

## Fonctionnalités principales

- Création et gestion de matchs entre joueurs
- Suivi du score en temps réel via Redis
- Statut des matchs : en attente, en cours, terminé
- Interface d'administration et de visualisation des matchs
- Authentification et gestion des utilisateurs
- Notifications Discord lors d'événements clés

## Déploiement

- **Frontend** : Vercel ou Netlify
- **Backend** : Render
- **Base de données** : Clever Cloud

## Structure des dossiers

- `back/` : Code source du backend (ExpressJS, services, modèles, routes)
- `front/` : Code source du frontend (Angular, composants, services)
- `setup_database.sql` et `populate_database.sql` : Scripts d'initialisation de la base de données

## Exemple de flux d'utilisation

1. Création d'un match via l'interface ou l'API
2. Démarrage du match en mode live (score géré en temps réel)
3. Mise à jour des scores et du statut du match
4. Fin du match, sauvegarde des scores et nettoyage du cache

## Tests

- Lancement des tests unitaires Angular :  
  `cd front && ng test`
- Le backend ne dispose pas encore de tests automatisés.

## Support

Pour toute question ou contribution, veuillez consulter la documentation interne ou contacter l'équipe projet.
