-- Claves foráneas del módulo 04 — Entregas de Fondo
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE confirmacion_recepcion
  ADD CONSTRAINT fk_confirmacion_recepcion_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE confirmacion_recepcion
  ADD CONSTRAINT fk_confirmacion_recepcion_token_confirmacion_id
  FOREIGN KEY (token_confirmacion_id) REFERENCES token_verificacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cuenta_bancaria_beneficiario
  ADD CONSTRAINT fk_cuenta_bancaria_beneficiario_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE deduccion_entrega
  ADD CONSTRAINT fk_deduccion_entrega_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_autorizada_por
  FOREIGN KEY (autorizada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_beneficiario_participante_id
  FOREIGN KEY (beneficiario_participante_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_cuenta_destino_id
  FOREIGN KEY (cuenta_destino_id) REFERENCES cuenta_bancaria_beneficiario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_cupo_id
  FOREIGN KEY (cupo_id) REFERENCES cupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_ejecutada_por
  FOREIGN KEY (ejecutada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_periodo_id
  FOREIGN KEY (periodo_id) REFERENCES periodo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE entrega_fondo
  ADD CONSTRAINT fk_entrega_fondo_turno_id
  FOREIGN KEY (turno_id) REFERENCES turno (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE historial_estado_entrega
  ADD CONSTRAINT fk_historial_estado_entrega_ejecutado_por
  FOREIGN KEY (ejecutado_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE historial_estado_entrega
  ADD CONSTRAINT fk_historial_estado_entrega_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE incidencia_entrega
  ADD CONSTRAINT fk_incidencia_entrega_asignada_a
  FOREIGN KEY (asignada_a) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE incidencia_entrega
  ADD CONSTRAINT fk_incidencia_entrega_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE incidencia_entrega
  ADD CONSTRAINT fk_incidencia_entrega_reportada_por
  FOREIGN KEY (reportada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE intento_desembolso
  ADD CONSTRAINT fk_intento_desembolso_orden_desembolso_id
  FOREIGN KEY (orden_desembolso_id) REFERENCES orden_desembolso (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_desembolso
  ADD CONSTRAINT fk_orden_desembolso_cuenta_destino_id
  FOREIGN KEY (cuenta_destino_id) REFERENCES cuenta_bancaria_beneficiario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_desembolso
  ADD CONSTRAINT fk_orden_desembolso_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_desembolso
  ADD CONSTRAINT fk_orden_desembolso_proveedor_id
  FOREIGN KEY (proveedor_id) REFERENCES proveedor_pago (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE validacion_pre_entrega
  ADD CONSTRAINT fk_validacion_pre_entrega_entrega_id
  FOREIGN KEY (entrega_id) REFERENCES entrega_fondo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE validacion_pre_entrega
  ADD CONSTRAINT fk_validacion_pre_entrega_omitida_por
  FOREIGN KEY (omitida_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE validacion_pre_entrega
  ADD CONSTRAINT fk_validacion_pre_entrega_regla_id
  FOREIGN KEY (regla_id) REFERENCES regla_entrega (id) ON DELETE RESTRICT ON UPDATE CASCADE;
