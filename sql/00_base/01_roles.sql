-- Roles de base de datos
-- La segregación de privilegios es parte del cumplimiento: el rol de la
-- aplicación no puede editar tablas append-only ni catálogos regulatorios.
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_aplicacion') THEN
    CREATE ROLE rol_aplicacion NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_backoffice') THEN
    CREATE ROLE rol_backoffice NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_cumplimiento') THEN
    CREATE ROLE rol_cumplimiento NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_auditor') THEN
    CREATE ROLE rol_auditor NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'rol_migracion') THEN
    CREATE ROLE rol_migracion NOLOGIN;
  END IF;
END $$;
