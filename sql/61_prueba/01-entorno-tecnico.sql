-- Entorno técnico local: tipo de cambio, cuentas de sistema y cuenta de custodia.
-- GENERADO desde seeders/prueba/01-entorno-tecnico.json — no editar a mano.

-- Sin tipo de cambio, fn_fx_a_usd() falla y no hay evaluación de umbrales
INSERT INTO tipo_cambio (moneda_origen, moneda_destino, fecha, tipo_cambio, fuente, cargado_en) VALUES
  ('BOB', 'USD', current_date, 0.143678, 'MANUAL', now())
ON CONFLICT DO NOTHING;

-- Cuentas técnicas: contrapartida de todo movimiento. Son las únicas con permite_saldo_negativo, porque representan la posición del sistema, no el dinero de una persona (R-BIL-02).
INSERT INTO cuenta_billetera (numero_cuenta, tipo, moneda, estado, nivel_debida_diligencia, fecha_apertura, cuenta_contable_id, permite_saldo_negativo) VALUES
  ('SYS-INGRESOS', 'PLATAFORMA_INGRESOS', 'BOB', 'ACTIVA', 'REFORZADA', now(), (SELECT id FROM cuenta_contable WHERE codigo = '4.1.01'), TRUE),
  ('SYS-IMPUESTOS', 'PLATAFORMA_IMPUESTOS_POR_PAGAR', 'BOB', 'ACTIVA', 'REFORZADA', now(), (SELECT id FROM cuenta_contable WHERE codigo = '2.2.01'), TRUE),
  ('SYS-CUSTODIA', 'PUENTE_CUSTODIA', 'BOB', 'ACTIVA', 'REFORZADA', now(), (SELECT id FROM cuenta_contable WHERE codigo = '1.1.01'), TRUE),
  ('SYS-SUSPENSO', 'SUSPENSO_NO_IDENTIFICADO', 'BOB', 'ACTIVA', 'REFORZADA', now(), (SELECT id FROM cuenta_contable WHERE codigo = '2.1.04'), TRUE)
ON CONFLICT (numero_cuenta) DO NOTHING;

INSERT INTO cuenta_custodia (tipo, entidad_financiera, numero_cuenta_cifrado, numero_enmascarado, moneda, saldo_segun_banco, saldo_segun_libro, fecha_saldo, contrato_referencia, es_principal, estado, abierta_en) VALUES
  ('FIDEICOMISO', 'BANCO DEMO S.A.', 'cifrado-demo', '****4321', 'BOB', 0, 0, now(), 'FID-DEMO-001', TRUE, 'ACTIVA', current_date)
ON CONFLICT DO NOTHING;

-- Solo en desarrollo: los contratos de adhesión reales se registran ante ASFI antes de pasar a VIGENTE
UPDATE contrato_adhesion SET estado = 'VIGENTE' WHERE estado = 'BORRADOR';
