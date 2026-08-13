-- Claves foráneas del módulo 05 — Notificaciones y Comunicaciones
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE bandeja_entrada
  ADD CONSTRAINT fk_bandeja_entrada_notificacion_id
  FOREIGN KEY (notificacion_id) REFERENCES notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE bandeja_entrada
  ADD CONSTRAINT fk_bandeja_entrada_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE canal_vinculado
  ADD CONSTRAINT fk_canal_vinculado_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cola_envio
  ADD CONSTRAINT fk_cola_envio_envio_id
  FOREIGN KEY (envio_id) REFERENCES envio_notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cola_muerta
  ADD CONSTRAINT fk_cola_muerta_envio_id
  FOREIGN KEY (envio_id) REFERENCES envio_notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE enlace_pago_notificado
  ADD CONSTRAINT fk_enlace_pago_notificado_notificacion_id
  FOREIGN KEY (notificacion_id) REFERENCES notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE enlace_pago_notificado
  ADD CONSTRAINT fk_enlace_pago_notificado_orden_cobro_id
  FOREIGN KEY (orden_cobro_id) REFERENCES orden_cobro (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE enlace_pago_notificado
  ADD CONSTRAINT fk_enlace_pago_notificado_token_id
  FOREIGN KEY (token_id) REFERENCES token_verificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE envio_notificacion
  ADD CONSTRAINT fk_envio_notificacion_canal_vinculado_id
  FOREIGN KEY (canal_vinculado_id) REFERENCES canal_vinculado (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE envio_notificacion
  ADD CONSTRAINT fk_envio_notificacion_notificacion_id
  FOREIGN KEY (notificacion_id) REFERENCES notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE envio_notificacion
  ADD CONSTRAINT fk_envio_notificacion_proveedor_id
  FOREIGN KEY (proveedor_id) REFERENCES proveedor_mensajeria (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE envio_notificacion
  ADD CONSTRAINT fk_envio_notificacion_version_plantilla_id
  FOREIGN KEY (version_plantilla_id) REFERENCES version_plantilla (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE evento_entrega_mensaje
  ADD CONSTRAINT fk_evento_entrega_mensaje_envio_id
  FOREIGN KEY (envio_id) REFERENCES envio_notificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE notificacion
  ADD CONSTRAINT fk_notificacion_evento_id
  FOREIGN KEY (evento_id) REFERENCES evento_notificable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE notificacion
  ADD CONSTRAINT fk_notificacion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE plantilla_mensaje
  ADD CONSTRAINT fk_plantilla_mensaje_evento_id
  FOREIGN KEY (evento_id) REFERENCES evento_notificable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE programacion_recordatorio
  ADD CONSTRAINT fk_programacion_recordatorio_evento_id
  FOREIGN KEY (evento_id) REFERENCES evento_notificable (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE programacion_recordatorio
  ADD CONSTRAINT fk_programacion_recordatorio_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE respuesta_entrante
  ADD CONSTRAINT fk_respuesta_entrante_canal_vinculado_id
  FOREIGN KEY (canal_vinculado_id) REFERENCES canal_vinculado (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE respuesta_entrante
  ADD CONSTRAINT fk_respuesta_entrante_notificacion_relacionada_id
  FOREIGN KEY (notificacion_relacionada_id) REFERENCES notificacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE version_plantilla
  ADD CONSTRAINT fk_version_plantilla_plantilla_id
  FOREIGN KEY (plantilla_id) REFERENCES plantilla_mensaje (id) ON DELETE RESTRICT ON UPDATE CASCADE;
