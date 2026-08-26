-- =====================================================================
-- Schéma de la base d'authentification de l'API
-- Base : api_auth_db (séparée des bases métier VoIP)
-- =====================================================================

CREATE TABLE api_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'ADMIN',
    enabled BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);