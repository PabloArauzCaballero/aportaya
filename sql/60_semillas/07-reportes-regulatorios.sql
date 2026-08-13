-- Calendario de reportes obligatorios. De acá salen los vencimientos: un reporte no enviado es visible antes de vencer.
-- GENERADO desde seeders/minimos/07-reportes-regulatorios.json — no editar a mano.

INSERT INTO catalogo_reporte_regulatorio (codigo, organismo, nombre, periodicidad, formato, plazo_dias, base_normativa, obligatorio, activo) VALUES
  ('PCC-01', 'UIF', 'Formularios PCC-01 del mes anterior', 'MENSUAL', 'CSV', 15, 'Instructivo EIF art. 52 par. VIII — remisión hasta el 15 de cada mes', TRUE, TRUE),
  ('ROG-01', 'UIF', 'Retiros en efectivo de moneda extranjera', 'MENSUAL', 'CSV', 15, 'Instructivo EIF art. 53 par. III', TRUE, TRUE),
  ('ROG-02', 'UIF', 'Retiros por cambio de moneda extranjera', 'MENSUAL', 'CSV', 15, 'Instructivo EIF art. 53 par. III', TRUE, TRUE),
  ('ROG-03', 'UIF', 'Operaciones electrónicas sobre umbral', 'MENSUAL', 'CSV', 15, 'Instructivo EIF art. 53 par. III', TRUE, TRUE),
  ('ROG-04', 'UIF', 'Operaciones con activos virtuales', 'MENSUAL', 'CSV', 15, 'Instructivo EIF art. 53 par. III — inactivo: el producto no ofrece activos virtuales', TRUE, FALSE),
  ('ROS', 'UIF', 'Reporte de operación sospechosa', 'EVENTUAL', 'WEB', 0, 'Sin límite de monto; se remite al concluir el análisis', TRUE, TRUE),
  ('RECLAMOS-M', 'ASFI', 'Módulo de reporte de reclamos — mensual', 'MENSUAL', 'CSV', 10, 'RNSF Libro 4 Título I — Anexo 1', TRUE, TRUE),
  ('RECLAMOS-A', 'ASFI', 'Reporte anual de reclamos', 'ANUAL', 'CSV', 30, 'RNSF Libro 4 Título I — Anexo 2', TRUE, TRUE),
  ('CIRO', 'ASFI', 'Central de Información de Riesgo Operativo', 'TRIMESTRAL', 'CSV', 20, 'RNSF Libro 3 Título V — base de datos de eventos de riesgo operativo', TRUE, TRUE),
  ('ETF-ADEC', 'ASFI', 'Información de adecuación de Empresa de Tecnología Financiera', 'TRIMESTRAL', 'XLSX', 20, 'Reglamento para Empresas de Tecnología Financiera — Res. ASFI/540/2025', TRUE, TRUE)
ON CONFLICT (codigo) DO NOTHING;
