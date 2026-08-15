-- Índices y restricciones de unicidad del módulo 11 — Tarifas, Comisiones, Impuestos y Facturación
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_catalogo_hecho_generador_codigo
  ON catalogo_hecho_generador (codigo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_tarifario_version_codigo
  ON tarifario (version, codigo);

CREATE INDEX IF NOT EXISTS ix_tarifario_estado
  ON tarifario (estado);

CREATE INDEX IF NOT EXISTS ix_tarifario_vigente_desde
  ON tarifario (vigente_desde);

CREATE UNIQUE INDEX IF NOT EXISTS uq_politica_redondeo_codigo
  ON politica_redondeo (codigo);

CREATE INDEX IF NOT EXISTS ix_concepto_tarifa_tarifario_id
  ON concepto_tarifa (tarifario_id);

CREATE INDEX IF NOT EXISTS ix_concepto_tarifa_hecho_generador_id
  ON concepto_tarifa (hecho_generador_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_concepto_tarifa_tarifario_id_codigo
  ON concepto_tarifa (tarifario_id, codigo);

CREATE INDEX IF NOT EXISTS ix_concepto_tarifa_activo
  ON concepto_tarifa (activo);

CREATE INDEX IF NOT EXISTS ix_regla_tarifa_concepto_tarifa_id
  ON regla_tarifa (concepto_tarifa_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_segmento_comercial_codigo
  ON segmento_comercial (codigo);

CREATE INDEX IF NOT EXISTS ix_asignacion_tarifario_tarifario_id
  ON asignacion_tarifario (tarifario_id);

CREATE INDEX IF NOT EXISTS ix_asignacion_tarifario_ambito
  ON asignacion_tarifario (ambito);

CREATE UNIQUE INDEX IF NOT EXISTS uq_tarifa_congelada_grupo_grupo_id
  ON tarifa_congelada_grupo (grupo_id);

CREATE INDEX IF NOT EXISTS ix_simulacion_tarifa_tarifario_id
  ON simulacion_tarifa (tarifario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cambio_tarifario_tarifario_nuevo_id
  ON cambio_tarifario (tarifario_nuevo_id);

CREATE INDEX IF NOT EXISTS ix_cotizacion_comision_concepto_tarifa_id
  ON cotizacion_comision (concepto_tarifa_id);

CREATE INDEX IF NOT EXISTS ix_cotizacion_comision_referencia_id
  ON cotizacion_comision (referencia_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_concepto_tarifa_id
  ON devengo_comision (concepto_tarifa_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_tarifario_id
  ON devengo_comision (tarifario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_devengo_comision_cotizacion_id
  ON devengo_comision (cotizacion_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_grupo_id
  ON devengo_comision (grupo_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_usuario_obligado_id
  ON devengo_comision (usuario_obligado_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_referencia_id
  ON devengo_comision (referencia_id);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_estado
  ON devengo_comision (estado);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_fecha_devengo
  ON devengo_comision (fecha_devengo);

CREATE INDEX IF NOT EXISTS ix_devengo_comision_periodo_contable
  ON devengo_comision (periodo_contable);

CREATE INDEX IF NOT EXISTS ix_cargo_comision_devengo_id
  ON cargo_comision (devengo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cargo_comision_deduccion_entrega_id
  ON cargo_comision (deduccion_entrega_id);

CREATE INDEX IF NOT EXISTS ix_cargo_comision_estado
  ON cargo_comision (estado);

CREATE INDEX IF NOT EXISTS ix_exencion_comision_alcance
  ON exencion_comision (alcance);

CREATE INDEX IF NOT EXISTS ix_exencion_comision_activa
  ON exencion_comision (activa);

CREATE UNIQUE INDEX IF NOT EXISTS uq_campana_promocional_codigo
  ON campana_promocional (codigo);

CREATE INDEX IF NOT EXISTS ix_campana_promocional_estado
  ON campana_promocional (estado);

CREATE INDEX IF NOT EXISTS ix_aplicacion_promocion_campana_id
  ON aplicacion_promocion (campana_id);

CREATE INDEX IF NOT EXISTS ix_aplicacion_promocion_devengo_id
  ON aplicacion_promocion (devengo_id);

CREATE INDEX IF NOT EXISTS ix_devolucion_comision_devengo_id
  ON devolucion_comision (devengo_id);

CREATE INDEX IF NOT EXISTS ix_devolucion_comision_estado
  ON devolucion_comision (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cuenta_por_cobrar_comision_devengo_id
  ON cuenta_por_cobrar_comision (devengo_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_comision_usuario_id
  ON cuenta_por_cobrar_comision (usuario_id);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_comision_dias_vencido
  ON cuenta_por_cobrar_comision (dias_vencido);

CREATE INDEX IF NOT EXISTS ix_cuenta_por_cobrar_comision_estado
  ON cuenta_por_cobrar_comision (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_impuesto_vigente_desde_codigo
  ON impuesto (vigente_desde, codigo);

CREATE INDEX IF NOT EXISTS ix_calculo_impuesto_devengo_id
  ON calculo_impuesto (devengo_id);

CREATE INDEX IF NOT EXISTS ix_calculo_impuesto_periodo_fiscal
  ON calculo_impuesto (periodo_fiscal);

CREATE INDEX IF NOT EXISTS ix_datos_facturacion_usuario_id
  ON datos_facturacion (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_datos_facturacion_usuario_id_numero_documento
  ON datos_facturacion (usuario_id, numero_documento);

CREATE INDEX IF NOT EXISTS ix_lote_envio_sin_fecha_envio
  ON lote_envio_sin (fecha_envio);

CREATE UNIQUE INDEX IF NOT EXISTS uq_lote_envio_sin_codigo_recepcion
  ON lote_envio_sin (codigo_recepcion);

CREATE INDEX IF NOT EXISTS ix_lote_envio_sin_estado
  ON lote_envio_sin (estado);

CREATE INDEX IF NOT EXISTS ix_evento_significativo_sin_codigo_evento
  ON evento_significativo_sin (codigo_evento);

CREATE INDEX IF NOT EXISTS ix_evento_significativo_sin_fecha_inicio
  ON evento_significativo_sin (fecha_inicio);

CREATE INDEX IF NOT EXISTS ix_evento_significativo_sin_plazo_registro
  ON evento_significativo_sin (plazo_registro);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evento_significativo_sin_codigo_recepcion_evento
  ON evento_significativo_sin (codigo_recepcion_evento);

CREATE INDEX IF NOT EXISTS ix_evento_significativo_sin_estado
  ON evento_significativo_sin (estado);

CREATE INDEX IF NOT EXISTS ix_factura_electronica_devengo_id
  ON factura_electronica (devengo_id);

CREATE INDEX IF NOT EXISTS ix_factura_electronica_usuario_id
  ON factura_electronica (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_factura_electronica_sucursal_punto_venta_numero_factura
  ON factura_electronica (sucursal, punto_venta, numero_factura);

CREATE UNIQUE INDEX IF NOT EXISTS uq_factura_electronica_cuf
  ON factura_electronica (cuf);

CREATE INDEX IF NOT EXISTS ix_factura_electronica_fecha_emision
  ON factura_electronica (fecha_emision);

CREATE INDEX IF NOT EXISTS ix_factura_electronica_estado_fiscal
  ON factura_electronica (estado_fiscal);

CREATE INDEX IF NOT EXISTS ix_nota_credito_debito_factura_id
  ON nota_credito_debito (factura_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_nota_credito_debito_cuf
  ON nota_credito_debito (cuf);

CREATE UNIQUE INDEX IF NOT EXISTS uq_liquidacion_ingresos_periodo
  ON liquidacion_ingresos (periodo);

CREATE INDEX IF NOT EXISTS ix_liquidacion_ingresos_estado
  ON liquidacion_ingresos (estado);

CREATE INDEX IF NOT EXISTS ix_costo_proveedor_operacion_proveedor_id
  ON costo_proveedor_operacion (proveedor_id);

CREATE INDEX IF NOT EXISTS ix_costo_proveedor_operacion_periodo
  ON costo_proveedor_operacion (periodo);
