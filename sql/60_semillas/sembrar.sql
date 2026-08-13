-- Catálogos mínimos — también se aplican en producción
--   psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql
-- GENERADO desde seeders/ — no editar a mano.

\set ON_ERROR_STOP on
BEGIN;

\ir 01-plan-de-cuentas.sql
\ir 02-politicas.sql
\ir 03-limites-operativos.sql
\ir 04-tarifario.sql
\ir 05-impuestos.sql
\ir 06-umbrales-uif.sql
\ir 07-reportes-regulatorios.sql
\ir 08-gobierno-y-licencia.sql
\ir 09-reglas-operativas.sql
\ir 10-roles-y-permisos.sql
\ir 11-contratos-de-adhesion.sql

COMMIT;
