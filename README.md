# Sys-Elo

## Sommaire
1. Présentation générale
2. Membres et promotion
3. URL de production
4. Architecture technique
5. Installation et démarrage
6. Utilisation des scripts SQL
7. Fonctionnalités principales
8. Gestion des matchs en temps réel (Live)
9. Authentification et gestion des utilisateurs
10. Intégration Discord (Bot & Webhook)
11. Structure des dossiers
12. API (endpoints)
13. Variables d'environnement
14. Gestion des erreurs
15. Déploiement
16. Tests
17. Support

---

## 1. Présentation générale
Sys-Elo est une application web de gestion de matchs en temps réel, combinant un backend ExpressJS, un frontend Angular et une base PostgreSQL. Elle permet la création, le suivi et la gestion de matchs avec un système de score en direct, l'utilisation de Redis pour la gestion des états temporaires, et la notification d'événements via Discord.

## 2. Membres et promotion
- Sylvain CONAN
- Alexandre VALLON [github](https://github.com/Al-vallon/Al-vallon)

## 3. URL de production
Application en ligne : [https://sys-elo-front-cynwkjdhm-sylvainmjcs-projects.vercel.app/](https://sys-elo-front.vercel.app)

## 4. Architecture technique
- Frontend : Angular 17+ (`front/`)
- Backend : ExpressJS (`back/`)
- Base de données : PostgreSQL (hébergée sur Clever Cloud)
- Cache temps réel : Redis (local ou Docker)
- Notifications : Discord (bot et webhook)

## 5. Installation et démarrage

### Prérequis
Node.js 18 ou supérieur, PostgreSQL, Redis

### Backend
Se placer dans le dossier `back/`, installer les dépendances avec `npm install`, configurer les variables d'environnement (voir `.env.example` si disponible), puis démarrer le serveur avec `npm run dev`. Le backend écoute sur `http://localhost:3000/`.

### Frontend
Se placer dans le dossier `front/`, installer les dépendances avec `npm install`, puis lancer l'application Angular avec `ng serve`. Le frontend est accessible sur `http://localhost:4200/`.

## 6. Utilisation des scripts SQL

### Initialisation de la base
- Exécuter `setup_database.sql` pour créer les tables et insérer les statuts et rôles de base.
- Exécuter `populate_database.sql` pour insérer des utilisateurs, rôles, viewers et administrateurs de test.

Ces scripts sont à lancer sur une instance PostgreSQL vierge avant le premier démarrage du backend.

## 7. Fonctionnalités principales
- Création, gestion et suivi de matchs entre joueurs
- Suivi du score en temps réel via Redis
- Statuts des matchs : en attente, en cours, terminé
- Interface d'administration et de visualisation des matchs
- Authentification JWT et gestion des utilisateurs
- Notifications Discord lors d'événements clés (début, fin, milestones, alertes)

## 8. Gestion des matchs en temps réel (Live)
Le mode live permet de suivre et mettre à jour le score d'un match en temps réel. Lorsqu'un match passe en mode live, ses données sont stockées dans Redis pour des mises à jour instantanées. Le frontend interroge l'API toutes les 2 secondes pour rafraîchir l'affichage. À la fin du match, les scores sont persistés en base et le cache Redis nettoyé.

## 9. Authentification et gestion des utilisateurs
L'authentification est gérée côté backend via JWT. Le frontend utilise un service Angular dédié pour stocker le token et l'état de connexion. Les rôles (admin, joueur, viewer) sont gérés en base et permettent de restreindre l'accès à certaines fonctionnalités.

## 10. Intégration Discord (Bot & Webhook)
Le backend intègre un bot Discord (via `discord.js`) et un système de webhook. Les notifications sont envoyées lors d'événements importants (début/fin de match, milestones ELO, alertes système, statistiques quotidiennes). Les variables d'environnement à configurer sont :
- `DISCORD_BOT_TOKEN`
- `DISCORD_WEBHOOK_URL`
- `DISCORD_CHANNEL_ID`

Le service `discordNotificationService` centralise l'envoi des notifications. Des tests dédiés (`test-discord.js`, `test-start-match.js`, `test-daily-stats.js`) permettent de valider l'intégration Discord.

### Tests manuels Discord
- Calcul ELO enrichi et notification de victoire/défaite
- Statut des services Discord (bot/webhook)
- Test complet des connexions Discord
- Notification de match (bot + webhook)
- Notification milestone ELO
- Notification montée de rang
- Notification upset (victoire surprise)
- Statistiques quotidiennes
- Alertes système

## 11. Structure des dossiers
- `back/` : Backend ExpressJS (routes, services, modèles, contrôleurs, middlewares)
- `front/` : Frontend Angular (composants, services, configuration)
- `setup_database.sql` et `populate_database.sql` : Scripts d'initialisation et de peuplement de la base PostgreSQL

## 12. API (endpoints)

### Utilisateurs (`/api/users`)
- `GET /api/users/` : Liste tous les utilisateurs
- `GET /api/users/:id` : Détail d'un utilisateur
- `PUT /api/users/:id` : Met à jour un utilisateur
- `DELETE /api/users/:id` : Supprime un utilisateur

### Authentification
- `POST /api/login/` : Connexion (email, password)
- `POST /api/register/` : Inscription (username, email, password)
- `POST /api/logout/` : Déconnexion

### Matchs (`/api/matches`)
- `POST /api/matches/` : Créer un match
- `GET /api/matches/` : Liste tous les matchs
- `GET /api/matches/:id` : Détail d'un match
- `PUT /api/matches/:id` : Met à jour un match
- `PATCH /api/matches/:id` : Met à jour le statut d'un match
- `DELETE /api/matches/:id` : Supprime un match
- `POST /api/matches/:id/start` : Démarre un match (mode live, Redis)
- `PATCH /api/matches/:id/score` : Met à jour le score live (Redis)
- `POST /api/matches/:id/end` : Termine un match (persistant, nettoyage Redis)
- `GET /api/matches/:id/live` : Récupère les données live d'un match

### Statuts (`/api/statuses`)
- `POST /api/statuses/` : Créer un statut
- `GET /api/statuses/` : Liste tous les statuts
- `GET /api/statuses/:id` : Détail d'un statut
- `PUT /api/statuses/:id` : Met à jour un statut
- `DELETE /api/statuses/:id` : Supprime un statut

### Discord (pour tests et intégration)
- `GET /api/matches/discord/test` : Teste la connexion Discord
- `GET /api/matches/discord/status` : Statut du bot/webhook Discord
- `POST /api/matches/discord/simulate` : Simule une notification Discord
- `POST /api/matches/discord/daily-stats` : Teste l'envoi des statistiques quotidiennes

### Redis (routes)- 
-`POST /api/matches/:id/start` : Démarre un match
- `PATCH /api/matches/:id/score` : Met à jour le score en direct du match
- `POST /api/matches/:id/end` : Termine un match
- `GET /api/matches/:id/live` : Récupère les données en direct d’un match

## 13. Variables d'environnement
- `DATABASE_URL` : URL de connexion PostgreSQL
- `REDIS_URL` : URL de connexion Redis
- `DISCORD_BOT_TOKEN` : Token du bot Discord
- `DISCORD_WEBHOOK_URL` : URL du webhook Discord
- `DISCORD_CHANNEL_ID` : ID du salon Discord

## 14. Gestion des erreurs
- Les erreurs sont gérées via des middlewares Express et des try/catch dans les contrôleurs/services.
- Les erreurs de connexion à la base, à Redis ou à Discord sont loguées côté serveur.
- Les endpoints renvoient des statuts HTTP explicites (400, 401, 404, 500) et des messages d'erreur détaillés.
- Les erreurs critiques (ex : échec de notification Discord) sont également notifiées dans Discord si possible.

## 15. Déploiement
- Frontend : Vercel ou Netlify
- Backend : Render
- Base de données : Clever Cloud

## 16. Tests
- Tests unitaires Angular : `cd front && ng test`
- Tests d'intégration Discord : scripts dans `back/`
- Le backend ne dispose pas encore de tests automatisés pour l'API (prévu dans la roadmap)

## 17. Support
Pour toute question ou contribution, consulter la documentation interne ou contacter l'équipe projet.
