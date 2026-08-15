-- Índices y restricciones de unicidad del módulo 12 — Cumplimiento Regulatorio y Consumidor Financiero
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_matriz_riesgo_lft_dimension_factor_version
  ON matriz_riesgo_lft (dimension, factor, version);

CREATE INDEX IF NOT EXISTS ix_factor_riesgo_evaluado_usuario_id
  ON factor_riesgo_evaluado (usuario_id);

CREATE INDEX IF NOT EXISTS ix_calificacion_riesgo_cliente_usuario_id
  ON calificacion_riesgo_cliente (usuario_id);

CREATE INDEX IF NOT EXISTS ix_calificacion_riesgo_cliente_nivel
  ON calificacion_riesgo_cliente (nivel);

CREATE INDEX IF NOT EXISTS ix_calificacion_riesgo_cliente_proxima_revision
  ON calificacion_riesgo_cliente (proxima_revision);

CREATE INDEX IF NOT EXISTS ix_debida_diligencia_usuario_id
  ON debida_diligencia (usuario_id);

CREATE INDEX IF NOT EXISTS ix_debida_diligencia_tipo
  ON debida_diligencia (tipo);

CREATE INDEX IF NOT EXISTS ix_debida_diligencia_estado
  ON debida_diligencia (estado);

CREATE INDEX IF NOT EXISTS ix_debida_diligencia_vence_en
  ON debida_diligencia (vence_en);

CREATE INDEX IF NOT EXISTS ix_perfil_transaccional_usuario_id
  ON perfil_transaccional (usuario_id);

