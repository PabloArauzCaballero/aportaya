-- Umbrales de registro y reporte a la Unidad de Investigaciones Financieras.
-- GENERADO desde seeders/minimos/06-umbrales-uif.json — no editar a mano.

-- Artículo 52 — Formulario PCC-01 (declaración de origen y destino)
INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion, es_acumulado, umbral_usd, ventana_dias_calendario, exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa, vigente_desde, activo) VALUES
  ('PCC-01', 'a', 'EFECTIVO', FALSE, 10000, NULL, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. a) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'b', 'EFECTIVO', TRUE, 10000, 10, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. b) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'c', 'CAMBIO_MONEDA', FALSE, 5000, NULL, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. c) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'd', 'CAMBIO_MONEDA', TRUE, 5000, 5, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. d) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'e', 'GIRO', FALSE, 2000, NULL, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. e) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'f', 'GIRO', TRUE, 2000, 5, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. f) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'g', 'REMESA', FALSE, 1000, NULL, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. g) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'h', 'REMESA', TRUE, 1000, 5, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. h) — R.A. UIF/050/2026', current_date, TRUE),
  ('PCC-01', 'i', 'CARGA_BILLETERA', TRUE, 1000, 3, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. i) — R.A. UIF/050/2026 (carga de billetera móvil)', current_date, TRUE),
  ('PCC-01', 'i', 'RETIRO_BILLETERA', TRUE, 1000, 3, TRUE, TRUE, 'Instructivo EIF art. 52 par. I inc. i) — R.A. UIF/050/2026 (retiro de billetera móvil)', current_date, TRUE)
ON CONFLICT DO NOTHING;

-- Artículo 53 — Reporte de Operaciones Generales (ROG)
INSERT INTO umbral_reporte_uif (formulario, inciso, concepto_operacion, es_acumulado, umbral_usd, ventana_dias_calendario, exige_declaracion_origen_destino, reinicia_tras_superar, base_normativa, vigente_desde, activo) VALUES
  ('ROG-01', 'a', 'EFECTIVO', FALSE, 0, NULL, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. a) — retiros en efectivo de moneda extranjera, sin umbral', current_date, TRUE),
  ('ROG-02', 'b', 'CAMBIO_MONEDA', FALSE, 0, NULL, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. b) — retiros por cambio de moneda extranjera, sin umbral', current_date, TRUE),
  ('ROG-03', 'c', 'ELECTRONICA', FALSE, 2000, NULL, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. c) — R.A. UIF/050/2026', current_date, TRUE),
  ('ROG-03', 'd', 'ELECTRONICA', TRUE, 10000, 10, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. d) — acumulación de operaciones menores a USD 2.000', current_date, TRUE),
  ('ROG-03', 'e', 'GIRO', TRUE, 2000, 1, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. e) — giro nacional por orden electrónica', current_date, TRUE),
  ('ROG-03', 'f', 'REMESA', TRUE, 1000, 1, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. f) — remesa por orden electrónica', current_date, TRUE),
  ('ROG-03', 'g', 'TRANSFERENCIA_BILLETERA', TRUE, 1000, 3, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. g) — R.A. UIF/050/2026 (transferencias desde billetera móvil)', current_date, TRUE),
  ('ROG-04', 'h', 'ACTIVO_VIRTUAL', FALSE, 0, NULL, FALSE, TRUE, 'Instructivo EIF art. 53 par. I inc. h) — activos virtuales, según catálogo UIF', current_date, FALSE)
ON CONFLICT DO NOTHING;
