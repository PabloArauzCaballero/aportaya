-- Extensiones requeridas por el esquema
-- pgcrypto  : gen_random_uuid() y digest() para las cadenas de hash
-- btree_gist: restricciones EXCLUDE que combinan igualdad y rangos (vigencias)
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS btree_gist;
