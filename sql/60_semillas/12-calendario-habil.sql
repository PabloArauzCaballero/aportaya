-- Calendario de días no hábiles. Sin esta tabla, todo plazo legal expresado en días hábiles se calcula mal: el vencimiento de un reclamo, el plazo de descargo y la remisión de un reporte dependen de acá.
-- GENERADO desde seeders/minimos/12-calendario-habil.json — no editar a mano.

-- Feriados nacionales 2026. Carnaval, Viernes Santo y Corpus Christi son móviles: derivan de la Pascua (2026-04-05).
INSERT INTO dia_no_habil (fecha, descripcion, alcance, grupo_id) VALUES
  ('2026-01-01', 'Año Nuevo — feriado nacional con suspensión de actividades', 'NACIONAL', NULL),
  ('2026-01-22', 'Día del Estado Plurinacional — D.S. 405 de 2010', 'NACIONAL', NULL),
  ('2026-02-16', 'Lunes de Carnaval — feriado móvil (Pascua 2026-04-05)', 'NACIONAL', NULL),
  ('2026-02-17', 'Martes de Carnaval — feriado móvil (Pascua 2026-04-05)', 'NACIONAL', NULL),
  ('2026-04-03', 'Viernes Santo — feriado móvil (Pascua 2026-04-05)', 'NACIONAL', NULL),
  ('2026-05-01', 'Día del Trabajo — feriado nacional', 'NACIONAL', NULL),
  ('2026-06-04', 'Corpus Christi — feriado móvil (Pascua 2026-04-05)', 'NACIONAL', NULL),
  ('2026-06-21', 'Año Nuevo Andino Amazónico — D.S. 0173 de 2009', 'NACIONAL', NULL),
  ('2026-08-06', 'Día de la Independencia — feriado nacional', 'NACIONAL', NULL),
  ('2026-11-02', 'Todos Santos — Ley 2200 de 2001', 'NACIONAL', NULL),
  ('2026-12-25', 'Navidad — feriado nacional', 'NACIONAL', NULL)
ON CONFLICT (fecha, alcance, COALESCE(grupo_id, '00000000-0000-0000-0000-000000000000'::uuid)) DO NOTHING;

-- Feriados nacionales 2027 (Pascua 2027-03-28)
INSERT INTO dia_no_habil (fecha, descripcion, alcance, grupo_id) VALUES
  ('2027-01-01', 'Año Nuevo — feriado nacional con suspensión de actividades', 'NACIONAL', NULL),
  ('2027-01-22', 'Día del Estado Plurinacional — D.S. 405 de 2010', 'NACIONAL', NULL),
  ('2027-02-08', 'Lunes de Carnaval — feriado móvil (Pascua 2027-03-28)', 'NACIONAL', NULL),
  ('2027-02-09', 'Martes de Carnaval — feriado móvil (Pascua 2027-03-28)', 'NACIONAL', NULL),
  ('2027-03-26', 'Viernes Santo — feriado móvil (Pascua 2027-03-28)', 'NACIONAL', NULL),
  ('2027-05-01', 'Día del Trabajo — feriado nacional', 'NACIONAL', NULL),
  ('2027-05-27', 'Corpus Christi — feriado móvil (Pascua 2027-03-28)', 'NACIONAL', NULL),
  ('2027-06-21', 'Año Nuevo Andino Amazónico — D.S. 0173 de 2009', 'NACIONAL', NULL),
  ('2027-08-06', 'Día de la Independencia — feriado nacional', 'NACIONAL', NULL),
  ('2027-11-02', 'Todos Santos — Ley 2200 de 2001', 'NACIONAL', NULL),
  ('2027-12-25', 'Navidad — feriado nacional', 'NACIONAL', NULL)
ON CONFLICT (fecha, alcance, COALESCE(grupo_id, '00000000-0000-0000-0000-000000000000'::uuid)) DO NOTHING;

-- Feriados nacionales 2028 (Pascua 2028-04-16; año bisiesto: el martes de Carnaval cae 29-02)
INSERT INTO dia_no_habil (fecha, descripcion, alcance, grupo_id) VALUES
  ('2028-01-01', 'Año Nuevo — feriado nacional con suspensión de actividades', 'NACIONAL', NULL),
  ('2028-01-22', 'Día del Estado Plurinacional — D.S. 405 de 2010', 'NACIONAL', NULL),
  ('2028-02-28', 'Lunes de Carnaval — feriado móvil (Pascua 2028-04-16)', 'NACIONAL', NULL),
  ('2028-02-29', 'Martes de Carnaval — feriado móvil (Pascua 2028-04-16)', 'NACIONAL', NULL),
  ('2028-04-14', 'Viernes Santo — feriado móvil (Pascua 2028-04-16)', 'NACIONAL', NULL),
  ('2028-05-01', 'Día del Trabajo — feriado nacional', 'NACIONAL', NULL),
  ('2028-06-15', 'Corpus Christi — feriado móvil (Pascua 2028-04-16)', 'NACIONAL', NULL),
  ('2028-06-21', 'Año Nuevo Andino Amazónico — D.S. 0173 de 2009', 'NACIONAL', NULL),
  ('2028-08-06', 'Día de la Independencia — feriado nacional', 'NACIONAL', NULL),
  ('2028-11-02', 'Todos Santos — Ley 2200 de 2001', 'NACIONAL', NULL),
  ('2028-12-25', 'Navidad — feriado nacional', 'NACIONAL', NULL)
ON CONFLICT (fecha, alcance, COALESCE(grupo_id, '00000000-0000-0000-0000-000000000000'::uuid)) DO NOTHING;