CREATE INDEX IF NOT EXISTS ix_desvio_perfil_usuario_id
  ON desvio_perfil (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_desvio_perfil_usuario_id_periodo
  ON desvio_perfil (usuario_id, periodo);

CREATE INDEX IF NOT EXISTS ix_desvio_perfil_desvio_porcentual
  ON desvio_perfil (desvio_porcentual);

CREATE INDEX IF NOT EXISTS ix_desvio_perfil_estado
  ON desvio_perfil (estado);

CREATE INDEX IF NOT EXISTS ix_declaracion_pep_usuario_id
  ON declaracion_pep (usuario_id);

CREATE INDEX IF NOT EXISTS ix_declaracion_pep_es_pep
  ON declaracion_pep (es_pep);

CREATE INDEX IF NOT EXISTS ix_beneficiario_final_usuario_id
  ON beneficiario_final (usuario_id);

CREATE INDEX IF NOT EXISTS ix_declaracion_origen_fondos_usuario_id
  ON declaracion_origen_fondos (usuario_id);

CREATE INDEX IF NOT EXISTS ix_revision_periodica_kyc_usuario_id
  ON revision_periodica_kyc (usuario_id);

CREATE INDEX IF NOT EXISTS ix_revision_periodica_kyc_fecha_programada
  ON revision_periodica_kyc (fecha_programada);

CREATE INDEX IF NOT EXISTS ix_revision_periodica_kyc_estado
  ON revision_periodica_kyc (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_expediente_cliente_usuario_id
  ON expediente_cliente (usuario_id);

CREATE INDEX IF NOT EXISTS ix_expediente_cliente_retencion_hasta
  ON expediente_cliente (retencion_hasta);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_monitoreo_lft_codigo
  ON regla_monitoreo_lft (codigo);

CREATE INDEX IF NOT EXISTS ix_regla_monitoreo_lft_activa
  ON regla_monitoreo_lft (activa);

CREATE INDEX IF NOT EXISTS ix_alerta_monitoreo_lft_regla_monitoreo_id
  ON alerta_monitoreo_lft (regla_monitoreo_id);

CREATE INDEX IF NOT EXISTS ix_alerta_monitoreo_lft_usuario_id
  ON alerta_monitoreo_lft (usuario_id);

CREATE INDEX IF NOT EXISTS ix_alerta_monitoreo_lft_severidad
  ON alerta_monitoreo_lft (severidad);

CREATE INDEX IF NOT EXISTS ix_alerta_monitoreo_lft_estado
  ON alerta_monitoreo_lft (estado);

CREATE INDEX IF NOT EXISTS ix_alerta_monitoreo_lft_detectada_en
  ON alerta_monitoreo_lft (detectada_en);

CREATE UNIQUE INDEX IF NOT EXISTS uq_caso_investigacion_lft_codigo
  ON caso_investigacion_lft (codigo);

CREATE INDEX IF NOT EXISTS ix_caso_investigacion_lft_usuario_id
  ON caso_investigacion_lft (usuario_id);

CREATE INDEX IF NOT EXISTS ix_caso_investigacion_lft_estado
  ON caso_investigacion_lft (estado);

CREATE INDEX IF NOT EXISTS ix_caso_investigacion_lft_plazo_limite
  ON caso_investigacion_lft (plazo_limite);

CREATE UNIQUE INDEX IF NOT EXISTS uq_umbral_reporte_uif_concepto_operacion_es_acumulado__6ac35e
  ON umbral_reporte_uif (concepto_operacion, es_acumulado, vigente_desde, formulario);

CREATE INDEX IF NOT EXISTS ix_umbral_reporte_uif_activo
  ON umbral_reporte_uif (activo);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_usuario_id
  ON registro_operacion_relevante (usuario_id);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_transaccion_id
  ON registro_operacion_relevante (transaccion_id);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_umbral_reporte_id
  ON registro_operacion_relevante (umbral_reporte_id);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_formulario
  ON registro_operacion_relevante (formulario);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_monto_equivalente_usd
  ON registro_operacion_relevante (monto_equivalente_usd);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_periodo_remision
  ON registro_operacion_relevante (periodo_remision);

CREATE INDEX IF NOT EXISTS ix_registro_operacion_relevante_fecha_operacion
  ON registro_operacion_relevante (fecha_operacion);

CREATE UNIQUE INDEX IF NOT EXISTS uq_catalogo_reporte_regulatorio_codigo
  ON catalogo_reporte_regulatorio (codigo);

CREATE INDEX IF NOT EXISTS ix_catalogo_reporte_regulatorio_organismo
  ON catalogo_reporte_regulatorio (organismo);

CREATE INDEX IF NOT EXISTS ix_reporte_regulatorio_catalogo_reporte_id
  ON reporte_regulatorio (catalogo_reporte_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_reporte_regulatorio_catalogo_reporte_id_periodo
  ON reporte_regulatorio (catalogo_reporte_id, periodo);

CREATE INDEX IF NOT EXISTS ix_reporte_regulatorio_estado
  ON reporte_regulatorio (estado);

CREATE INDEX IF NOT EXISTS ix_reporte_regulatorio_fecha_limite
  ON reporte_regulatorio (fecha_limite);

CREATE INDEX IF NOT EXISTS ix_envio_regulatorio_reporte_regulatorio_id
  ON envio_regulatorio (reporte_regulatorio_id);

CREATE INDEX IF NOT EXISTS ix_envio_regulatorio_fecha_envio
  ON envio_regulatorio (fecha_envio);

CREATE UNIQUE INDEX IF NOT EXISTS uq_envio_regulatorio_numero_constancia
  ON envio_regulatorio (numero_constancia);

CREATE INDEX IF NOT EXISTS ix_envio_regulatorio_estado
  ON envio_regulatorio (estado);

CREATE INDEX IF NOT EXISTS ix_observacion_regulatoria_tipo
  ON observacion_regulatoria (tipo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_observacion_regulatoria_numero_documento
  ON observacion_regulatoria (numero_documento);

CREATE INDEX IF NOT EXISTS ix_observacion_regulatoria_plazo_respuesta
  ON observacion_regulatoria (plazo_respuesta);

CREATE INDEX IF NOT EXISTS ix_observacion_regulatoria_estado
  ON observacion_regulatoria (estado);

CREATE INDEX IF NOT EXISTS ix_requerimiento_autoridad_autoridad
  ON requerimiento_autoridad (autoridad);

CREATE UNIQUE INDEX IF NOT EXISTS uq_requerimiento_autoridad_numero_oficio
  ON requerimiento_autoridad (numero_oficio);

CREATE INDEX IF NOT EXISTS ix_requerimiento_autoridad_plazo_respuesta
  ON requerimiento_autoridad (plazo_respuesta);

CREATE INDEX IF NOT EXISTS ix_requerimiento_autoridad_estado
  ON requerimiento_autoridad (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_contrato_adhesion_version_codigo
  ON contrato_adhesion (version, codigo);

CREATE INDEX IF NOT EXISTS ix_contrato_adhesion_tipo
  ON contrato_adhesion (tipo);

CREATE INDEX IF NOT EXISTS ix_aceptacion_contrato_contrato_adhesion_id
  ON aceptacion_contrato (contrato_adhesion_id);

CREATE INDEX IF NOT EXISTS ix_aceptacion_contrato_usuario_id
  ON aceptacion_contrato (usuario_id);

CREATE INDEX IF NOT EXISTS ix_documento_publicado_tipo
  ON documento_publicado (tipo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_punto_reclamo_codigo
  ON punto_reclamo (codigo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_reclamo_cliente_codigo
  ON reclamo_cliente (codigo);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_usuario_id
  ON reclamo_cliente (usuario_id);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_categoria
  ON reclamo_cliente (categoria);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_estado
  ON reclamo_cliente (estado);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_fecha_ingreso
  ON reclamo_cliente (fecha_ingreso);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_plazo_respuesta
  ON reclamo_cliente (plazo_respuesta);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_incluido_en_reporte_mensual
  ON reclamo_cliente (incluido_en_reporte_mensual);

CREATE INDEX IF NOT EXISTS ix_reclamo_cliente_conservar_hasta
  ON reclamo_cliente (conservar_hasta);

CREATE INDEX IF NOT EXISTS ix_instancia_reclamo_reclamo_id
  ON instancia_reclamo (reclamo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evento_riesgo_operativo_codigo
  ON evento_riesgo_operativo (codigo);

CREATE INDEX IF NOT EXISTS ix_evento_riesgo_operativo_categoria_evento
  ON evento_riesgo_operativo (categoria_evento);

CREATE INDEX IF NOT EXISTS ix_evento_riesgo_operativo_factor_riesgo
  ON evento_riesgo_operativo (factor_riesgo);

CREATE INDEX IF NOT EXISTS ix_evento_riesgo_operativo_reportado_central_riesgo_operativo
  ON evento_riesgo_operativo (reportado_central_riesgo_operativo);

CREATE INDEX IF NOT EXISTS ix_evento_riesgo_operativo_fecha_ocurrencia
  ON evento_riesgo_operativo (fecha_ocurrencia);

CREATE INDEX IF NOT EXISTS ix_evento_riesgo_operativo_estado
  ON evento_riesgo_operativo (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_control_interno_codigo
  ON control_interno (codigo);

CREATE INDEX IF NOT EXISTS ix_control_interno_proceso
  ON control_interno (proceso);

CREATE INDEX IF NOT EXISTS ix_control_interno_activo
  ON control_interno (activo);

CREATE INDEX IF NOT EXISTS ix_prueba_control_control_id
  ON prueba_control (control_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_prueba_control_control_id_periodo
  ON prueba_control (control_id, periodo);

CREATE INDEX IF NOT EXISTS ix_prueba_control_resultado
  ON prueba_control (resultado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_hallazgo_auditoria_codigo
  ON hallazgo_auditoria (codigo);

CREATE INDEX IF NOT EXISTS ix_hallazgo_auditoria_origen
  ON hallazgo_auditoria (origen);

CREATE INDEX IF NOT EXISTS ix_hallazgo_auditoria_severidad
  ON hallazgo_auditoria (severidad);

CREATE INDEX IF NOT EXISTS ix_hallazgo_auditoria_plazo_regularizacion
  ON hallazgo_auditoria (plazo_regularizacion);

CREATE INDEX IF NOT EXISTS ix_hallazgo_auditoria_estado
  ON hallazgo_auditoria (estado);

CREATE INDEX IF NOT EXISTS ix_plan_accion_riesgo_fecha_compromiso
  ON plan_accion_riesgo (fecha_compromiso);

CREATE INDEX IF NOT EXISTS ix_plan_accion_riesgo_estado
  ON plan_accion_riesgo (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evaluacion_riesgo_producto_version_producto
  ON evaluacion_riesgo_producto (version, producto);

CREATE INDEX IF NOT EXISTS ix_oficial_cumplimiento_usuario_id
  ON oficial_cumplimiento (usuario_id);

CREATE INDEX IF NOT EXISTS ix_oficial_cumplimiento_activo
  ON oficial_cumplimiento (activo);

CREATE INDEX IF NOT EXISTS ix_capacitacion_cumplimiento_usuario_id
  ON capacitacion_cumplimiento (usuario_id);

CREATE INDEX IF NOT EXISTS ix_capacitacion_cumplimiento_fecha
  ON capacitacion_cumplimiento (fecha);

CREATE INDEX IF NOT EXISTS ix_capacitacion_cumplimiento_periodo
  ON capacitacion_cumplimiento (periodo);

CREATE INDEX IF NOT EXISTS ix_licencia_regulatoria_organismo
  ON licencia_regulatoria (organismo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_licencia_regulatoria_numero_resolucion
  ON licencia_regulatoria (numero_resolucion);

CREATE INDEX IF NOT EXISTS ix_licencia_regulatoria_estado
  ON licencia_regulatoria (estado);

CREATE INDEX IF NOT EXISTS ix_entorno_prueba_regulado_licencia_regulatoria_id
  ON entorno_prueba_regulado (licencia_regulatoria_id);

CREATE INDEX IF NOT EXISTS ix_entorno_prueba_regulado_estado
  ON entorno_prueba_regulado (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_comite_gobierno_tipo
  ON comite_gobierno (tipo);

CREATE INDEX IF NOT EXISTS ix_acta_comite_comite_gobierno_id
  ON acta_comite (comite_gobierno_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_acta_comite_comite_gobierno_id_numero
  ON acta_comite (comite_gobierno_id, numero);

CREATE INDEX IF NOT EXISTS ix_acta_comite_fecha
  ON acta_comite (fecha);

CREATE UNIQUE INDEX IF NOT EXISTS uq_politica_interna_version_codigo
  ON politica_interna (version, codigo);

CREATE INDEX IF NOT EXISTS ix_politica_interna_materia
  ON politica_interna (materia);

CREATE INDEX IF NOT EXISTS ix_politica_interna_estado
  ON politica_interna (estado);

CREATE INDEX IF NOT EXISTS ix_politica_interna_proxima_revision
  ON politica_interna (proxima_revision);

CREATE INDEX IF NOT EXISTS ix_designacion_regulatoria_usuario_id
  ON designacion_regulatoria (usuario_id);

CREATE INDEX IF NOT EXISTS ix_designacion_regulatoria_cargo
  ON designacion_regulatoria (cargo);

CREATE INDEX IF NOT EXISTS ix_designacion_regulatoria_activo
  ON designacion_regulatoria (activo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_activo_informacion_codigo
  ON activo_informacion (codigo);

CREATE INDEX IF NOT EXISTS ix_activo_informacion_clasificacion
  ON activo_informacion (clasificacion);

CREATE INDEX IF NOT EXISTS ix_activo_informacion_contiene_datos_personales
  ON activo_informacion (contiene_datos_personales);

CREATE UNIQUE INDEX IF NOT EXISTS uq_incidente_seguridad_codigo
  ON incidente_seguridad (codigo);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_activo_informacion_id
  ON incidente_seguridad (activo_informacion_id);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_tipo
  ON incidente_seguridad (tipo);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_severidad
  ON incidente_seguridad (severidad);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_datos_personales_afectados
  ON incidente_seguridad (datos_personales_afectados);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_detectado_en
  ON incidente_seguridad (detectado_en);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_plazo_reporte
  ON incidente_seguridad (plazo_reporte);

CREATE INDEX IF NOT EXISTS ix_incidente_seguridad_estado
  ON incidente_seguridad (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_plan_continuidad_proceso_critico
  ON plan_continuidad (proceso_critico);

CREATE INDEX IF NOT EXISTS ix_plan_continuidad_proxima_prueba
  ON plan_continuidad (proxima_prueba);

CREATE INDEX IF NOT EXISTS ix_prueba_continuidad_plan_continuidad_id
  ON prueba_continuidad (plan_continuidad_id);

CREATE INDEX IF NOT EXISTS ix_prueba_continuidad_fecha
  ON prueba_continuidad (fecha);

CREATE INDEX IF NOT EXISTS ix_prueba_continuidad_resultado
  ON prueba_continuidad (resultado);

CREATE INDEX IF NOT EXISTS ix_contrato_tercero_es_critico
  ON contrato_tercero (es_critico);

CREATE INDEX IF NOT EXISTS ix_contrato_tercero_accede_a_datos_personales
  ON contrato_tercero (accede_a_datos_personales);

CREATE INDEX IF NOT EXISTS ix_contrato_tercero_estado
  ON contrato_tercero (estado);

CREATE INDEX IF NOT EXISTS ix_evaluacion_tercero_contrato_tercero_id
  ON evaluacion_tercero (contrato_tercero_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evaluacion_tercero_contrato_tercero_id_periodo
  ON evaluacion_tercero (contrato_tercero_id, periodo);
