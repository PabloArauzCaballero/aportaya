-- Índices y restricciones de unicidad del módulo 09 — Auditoría, Reportes y Cumplimiento
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_bitacora_evento_secuencia
  ON bitacora_evento (secuencia);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_entidad
  ON bitacora_evento (entidad);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_entidad_id
  ON bitacora_evento (entidad_id);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_accion
  ON bitacora_evento (accion);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_actor_usuario_id
  ON bitacora_evento (actor_usuario_id);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_correlation_id
  ON bitacora_evento (correlation_id);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_grupo_id
  ON bitacora_evento (grupo_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_bitacora_evento_hash_registro
  ON bitacora_evento (hash_registro);

CREATE INDEX IF NOT EXISTS ix_bitacora_evento_fecha_hora
  ON bitacora_evento (fecha_hora);

CREATE INDEX IF NOT EXISTS ix_evento_dominio_tipo
  ON evento_dominio (tipo);

CREATE INDEX IF NOT EXISTS ix_evento_dominio_agregado_id
  ON evento_dominio (agregado_id);

CREATE INDEX IF NOT EXISTS ix_evento_dominio_correlation_id
  ON evento_dominio (correlation_id);

CREATE INDEX IF NOT EXISTS ix_evento_dominio_ocurrido_en
  ON evento_dominio (ocurrido_en);

CREATE INDEX IF NOT EXISTS ix_evento_dominio_estado
  ON evento_dominio (estado);

CREATE INDEX IF NOT EXISTS ix_registro_acceso_datos_usuario_consultor_id
  ON registro_acceso_datos (usuario_consultor_id);

CREATE INDEX IF NOT EXISTS ix_registro_acceso_datos_usuario_afectado_id
  ON registro_acceso_datos (usuario_afectado_id);

CREATE INDEX IF NOT EXISTS ix_registro_acceso_datos_fecha_hora
  ON registro_acceso_datos (fecha_hora);

CREATE UNIQUE INDEX IF NOT EXISTS uq_politica_retencion_entidad
  ON politica_retencion (entidad);

CREATE UNIQUE INDEX IF NOT EXISTS uq_definicion_reporte_nombre
  ON definicion_reporte (nombre);

CREATE INDEX IF NOT EXISTS ix_ejecucion_reporte_definicion_id
  ON ejecucion_reporte (definicion_id);

CREATE INDEX IF NOT EXISTS ix_ejecucion_reporte_solicitado_por
  ON ejecucion_reporte (solicitado_por);

CREATE INDEX IF NOT EXISTS ix_ejecucion_reporte_estado
  ON ejecucion_reporte (estado);

CREATE INDEX IF NOT EXISTS ix_exportacion_reporte_ejecucion_id
  ON exportacion_reporte (ejecucion_id);

CREATE INDEX IF NOT EXISTS ix_exportacion_reporte_expira_en
  ON exportacion_reporte (expira_en);

CREATE INDEX IF NOT EXISTS ix_programacion_reporte_definicion_id
  ON programacion_reporte (definicion_id);

CREATE INDEX IF NOT EXISTS ix_programacion_reporte_proxima_ejecucion_en
  ON programacion_reporte (proxima_ejecucion_en);

CREATE UNIQUE INDEX IF NOT EXISTS uq_indicador_kpi_dimension_dimension_id_periodo_codigo
  ON indicador_kpi (dimension, dimension_id, periodo, codigo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_regla_cumplimiento_codigo
  ON regla_cumplimiento (codigo);

CREATE INDEX IF NOT EXISTS ix_alerta_cumplimiento_regla_id
  ON alerta_cumplimiento (regla_id);

CREATE INDEX IF NOT EXISTS ix_alerta_cumplimiento_usuario_id
  ON alerta_cumplimiento (usuario_id);

CREATE INDEX IF NOT EXISTS ix_alerta_cumplimiento_operacion_id
  ON alerta_cumplimiento (operacion_id);

CREATE INDEX IF NOT EXISTS ix_alerta_cumplimiento_estado
  ON alerta_cumplimiento (estado);

CREATE INDEX IF NOT EXISTS ix_alerta_cumplimiento_detectada_en
  ON alerta_cumplimiento (detectada_en);

CREATE INDEX IF NOT EXISTS ix_reporte_operacion_sospechosa_usuario_id
  ON reporte_operacion_sospechosa (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_reporte_operacion_sospechosa_numero_radicado
  ON reporte_operacion_sospechosa (numero_radicado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_lista_restrictiva_externa_version_nombre_lista
  ON lista_restrictiva_externa (version, nombre_lista);

CREATE INDEX IF NOT EXISTS ix_coincidencia_lista_lista_id
  ON coincidencia_lista (lista_id);

CREATE INDEX IF NOT EXISTS ix_coincidencia_lista_usuario_id
  ON coincidencia_lista (usuario_id);

CREATE INDEX IF NOT EXISTS ix_coincidencia_lista_estado
  ON coincidencia_lista (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_umbral_operativo_nivel_kyc_requerido_concepto
  ON umbral_operativo (nivel_kyc_requerido, concepto);

CREATE INDEX IF NOT EXISTS ix_solicitud_datos_personales_usuario_id
  ON solicitud_datos_personales (usuario_id);

CREATE INDEX IF NOT EXISTS ix_solicitud_datos_personales_estado
  ON solicitud_datos_personales (estado);

CREATE INDEX IF NOT EXISTS ix_solicitud_datos_personales_fecha_limite_legal
  ON solicitud_datos_personales (fecha_limite_legal);

CREATE UNIQUE INDEX IF NOT EXISTS uq_proceso_anonimizacion_usuario_id
  ON proceso_anonimizacion (usuario_id);

CREATE INDEX IF NOT EXISTS ix_ticket_soporte_usuario_id
  ON ticket_soporte (usuario_id);

CREATE INDEX IF NOT EXISTS ix_ticket_soporte_asignado_a
  ON ticket_soporte (asignado_a);

CREATE INDEX IF NOT EXISTS ix_ticket_soporte_estado
  ON ticket_soporte (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_incidente_operativo_codigo
  ON incidente_operativo (codigo);
