-- Claves foráneas del módulo 09 — Auditoría, Reportes y Cumplimiento
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE alerta_cumplimiento
  ADD CONSTRAINT fk_alerta_cumplimiento_analista_id
  FOREIGN KEY (analista_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE alerta_cumplimiento
  ADD CONSTRAINT fk_alerta_cumplimiento_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE alerta_cumplimiento
  ADD CONSTRAINT fk_alerta_cumplimiento_regla_id
  FOREIGN KEY (regla_id) REFERENCES regla_cumplimiento (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE alerta_cumplimiento
  ADD CONSTRAINT fk_alerta_cumplimiento_reporte_sospechoso_id
  FOREIGN KEY (reporte_sospechoso_id) REFERENCES reporte_operacion_sospechosa (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE alerta_cumplimiento
  ADD CONSTRAINT fk_alerta_cumplimiento_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE bitacora_evento
  ADD CONSTRAINT fk_bitacora_evento_actor_usuario_id
  FOREIGN KEY (actor_usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE bitacora_evento
  ADD CONSTRAINT fk_bitacora_evento_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE bitacora_evento
  ADD CONSTRAINT fk_bitacora_evento_suplantando_a_usuario_id
  FOREIGN KEY (suplantando_a_usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE coincidencia_lista
  ADD CONSTRAINT fk_coincidencia_lista_lista_id
  FOREIGN KEY (lista_id) REFERENCES lista_restrictiva_externa (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE coincidencia_lista
  ADD CONSTRAINT fk_coincidencia_lista_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE coincidencia_lista
  ADD CONSTRAINT fk_coincidencia_lista_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ejecucion_reporte
  ADD CONSTRAINT fk_ejecucion_reporte_definicion_id
  FOREIGN KEY (definicion_id) REFERENCES definicion_reporte (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ejecucion_reporte
  ADD CONSTRAINT fk_ejecucion_reporte_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ejecucion_reporte
  ADD CONSTRAINT fk_ejecucion_reporte_solicitado_por
  FOREIGN KEY (solicitado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE exportacion_reporte
  ADD CONSTRAINT fk_exportacion_reporte_ejecucion_id
  FOREIGN KEY (ejecucion_id) REFERENCES ejecucion_reporte (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE proceso_anonimizacion
  ADD CONSTRAINT fk_proceso_anonimizacion_solicitud_id
  FOREIGN KEY (solicitud_id) REFERENCES solicitud_datos_personales (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE proceso_anonimizacion
  ADD CONSTRAINT fk_proceso_anonimizacion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE programacion_reporte
  ADD CONSTRAINT fk_programacion_reporte_definicion_id
  FOREIGN KEY (definicion_id) REFERENCES definicion_reporte (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE registro_acceso_datos
  ADD CONSTRAINT fk_registro_acceso_datos_usuario_afectado_id
  FOREIGN KEY (usuario_afectado_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE registro_acceso_datos
  ADD CONSTRAINT fk_registro_acceso_datos_usuario_consultor_id
  FOREIGN KEY (usuario_consultor_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reporte_operacion_sospechosa
  ADD CONSTRAINT fk_reporte_operacion_sospechosa_aprobado_por
  FOREIGN KEY (aprobado_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE reporte_operacion_sospechosa
  ADD CONSTRAINT fk_reporte_operacion_sospechosa_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_datos_personales
  ADD CONSTRAINT fk_solicitud_datos_personales_atendida_por
  FOREIGN KEY (atendida_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE solicitud_datos_personales
  ADD CONSTRAINT fk_solicitud_datos_personales_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE ticket_soporte
  ADD CONSTRAINT fk_ticket_soporte_asignado_a
  FOREIGN KEY (asignado_a) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ticket_soporte
  ADD CONSTRAINT fk_ticket_soporte_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;
