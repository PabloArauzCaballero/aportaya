-- Claves foráneas del módulo 02 — Grupos, Cupos, Turnos y Gobernanza
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE aceptacion_reglamento
  ADD CONSTRAINT fk_aceptacion_reglamento_participante_id
  FOREIGN KEY (participante_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE aceptacion_reglamento
  ADD CONSTRAINT fk_aceptacion_reglamento_reglamento_id
  FOREIGN KEY (reglamento_id) REFERENCES reglamento_grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE aceptacion_reglamento
  ADD CONSTRAINT fk_aceptacion_reglamento_token_firma_id
  FOREIGN KEY (token_firma_id) REFERENCES token_verificacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE acuerdo
  ADD CONSTRAINT fk_acuerdo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE acuerdo
  ADD CONSTRAINT fk_acuerdo_propuesto_por
  FOREIGN KEY (propuesto_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE configuracion_grupo
  ADD CONSTRAINT fk_configuracion_grupo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE configuracion_grupo
  ADD CONSTRAINT fk_configuracion_grupo_politica_mora_id
  FOREIGN KEY (politica_mora_id) REFERENCES politica_mora (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE configuracion_grupo
  ADD CONSTRAINT fk_configuracion_grupo_politica_sancion_id
  FOREIGN KEY (politica_sancion_id) REFERENCES politica_sancion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cupo
  ADD CONSTRAINT fk_cupo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cupo
  ADD CONSTRAINT fk_cupo_participante_id
  FOREIGN KEY (participante_id) REFERENCES participante (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE dia_no_habil
  ADD CONSTRAINT fk_dia_no_habil_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE grupo
  ADD CONSTRAINT fk_grupo_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE historial_estado_grupo
  ADD CONSTRAINT fk_historial_estado_grupo_ejecutado_por
  FOREIGN KEY (ejecutado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE historial_estado_grupo
  ADD CONSTRAINT fk_historial_estado_grupo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE invitacion
  ADD CONSTRAINT fk_invitacion_emisor_id
  FOREIGN KEY (emisor_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE invitacion
  ADD CONSTRAINT fk_invitacion_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE invitacion
  ADD CONSTRAINT fk_invitacion_token_id
  FOREIGN KEY (token_id) REFERENCES token_verificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE participante
  ADD CONSTRAINT fk_participante_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE participante
  ADD CONSTRAINT fk_participante_invitado_por_id
  FOREIGN KEY (invitado_por_id) REFERENCES participante (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE participante
  ADD CONSTRAINT fk_participante_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE periodo
  ADD CONSTRAINT fk_periodo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE postulacion_emparejamiento
  ADD CONSTRAINT fk_postulacion_emparejamiento_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE propuesta_grupo
  ADD CONSTRAINT fk_propuesta_grupo_criterio_id
  FOREIGN KEY (criterio_id) REFERENCES criterio_emparejamiento (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE propuesta_grupo
  ADD CONSTRAINT fk_propuesta_grupo_grupo_materializado_id
  FOREIGN KEY (grupo_materializado_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE propuesta_postulacion
  ADD CONSTRAINT fk_propuesta_postulacion_postulacion_id
  FOREIGN KEY (postulacion_id) REFERENCES postulacion_emparejamiento (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE propuesta_postulacion
  ADD CONSTRAINT fk_propuesta_postulacion_propuesta_id
  FOREIGN KEY (propuesta_id) REFERENCES propuesta_grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reglamento_grupo
  ADD CONSTRAINT fk_reglamento_grupo_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reglamento_grupo
  ADD CONSTRAINT fk_reglamento_grupo_redactado_por
  FOREIGN KEY (redactado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_ingreso
  ADD CONSTRAINT fk_solicitud_ingreso_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_ingreso
  ADD CONSTRAINT fk_solicitud_ingreso_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE solicitud_ingreso
  ADD CONSTRAINT fk_solicitud_ingreso_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_permuta
  ADD CONSTRAINT fk_solicitud_permuta_contraparte_id
  FOREIGN KEY (contraparte_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_permuta
  ADD CONSTRAINT fk_solicitud_permuta_solicitante_id
  FOREIGN KEY (solicitante_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_permuta
  ADD CONSTRAINT fk_solicitud_permuta_turno_destino_id
  FOREIGN KEY (turno_destino_id) REFERENCES turno (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_permuta
  ADD CONSTRAINT fk_solicitud_permuta_turno_origen_id
  FOREIGN KEY (turno_origen_id) REFERENCES turno (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_retiro
  ADD CONSTRAINT fk_solicitud_retiro_participante_id
  FOREIGN KEY (participante_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_retiro
  ADD CONSTRAINT fk_solicitud_retiro_plan_regularizacion_id
  FOREIGN KEY (plan_regularizacion_id) REFERENCES plan_regularizacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE sorteo_turnos
  ADD CONSTRAINT fk_sorteo_turnos_ejecutado_por
  FOREIGN KEY (ejecutado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sorteo_turnos
  ADD CONSTRAINT fk_sorteo_turnos_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE traspaso_cupo
  ADD CONSTRAINT fk_traspaso_cupo_aprobado_por_acuerdo_id
  FOREIGN KEY (aprobado_por_acuerdo_id) REFERENCES acuerdo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE traspaso_cupo
  ADD CONSTRAINT fk_traspaso_cupo_cupo_id
  FOREIGN KEY (cupo_id) REFERENCES cupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE traspaso_cupo
  ADD CONSTRAINT fk_traspaso_cupo_participante_destino_id
  FOREIGN KEY (participante_destino_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE traspaso_cupo
  ADD CONSTRAINT fk_traspaso_cupo_participante_origen_id
  FOREIGN KEY (participante_origen_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE turno
  ADD CONSTRAINT fk_turno_cupo_id
  FOREIGN KEY (cupo_id) REFERENCES cupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE turno
  ADD CONSTRAINT fk_turno_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE turno
  ADD CONSTRAINT fk_turno_periodo_id
  FOREIGN KEY (periodo_id) REFERENCES periodo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE turno
  ADD CONSTRAINT fk_turno_permutado_con_turno_id
  FOREIGN KEY (permutado_con_turno_id) REFERENCES turno (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE voto_participante
  ADD CONSTRAINT fk_voto_participante_acuerdo_id
  FOREIGN KEY (acuerdo_id) REFERENCES acuerdo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE voto_participante
  ADD CONSTRAINT fk_voto_participante_participante_id
  FOREIGN KEY (participante_id) REFERENCES participante (id) ON DELETE RESTRICT ON UPDATE CASCADE;
