-- Claves foráneas del módulo 01 — Identidad, Usuarios y Seguridad
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE asignacion_rol
  ADD CONSTRAINT fk_asignacion_rol_otorgada_por
  FOREIGN KEY (otorgada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE asignacion_rol
  ADD CONSTRAINT fk_asignacion_rol_rol_id
  FOREIGN KEY (rol_id) REFERENCES rol (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE asignacion_rol
  ADD CONSTRAINT fk_asignacion_rol_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE bloqueo_cuenta
  ADD CONSTRAINT fk_bloqueo_cuenta_liberada_por
  FOREIGN KEY (liberada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE bloqueo_cuenta
  ADD CONSTRAINT fk_bloqueo_cuenta_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE consentimiento
  ADD CONSTRAINT fk_consentimiento_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE credencial_acceso
  ADD CONSTRAINT fk_credencial_acceso_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE direccion_usuario
  ADD CONSTRAINT fk_direccion_usuario_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE dispositivo
  ADD CONSTRAINT fk_dispositivo_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE documento_identidad
  ADD CONSTRAINT fk_documento_identidad_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE factor_mfa
  ADD CONSTRAINT fk_factor_mfa_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE historial_credencial
  ADD CONSTRAINT fk_historial_credencial_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE intento_autenticacion
  ADD CONSTRAINT fk_intento_autenticacion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE intento_validacion_token
  ADD CONSTRAINT fk_intento_validacion_token_token_id
  FOREIGN KEY (token_id) REFERENCES token_verificacion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE perfil_financiero
  ADD CONSTRAINT fk_perfil_financiero_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE preferencia_notificacion
  ADD CONSTRAINT fk_preferencia_notificacion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE referencia_personal
  ADD CONSTRAINT fk_referencia_personal_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reputacion_usuario
  ADD CONSTRAINT fk_reputacion_usuario_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE restriccion_usuario
  ADD CONSTRAINT fk_restriccion_usuario_levantada_por
  FOREIGN KEY (levantada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE restriccion_usuario
  ADD CONSTRAINT fk_restriccion_usuario_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE rol_permiso
  ADD CONSTRAINT fk_rol_permiso_permiso_id
  FOREIGN KEY (permiso_id) REFERENCES permiso (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE rol_permiso
  ADD CONSTRAINT fk_rol_permiso_rol_id
  FOREIGN KEY (rol_id) REFERENCES rol (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sesion
  ADD CONSTRAINT fk_sesion_dispositivo_id
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sesion
  ADD CONSTRAINT fk_sesion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_baja
  ADD CONSTRAINT fk_solicitud_baja_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE token_verificacion
  ADD CONSTRAINT fk_token_verificacion_dispositivo_id
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE token_verificacion
  ADD CONSTRAINT fk_token_verificacion_politica_id
  FOREIGN KEY (politica_id) REFERENCES politica_token (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE token_verificacion
  ADD CONSTRAINT fk_token_verificacion_rotado_de_id
  FOREIGN KEY (rotado_de_id) REFERENCES token_verificacion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE token_verificacion
  ADD CONSTRAINT fk_token_verificacion_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE verificacion_kyc
  ADD CONSTRAINT fk_verificacion_kyc_documento_id
  FOREIGN KEY (documento_id) REFERENCES documento_identidad (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE verificacion_kyc
  ADD CONSTRAINT fk_verificacion_kyc_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE verificacion_kyc
  ADD CONSTRAINT fk_verificacion_kyc_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;
