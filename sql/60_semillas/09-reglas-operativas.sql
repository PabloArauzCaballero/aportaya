-- Reglas de validación previa a la entrega y reglas antifraude en línea.
-- GENERADO desde seeders/minimos/09-reglas-operativas.json — no editar a mano.

INSERT INTO regla_entrega (codigo, descripcion, es_bloqueante, permite_omision, rol_que_puede_omitir, orden, activa) VALUES
  ('BOLSA_COMPLETA', 'La bolsa del período está completa o cubierta por el fondo', TRUE, FALSE, NULL, 1, TRUE),
  ('BENEFICIARIO_KYC_VIGENTE', 'El beneficiario tiene debida diligencia vigente', TRUE, FALSE, NULL, 2, TRUE),
  ('CUENTA_DESTINO_VERIFICADA', 'La cuenta o billetera destino está verificada', TRUE, FALSE, NULL, 3, TRUE),
  ('SIN_BLOQUEO_DE_AUTORIDAD', 'El beneficiario no tiene bloqueo de saldo vigente', TRUE, FALSE, NULL, 4, TRUE),
  ('DEUDA_PROPIA_DEDUCIDA', 'La deuda propia del beneficiario fue deducida', TRUE, FALSE, NULL, 5, TRUE),
  ('COMISION_DEVENGADA', 'La comisión de plataforma fue devengada y deducida', TRUE, FALSE, NULL, 6, TRUE),
  ('CONFIRMACION_DATOS', 'El beneficiario confirmó sus datos de cobro', FALSE, TRUE, 'ORGANIZADOR', 7, TRUE),
  ('ENCAJE_CUMPLIDO', 'La conciliación de custodia del día anterior cumple el encaje', TRUE, FALSE, NULL, 8, TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO regla_antifraude (codigo, descripcion, expresion, accion, umbral_puntaje, prioridad, activa, vigente_desde) VALUES
  ('RETIRO_INSTRUMENTO_NUEVO', 'Retiro hacia un instrumento agregado en las últimas 24 horas', '{"instrumento_creado_hace_horas": {"<": 24}, "operacion": "RETIRO"}'::jsonb, 'RECHAZAR', 90, 1, TRUE, now()),
  ('DISPOSITIVO_NUEVO_MONTO_ALTO', 'Operación de monto alto desde un dispositivo no confiable', '{"dispositivo_confiable": false, "monto": {">": 2000}}'::jsonb, 'DESAFIAR_MFA', 60, 2, TRUE, now()),
  ('VELOCIDAD_RETIROS', 'Más de tres retiros en una hora', '{"operacion": "RETIRO", "cantidad_en_ventana": {">": 3}, "ventana_minutos": 60}'::jsonb, 'REVISAR', 70, 3, TRUE, now()),
  ('CAMBIO_CREDENCIAL_Y_RETIRO', 'Retiro dentro de las 24 horas de un cambio de credencial o de factor', '{"credencial_cambiada_hace_horas": {"<": 24}, "operacion": "RETIRO"}'::jsonb, 'REVISAR', 80, 4, TRUE, now()),
  ('GEO_INUSUAL', 'Operación desde un país distinto al habitual del titular', '{"pais_distinto_al_habitual": true}'::jsonb, 'DESAFIAR_MFA', 50, 5, TRUE, now())
ON CONFLICT (codigo) DO NOTHING;
