-- Datos de prueba — NO aplicar en producción
--   psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/61_prueba/sembrar_prueba.sql
-- GENERADO desde seeders/ — no editar a mano.

\set ON_ERROR_STOP on
BEGIN;

\ir 01-entorno-tecnico.sql
\ir 02-usuarios-y-billeteras.sql
\ir 03-grupo-demo.sql
\ir 04-fondo-y-cuenta-del-grupo.sql

COMMIT;
