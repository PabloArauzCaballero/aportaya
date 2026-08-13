-- Índices y restricciones de unicidad del módulo 05 — Notificaciones y Comunicaciones
-- Generado por scripts/generar_ddl.py — no editar a mano.

CREATE UNIQUE INDEX IF NOT EXISTS uq_evento_notificable_tipo
  ON evento_notificable (tipo);

CREATE UNIQUE INDEX IF NOT EXISTS uq_plantilla_mensaje_codigo
  ON plantilla_mensaje (codigo);

CREATE INDEX IF NOT EXISTS ix_plantilla_mensaje_evento_id
  ON plantilla_mensaje (evento_id);

CREATE INDEX IF NOT EXISTS ix_version_plantilla_plantilla_id
  ON version_plantilla (plantilla_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_version_plantilla_plantilla_id_idioma_version
  ON version_plantilla (plantilla_id, idioma, version);

CREATE UNIQUE INDEX IF NOT EXISTS uq_proveedor_mensajeria_codigo
  ON proveedor_mensajeria (codigo);

CREATE INDEX IF NOT EXISTS ix_canal_vinculado_usuario_id
  ON canal_vinculado (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_canal_vinculado_tipo_identificador
  ON canal_vinculado (tipo, identificador);

CREATE INDEX IF NOT EXISTS ix_canal_vinculado_estado
  ON canal_vinculado (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_lista_supresion_canal_identificador
  ON lista_supresion (canal, identificador);

CREATE INDEX IF NOT EXISTS ix_notificacion_usuario_id
  ON notificacion (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_notificacion_clave_deduplicacion
  ON notificacion (clave_deduplicacion);

CREATE INDEX IF NOT EXISTS ix_notificacion_estado
  ON notificacion (estado);

CREATE INDEX IF NOT EXISTS ix_notificacion_programada_para
  ON notificacion (programada_para);

CREATE INDEX IF NOT EXISTS ix_notificacion_creada_en
  ON notificacion (creada_en);

CREATE INDEX IF NOT EXISTS ix_notificacion_correlation_id
  ON notificacion (correlation_id);

CREATE INDEX IF NOT EXISTS ix_envio_notificacion_notificacion_id
  ON envio_notificacion (notificacion_id);

CREATE INDEX IF NOT EXISTS ix_envio_notificacion_estado
  ON envio_notificacion (estado);

CREATE UNIQUE INDEX IF NOT EXISTS uq_envio_notificacion_id_mensaje_proveedor
  ON envio_notificacion (id_mensaje_proveedor);

CREATE INDEX IF NOT EXISTS ix_envio_notificacion_proximo_reintento_en
  ON envio_notificacion (proximo_reintento_en);

CREATE INDEX IF NOT EXISTS ix_evento_entrega_mensaje_envio_id
  ON evento_entrega_mensaje (envio_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_evento_entrega_mensaje_clave_idempotencia
  ON evento_entrega_mensaje (clave_idempotencia);

CREATE UNIQUE INDEX IF NOT EXISTS uq_cola_envio_envio_id
  ON cola_envio (envio_id);

CREATE INDEX IF NOT EXISTS ix_cola_envio_particion
  ON cola_envio (particion);

CREATE INDEX IF NOT EXISTS ix_cola_envio_disponible_en
  ON cola_envio (disponible_en);

CREATE INDEX IF NOT EXISTS ix_cola_muerta_envio_id
  ON cola_muerta (envio_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_notificado_notificacion_id
  ON enlace_pago_notificado (notificacion_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_notificado_token_id
  ON enlace_pago_notificado (token_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_enlace_pago_notificado_url_corta
  ON enlace_pago_notificado (url_corta);

CREATE INDEX IF NOT EXISTS ix_respuesta_entrante_canal_vinculado_id
  ON respuesta_entrante (canal_vinculado_id);

CREATE INDEX IF NOT EXISTS ix_respuesta_entrante_recibida_en
  ON respuesta_entrante (recibida_en);

CREATE INDEX IF NOT EXISTS ix_bandeja_entrada_usuario_id
  ON bandeja_entrada (usuario_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_bandeja_entrada_notificacion_id
  ON bandeja_entrada (notificacion_id);

CREATE INDEX IF NOT EXISTS ix_bandeja_entrada_leida
  ON bandeja_entrada (leida);
