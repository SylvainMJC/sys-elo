-- Création de la table "users"
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY, 
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    elo BIGINT,
    created_at DATE,
    updated_at DATE
);

-- Création de la table "roles"
CREATE TABLE roles (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Création de la table "users_roles" (relation users <> roles)
CREATE TABLE users_roles (
    id BIGSERIAL PRIMARY KEY,
    id_user BIGINT NOT NULL,
    id_role BIGINT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_role) REFERENCES roles(id) ON DELETE CASCADE
);

-- Création de la table "statuses"
CREATE TABLE statuses (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Création de la table "matches"
CREATE TABLE matches (
    id BIGSERIAL PRIMARY KEY,
    player1 BIGINT NOT NULL,
    player2 BIGINT NOT NULL,
    id_status BIGINT,
    created_at DATE,
    updated_at DATE,
    result_player1 BIGINT,
    result_player2 BIGINT,
    FOREIGN KEY (player1) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (player2) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_status) REFERENCES statuses(id)
);


INSERT INTO "statuses" (id, name) VALUES (1, 'Pending');
INSERT INTO "statuses" (id, name) VALUES (2, 'In Progress');
INSERT INTO "statuses" (id, name) VALUES (3, 'Finished');

INSERT INTO "roles" (id, name) VALUES (1, 'Admin');
INSERT INTO "roles" (id, name) VALUES (2, 'Player');
INSERT INTO "roles" (id, name) VALUES (3, 'Viewer');