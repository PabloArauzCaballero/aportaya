-- Datos de prueba — NO aplicar en producción
--   psql -d pasanaku -v ON_ERROR_STOP=1 -f sql/61_prueba/sembrar_prueba.sql
-- GENERADO desde seeders/ — no editar a mano.

\set ON_ERROR_STOP on
BEGIN;

\ir 01-entorno-tecnico.sql
\ir 02-usuarios-y-billeteras.sql
\ir 03-grupo-demo.sql
\ir 04-fondo-y-cuenta-del-grupo.sql
\ir 05-personal-interno-y-gobierno.sql
\ir 06-instrumentos-y-recargas.sql
\ir 07-aportes-y-entrega.sql
\ir 08-cobros-qr-y-conciliacion.sql
\ir 09-mora-cobertura-y-cobranza.sql
\ir 10-notificaciones-cierre-y-reclamos.sql
\ir 11-contabilidad-y-saldos.sql
\ir 12-retiro-y-controles.sql
\ir 13-cumplimiento-uif.sql
\ir 14-identidad-y-sesiones.sql

COMMIT;
