-- =====================================================================
-- Seed du premier utilisateur admin de l'API
-- Mot de passe initial : admin123 (haché BCrypt, cost factor 10)
-- A CHANGER après le premier login - ce compte sert uniquement à
-- amorcer le système d'authentification.
--
-- ON CONFLICT DO NOTHING : idempotent, ne recrée pas le compte s'il
-- existe déjà (username UNIQUE) - cohérent avec la discipline
-- d'idempotence appliquée dans tout le reste du playbook.
-- =====================================================================

INSERT INTO api_users (username, password_hash, role, enabled)
VALUES (
    'admin',
    '$2a$12$ESo7bW/ucOSmrHVnVhq2mejUkFvyTK/C79PNC7KefprkkVs0gi76q',
    'ADMIN',
    true
)
ON CONFLICT (username) DO NOTHING;