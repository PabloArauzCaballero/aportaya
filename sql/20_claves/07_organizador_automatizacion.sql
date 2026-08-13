-- Claves foráneas del módulo 07 — Organizador y Automatización
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE apelacion_sancion_org
  ADD CONSTRAINT fk_apelacion_sancion_org_resuelta_por
  FOREIGN KEY (resuelta_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE apelacion_sancion_org
  ADD CONSTRAINT fk_apelacion_sancion_org_sancion_organizador_id
  FOREIGN KEY (sancion_organizador_id) REFERENCES sancion_organizador (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE capacitacion_organizador
  ADD CONSTRAINT fk_capacitacion_organizador_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE contrato_organizador
  ADD CONSTRAINT fk_contrato_organizador_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE contrato_organizador
  ADD CONSTRAINT fk_contrato_organizador_token_firma_id
  FOREIGN KEY (token_firma_id) REFERENCES token_verificacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE ejecucion_tarea
  ADD CONSTRAINT fk_ejecucion_tarea_tarea_id
  FOREIGN KEY (tarea_id) REFERENCES tarea_automatizada (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE evaluacion_desempeno
  ADD CONSTRAINT fk_evaluacion_desempeno_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE metrica_organizador
  ADD CONSTRAINT fk_metrica_organizador_evaluacion_id
  FOREIGN KEY (evaluacion_id) REFERENCES evaluacion_desempeno (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE organizador
  ADD CONSTRAINT fk_organizador_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sancion_organizador
  ADD CONSTRAINT fk_sancion_organizador_aplicada_por
  FOREIGN KEY (aplicada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sancion_organizador
  ADD CONSTRAINT fk_sancion_organizador_evaluacion_id
  FOREIGN KEY (evaluacion_id) REFERENCES evaluacion_desempeno (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE sancion_organizador
  ADD CONSTRAINT fk_sancion_organizador_organizador_id
  FOREIGN KEY (organizador_id) REFERENCES organizador (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_organizador
  ADD CONSTRAINT fk_solicitud_organizador_kyc_reforzado_id
  FOREIGN KEY (kyc_reforzado_id) REFERENCES verificacion_kyc (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE solicitud_organizador
  ADD CONSTRAINT fk_solicitud_organizador_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE solicitud_organizador
  ADD CONSTRAINT fk_solicitud_organizador_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE tarea_automatizada
  ADD CONSTRAINT fk_tarea_automatizada_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE tarea_automatizada
  ADD CONSTRAINT fk_tarea_automatizada_regla_id
  FOREIGN KEY (regla_id) REFERENCES regla_automatizacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;
