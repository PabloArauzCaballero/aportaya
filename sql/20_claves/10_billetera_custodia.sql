-- Claves foráneas del módulo 10 — Billetera, Custodia y Dinero Electrónico
-- Generado por scripts/generar_ddl.py — no editar a mano.
-- Se aplican después de crear todas las tablas: el modelo tiene
-- referencias circulares entre módulos.

ALTER TABLE arqueo_punto_atencion
  ADD CONSTRAINT fk_arqueo_punto_atencion_arqueado_por
  FOREIGN KEY (arqueado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE arqueo_punto_atencion
  ADD CONSTRAINT fk_arqueo_punto_atencion_punto_atencion_id
  FOREIGN KEY (punto_atencion_id) REFERENCES punto_atencion (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE bloqueo_saldo
  ADD CONSTRAINT fk_bloqueo_saldo_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE bloqueo_saldo
  ADD CONSTRAINT fk_bloqueo_saldo_levantada_por
  FOREIGN KEY (levantada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE bloqueo_saldo
  ADD CONSTRAINT fk_bloqueo_saldo_retencion_id
  FOREIGN KEY (retencion_id) REFERENCES retencion_saldo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE certificado_saldo
  ADD CONSTRAINT fk_certificado_saldo_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE certificado_saldo
  ADD CONSTRAINT fk_certificado_saldo_solicitado_por
  FOREIGN KEY (solicitado_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE conciliacion_custodia
  ADD CONSTRAINT fk_conciliacion_custodia_cierre_diario_id
  FOREIGN KEY (cierre_diario_id) REFERENCES cierre_diario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE conciliacion_custodia
  ADD CONSTRAINT fk_conciliacion_custodia_cuenta_custodia_id
  FOREIGN KEY (cuenta_custodia_id) REFERENCES cuenta_custodia (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE conciliacion_custodia
  ADD CONSTRAINT fk_conciliacion_custodia_ejecutada_por
  FOREIGN KEY (ejecutada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE consumo_limite
  ADD CONSTRAINT fk_consumo_limite_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE consumo_limite
  ADD CONSTRAINT fk_consumo_limite_limite_id
  FOREIGN KEY (limite_id) REFERENCES limite_operativo_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cuenta_billetera
  ADD CONSTRAINT fk_cuenta_billetera_cuenta_contable_id
  FOREIGN KEY (cuenta_contable_id) REFERENCES cuenta_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cuenta_billetera
  ADD CONSTRAINT fk_cuenta_billetera_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cuenta_billetera
  ADD CONSTRAINT fk_cuenta_billetera_politica_billetera_id
  FOREIGN KEY (politica_billetera_id) REFERENCES politica_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE cuenta_billetera
  ADD CONSTRAINT fk_cuenta_billetera_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE descuadre_custodia
  ADD CONSTRAINT fk_descuadre_custodia_conciliacion_custodia_id
  FOREIGN KEY (conciliacion_custodia_id) REFERENCES conciliacion_custodia (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE descuadre_custodia
  ADD CONSTRAINT fk_descuadre_custodia_incidente_operativo_id
  FOREIGN KEY (incidente_operativo_id) REFERENCES incidente_operativo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE descuadre_custodia
  ADD CONSTRAINT fk_descuadre_custodia_resuelto_por
  FOREIGN KEY (resuelto_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE estado_cuenta_billetera
  ADD CONSTRAINT fk_estado_cuenta_billetera_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE evaluacion_antifraude
  ADD CONSTRAINT fk_evaluacion_antifraude_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE evaluacion_antifraude
  ADD CONSTRAINT fk_evaluacion_antifraude_revisada_por
  FOREIGN KEY (revisada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE evaluacion_antifraude
  ADD CONSTRAINT fk_evaluacion_antifraude_transaccion_id
  FOREIGN KEY (transaccion_id) REFERENCES transaccion_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE instrumento_fondeo
  ADD CONSTRAINT fk_instrumento_fondeo_usuario_id
  FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE movimiento_billetera
  ADD CONSTRAINT fk_movimiento_billetera_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE movimiento_billetera
  ADD CONSTRAINT fk_movimiento_billetera_transaccion_id
  FOREIGN KEY (transaccion_id) REFERENCES transaccion_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE movimiento_custodia
  ADD CONSTRAINT fk_movimiento_custodia_cuenta_custodia_id
  FOREIGN KEY (cuenta_custodia_id) REFERENCES cuenta_custodia (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE movimiento_custodia
  ADD CONSTRAINT fk_movimiento_custodia_movimiento_bancario_id
  FOREIGN KEY (movimiento_bancario_id) REFERENCES movimiento_bancario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_instrumento_fondeo_id
  FOREIGN KEY (instrumento_fondeo_id) REFERENCES instrumento_fondeo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_pago_id
  FOREIGN KEY (pago_id) REFERENCES pago (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_proveedor_id
  FOREIGN KEY (proveedor_id) REFERENCES proveedor_pago (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_punto_atencion_id
  FOREIGN KEY (punto_atencion_id) REFERENCES punto_atencion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_recarga
  ADD CONSTRAINT fk_orden_recarga_transaccion_id
  FOREIGN KEY (transaccion_id) REFERENCES transaccion_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_instrumento_destino_id
  FOREIGN KEY (instrumento_destino_id) REFERENCES instrumento_fondeo (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_proveedor_id
  FOREIGN KEY (proveedor_id) REFERENCES proveedor_pago (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_retencion_id
  FOREIGN KEY (retencion_id) REFERENCES retencion_saldo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE orden_retiro
  ADD CONSTRAINT fk_orden_retiro_transaccion_id
  FOREIGN KEY (transaccion_id) REFERENCES transaccion_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE politica_billetera
  ADD CONSTRAINT fk_politica_billetera_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE punto_atencion
  ADD CONSTRAINT fk_punto_atencion_responsable_usuario_id
  FOREIGN KEY (responsable_usuario_id) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE regla_antifraude
  ADD CONSTRAINT fk_regla_antifraude_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE retencion_saldo
  ADD CONSTRAINT fk_retencion_saldo_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE retencion_saldo
  ADD CONSTRAINT fk_retencion_saldo_liberada_por
  FOREIGN KEY (liberada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE retencion_saldo
  ADD CONSTRAINT fk_retencion_saldo_transaccion_origen_id
  FOREIGN KEY (transaccion_origen_id) REFERENCES transaccion_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE reverso_transaccion
  ADD CONSTRAINT fk_reverso_transaccion_autorizada_por
  FOREIGN KEY (autorizada_por) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reverso_transaccion
  ADD CONSTRAINT fk_reverso_transaccion_transaccion_original_id
  FOREIGN KEY (transaccion_original_id) REFERENCES transaccion_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE reverso_transaccion
  ADD CONSTRAINT fk_reverso_transaccion_transaccion_reverso_id
  FOREIGN KEY (transaccion_reverso_id) REFERENCES transaccion_billetera (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE saldo_diario_billetera
  ADD CONSTRAINT fk_saldo_diario_billetera_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_cierre_billetera
  ADD CONSTRAINT fk_solicitud_cierre_billetera_aprobada_por
  FOREIGN KEY (aprobada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE solicitud_cierre_billetera
  ADD CONSTRAINT fk_solicitud_cierre_billetera_cuenta_billetera_id
  FOREIGN KEY (cuenta_billetera_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE solicitud_cierre_billetera
  ADD CONSTRAINT fk_solicitud_cierre_billetera_orden_retiro_id
  FOREIGN KEY (orden_retiro_id) REFERENCES orden_retiro (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transaccion_billetera
  ADD CONSTRAINT fk_transaccion_billetera_asiento_contable_id
  FOREIGN KEY (asiento_contable_id) REFERENCES asiento_contable (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transaccion_billetera
  ADD CONSTRAINT fk_transaccion_billetera_dispositivo_id
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transaccion_billetera
  ADD CONSTRAINT fk_transaccion_billetera_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transaccion_billetera
  ADD CONSTRAINT fk_transaccion_billetera_iniciada_por
  FOREIGN KEY (iniciada_por) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transaccion_billetera
  ADD CONSTRAINT fk_transaccion_billetera_sesion_id
  FOREIGN KEY (sesion_id) REFERENCES sesion (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transferencia_p2p
  ADD CONSTRAINT fk_transferencia_p2p_cuenta_billetera_destino_id
  FOREIGN KEY (cuenta_billetera_destino_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE transferencia_p2p
  ADD CONSTRAINT fk_transferencia_p2p_cuenta_billetera_origen_id
  FOREIGN KEY (cuenta_billetera_origen_id) REFERENCES cuenta_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE transferencia_p2p
  ADD CONSTRAINT fk_transferencia_p2p_grupo_id
  FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transferencia_p2p
  ADD CONSTRAINT fk_transferencia_p2p_obligacion_id
  FOREIGN KEY (obligacion_id) REFERENCES obligacion_aporte (id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE transferencia_p2p
  ADD CONSTRAINT fk_transferencia_p2p_transaccion_id
  FOREIGN KEY (transaccion_id) REFERENCES transaccion_billetera (id) ON DELETE RESTRICT ON UPDATE CASCADE;
