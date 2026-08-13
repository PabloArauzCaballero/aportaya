-- Política de cobro — tarifario v1: 0,3 % de la bolsa con piso Bs 10 y techo Bs 50, a cargo del beneficiario del turno, deducido de la entrega.
-- GENERADO desde seeders/minimos/04-tarifario.json — no editar a mano.

-- Hechos del sistema sobre los que se puede cobrar
INSERT INTO catalogo_hecho_generador (codigo, descripcion, entidad_evento, campo_monto_base, unidad_conteo, modulo_origen, activo) VALUES
  ('ENTREGA_FONDO_ACREDITADA', 'El beneficiario del turno cobró la bolsa', 'entrega_fondo', 'monto_bolsa_bruto', 'ENTREGA', '04', TRUE),
  ('APORTE_ACREDITADO', 'Un aporte fue acreditado y conciliado', 'pago', 'monto', 'PAGO', '03', TRUE),
  ('RECARGA_ACREDITADA', 'El usuario cargó saldo en su billetera', 'orden_recarga', 'monto_bruto', 'RECARGA', '10', TRUE),
  ('RETIRO_EJECUTADO', 'El usuario retiró saldo de su billetera', 'orden_retiro', 'monto_solicitado', 'RETIRO', '10', TRUE),
  ('TRANSFERENCIA_EJECUTADA', 'Transferencia entre billeteras', 'transferencia_p2p', 'monto', 'TRANSFERENCIA', '10', TRUE),
  ('CICLO_INICIADO', 'Arrancó un ciclo del grupo', 'periodo', NULL, 'CICLO', '02', TRUE),
  ('PARTICIPANTE_INSCRITO', 'Un participante tomó un cupo', 'participante', NULL, 'PARTICIPANTE', '02', TRUE)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO tarifario (codigo, version, nombre, estado, moneda_base, vigente_desde, dias_preaviso, publicado_en, url_publicacion, hash_documento) VALUES
  ('GENERAL', 1, 'Tarifario general v1', 'VIGENTE', 'BOB', now(), 30, now(), 'https://pasanaku.bo/legal/tarifario-v1.pdf', repeat('0', 64))
ON CONFLICT (codigo, version) DO NOTHING;

-- El único concepto que cobra al arrancar
INSERT INTO concepto_tarifa (tarifario_id, hecho_generador_id, politica_redondeo_id, cuenta_ingreso_id, codigo, nombre_comercial, descripcion_usuario, metodo_calculo, base_calculo, valor_porcentual, monto_minimo, monto_maximo, sujeto_obligado, forma_cobro, momento_cobro, gravado_iva, gravado_it, precio_incluye_impuesto, orden_aplicacion, activo) VALUES
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'ENTREGA_FONDO_ACREDITADA'), (SELECT id FROM politica_redondeo WHERE codigo = 'BOB_COMISION'), (SELECT id FROM cuenta_contable WHERE codigo = '4.1.01'), 'COM_ENTREGA', 'Comisión por cobro de turno', 'Se descuenta de la bolsa cuando cobrás tu turno. Incluye impuestos.', 'PORCENTUAL', 'MONTO_BOLSA_BRUTO', 0.3, 10.0, 50.0, 'BENEFICIARIO_DEL_TURNO', 'DEDUCCION_DE_ENTREGA', 'AL_LIQUIDAR_ENTREGA', TRUE, TRUE, TRUE, 1, TRUE)
ON CONFLICT (tarifario_id, codigo) DO NOTHING;

-- Lo gratuito también se declara: el tarifario publicado muestra lo que no se cobra
INSERT INTO concepto_tarifa (tarifario_id, hecho_generador_id, codigo, nombre_comercial, descripcion_usuario, metodo_calculo, base_calculo, sujeto_obligado, forma_cobro, momento_cobro, gravado_iva, gravado_it, precio_incluye_impuesto, orden_aplicacion, activo) VALUES
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'APORTE_ACREDITADO'), 'COM_APORTE', 'Aporte al grupo', 'Aportar a tu pasanaku no tiene costo.', 'GRATUITO', 'SIN_BASE', 'PAGADOR_DE_LA_OPERACION', 'DEBITO_DE_BILLETERA', 'AL_DEVENGAR', FALSE, FALSE, TRUE, 10, TRUE),
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'RECARGA_ACREDITADA'), 'COM_RECARGA', 'Carga de saldo', 'Cargar saldo no tiene costo.', 'GRATUITO', 'SIN_BASE', 'PAGADOR_DE_LA_OPERACION', 'DEBITO_DE_BILLETERA', 'AL_DEVENGAR', FALSE, FALSE, TRUE, 11, TRUE),
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'RETIRO_EJECUTADO'), 'COM_RETIRO', 'Retiro de saldo', 'Retirar tu saldo no tiene costo.', 'GRATUITO', 'SIN_BASE', 'PAGADOR_DE_LA_OPERACION', 'DEBITO_DE_BILLETERA', 'AL_DEVENGAR', FALSE, FALSE, TRUE, 12, TRUE),
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'TRANSFERENCIA_EJECUTADA'), 'COM_TRANSF', 'Transferencia', 'Enviar saldo a otra persona no tiene costo.', 'GRATUITO', 'SIN_BASE', 'PAGADOR_DE_LA_OPERACION', 'DEBITO_DE_BILLETERA', 'AL_DEVENGAR', FALSE, FALSE, TRUE, 13, TRUE),
  ((SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), (SELECT id FROM catalogo_hecho_generador WHERE codigo = 'PARTICIPANTE_INSCRITO'), 'COM_INSCRIP', 'Inscripción al grupo', 'Entrar a un grupo no tiene costo.', 'GRATUITO', 'SIN_BASE', 'PAGADOR_DE_LA_OPERACION', 'DEBITO_DE_BILLETERA', 'AL_DEVENGAR', FALSE, FALSE, TRUE, 14, TRUE)
ON CONFLICT (tarifario_id, codigo) DO NOTHING;
