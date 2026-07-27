---
tags:
  - moc
  - indice
relaciones_fk: 334
cross_modulo: 164
---

# Índice de relaciones (claves foráneas)

Las **334 claves foráneas** del modelo. **164** cruzan módulos.

[[Index|← Índice general]] · [[_Entidades|Entidades →]]

## Referencias que cruzan módulos

Son las que acoplan el sistema: conviene revisarlas antes de tocar un módulo.

| Origen | Columna | Destino | Módulos | Opcional | Relación |
| --- | --- | --- | :-: | :-: | --- |
| [[token_verificacion]] | `politica_id` | [[politica_sancion]] | 01 → 08 | no | [[token_verificacion.politica_id → politica_sancion\|ver]] |
| [[aceptacion_reglamento]] | `token_firma_id` | [[token_verificacion]] | 02 → 01 | sí | [[aceptacion_reglamento.token_firma_id → token_verificacion\|ver]] |
| [[acuerdo]] | `propuesto_por` | [[usuario]] | 02 → 01 | no | [[acuerdo.propuesto_por → usuario\|ver]] |
| [[configuracion_grupo]] | `politica_mora_id` | [[politica_mora]] | 02 → 03 | sí | [[configuracion_grupo.politica_mora_id → politica_mora\|ver]] |
| [[configuracion_grupo]] | `politica_sancion_id` | [[politica_sancion]] | 02 → 08 | sí | [[configuracion_grupo.politica_sancion_id → politica_sancion\|ver]] |
| [[grupo]] | `organizador_id` | [[organizador]] | 02 → 07 | sí | [[grupo.organizador_id → organizador\|ver]] |
| [[historial_estado_grupo]] | `ejecutado_por` | [[usuario]] | 02 → 01 | no | [[historial_estado_grupo.ejecutado_por → usuario\|ver]] |
| [[invitacion]] | `emisor_id` | [[usuario]] | 02 → 01 | no | [[invitacion.emisor_id → usuario\|ver]] |
| [[invitacion]] | `token_id` | [[token_verificacion]] | 02 → 01 | no | [[invitacion.token_id → token_verificacion\|ver]] |
| [[participante]] | `usuario_id` | [[usuario]] | 02 → 01 | no | [[participante.usuario_id → usuario\|ver]] |
| [[postulacion_emparejamiento]] | `usuario_id` | [[usuario]] | 02 → 01 | no | [[postulacion_emparejamiento.usuario_id → usuario\|ver]] |
| [[reglamento_grupo]] | `redactado_por` | [[usuario]] | 02 → 01 | no | [[reglamento_grupo.redactado_por → usuario\|ver]] |
| [[solicitud_ingreso]] | `revisada_por` | [[usuario]] | 02 → 01 | sí | [[solicitud_ingreso.revisada_por → usuario\|ver]] |
| [[solicitud_ingreso]] | `usuario_id` | [[usuario]] | 02 → 01 | no | [[solicitud_ingreso.usuario_id → usuario\|ver]] |
| [[sorteo_turnos]] | `ejecutado_por` | [[usuario]] | 02 → 01 | no | [[sorteo_turnos.ejecutado_por → usuario\|ver]] |
| [[asiento_contable]] | `grupo_id` | [[grupo]] | 03 → 02 | sí | [[asiento_contable.grupo_id → grupo\|ver]] |
| [[asiento_contable]] | `registrado_por` | [[usuario]] | 03 → 01 | sí | [[asiento_contable.registrado_por → usuario\|ver]] |
| [[cierre_diario]] | `cerrado_por` | [[usuario]] | 03 → 01 | no | [[cierre_diario.cerrado_por → usuario\|ver]] |
| [[comprobante_manual]] | `revisado_por` | [[usuario]] | 03 → 01 | sí | [[comprobante_manual.revisado_por → usuario\|ver]] |
| [[comprobante_manual]] | `segunda_revision_por` | [[usuario]] | 03 → 01 | sí | [[comprobante_manual.segunda_revision_por → usuario\|ver]] |
| [[conciliacion]] | `conciliado_por` | [[usuario]] | 03 → 01 | sí | [[conciliacion.conciliado_por → usuario\|ver]] |
| [[cuenta_contable]] | `grupo_id` | [[grupo]] | 03 → 02 | sí | [[cuenta_contable.grupo_id → grupo\|ver]] |
| [[cuenta_contable]] | `participante_id` | [[participante]] | 03 → 02 | sí | [[cuenta_contable.participante_id → participante\|ver]] |
| [[enlace_pago_rapido]] | `token_id` | [[token_verificacion]] | 03 → 01 | no | [[enlace_pago_rapido.token_id → token_verificacion\|ver]] |
| [[excepcion_conciliacion]] | `asignada_a` | [[usuario]] | 03 → 01 | sí | [[excepcion_conciliacion.asignada_a → usuario\|ver]] |
| [[extracto_bancario]] | `importado_por` | [[usuario]] | 03 → 01 | no | [[extracto_bancario.importado_por → usuario\|ver]] |
| [[obligacion_aporte]] | `cupo_id` | [[cupo]] | 03 → 02 | no | [[obligacion_aporte.cupo_id → cupo\|ver]] |
| [[obligacion_aporte]] | `grupo_id` | [[grupo]] | 03 → 02 | no | [[obligacion_aporte.grupo_id → grupo\|ver]] |
| [[obligacion_aporte]] | `participante_id` | [[participante]] | 03 → 02 | no | [[obligacion_aporte.participante_id → participante\|ver]] |
| [[obligacion_aporte]] | `periodo_id` | [[periodo]] | 03 → 02 | no | [[obligacion_aporte.periodo_id → periodo\|ver]] |
| [[pago]] | `registrado_por` | [[usuario]] | 03 → 01 | sí | [[pago.registrado_por → usuario\|ver]] |
| [[plan_regularizacion]] | `aprobado_por` | [[usuario]] | 03 → 01 | no | [[plan_regularizacion.aprobado_por → usuario\|ver]] |
| [[plan_regularizacion]] | `participante_id` | [[participante]] | 03 → 02 | no | [[plan_regularizacion.participante_id → participante\|ver]] |
| [[politica_mora]] | `grupo_id` | [[grupo]] | 03 → 02 | sí | [[politica_mora.grupo_id → grupo\|ver]] |
| [[reembolso]] | `aprobado_por` | [[usuario]] | 03 → 01 | sí | [[reembolso.aprobado_por → usuario\|ver]] |
| [[reembolso]] | `solicitado_por` | [[usuario]] | 03 → 01 | no | [[reembolso.solicitado_por → usuario\|ver]] |
| [[confirmacion_recepcion]] | `token_confirmacion_id` | [[token_verificacion]] | 04 → 01 | sí | [[confirmacion_recepcion.token_confirmacion_id → token_verificacion\|ver]] |
| [[cuenta_bancaria_beneficiario]] | `usuario_id` | [[usuario]] | 04 → 01 | no | [[cuenta_bancaria_beneficiario.usuario_id → usuario\|ver]] |
| [[entrega_fondo]] | `autorizada_por` | [[usuario]] | 04 → 01 | sí | [[entrega_fondo.autorizada_por → usuario\|ver]] |
| [[entrega_fondo]] | `beneficiario_participante_id` | [[participante]] | 04 → 02 | no | [[entrega_fondo.beneficiario_participante_id → participante\|ver]] |
| [[entrega_fondo]] | `cupo_id` | [[cupo]] | 04 → 02 | no | [[entrega_fondo.cupo_id → cupo\|ver]] |
| [[entrega_fondo]] | `ejecutada_por` | [[usuario]] | 04 → 01 | sí | [[entrega_fondo.ejecutada_por → usuario\|ver]] |
| [[entrega_fondo]] | `grupo_id` | [[grupo]] | 04 → 02 | no | [[entrega_fondo.grupo_id → grupo\|ver]] |
| [[entrega_fondo]] | `periodo_id` | [[periodo]] | 04 → 02 | no | [[entrega_fondo.periodo_id → periodo\|ver]] |
| [[entrega_fondo]] | `turno_id` | [[turno]] | 04 → 02 | no | [[entrega_fondo.turno_id → turno\|ver]] |
| [[historial_estado_entrega]] | `ejecutado_por` | [[usuario]] | 04 → 01 | sí | [[historial_estado_entrega.ejecutado_por → usuario\|ver]] |
| [[incidencia_entrega]] | `asignada_a` | [[usuario]] | 04 → 01 | sí | [[incidencia_entrega.asignada_a → usuario\|ver]] |
| [[incidencia_entrega]] | `reportada_por` | [[usuario]] | 04 → 01 | no | [[incidencia_entrega.reportada_por → usuario\|ver]] |
| [[orden_desembolso]] | `proveedor_id` | [[proveedor_pago]] | 04 → 03 | no | [[orden_desembolso.proveedor_id → proveedor_pago\|ver]] |
| [[validacion_pre_entrega]] | `omitida_por` | [[usuario]] | 04 → 01 | sí | [[validacion_pre_entrega.omitida_por → usuario\|ver]] |
| [[bandeja_entrada]] | `usuario_id` | [[usuario]] | 05 → 01 | no | [[bandeja_entrada.usuario_id → usuario\|ver]] |
| [[canal_vinculado]] | `usuario_id` | [[usuario]] | 05 → 01 | no | [[canal_vinculado.usuario_id → usuario\|ver]] |
| [[enlace_pago_notificado]] | `orden_cobro_id` | [[orden_cobro]] | 05 → 03 | no | [[enlace_pago_notificado.orden_cobro_id → orden_cobro\|ver]] |
| [[enlace_pago_notificado]] | `token_id` | [[token_verificacion]] | 05 → 01 | no | [[enlace_pago_notificado.token_id → token_verificacion\|ver]] |
| [[notificacion]] | `usuario_id` | [[usuario]] | 05 → 01 | no | [[notificacion.usuario_id → usuario\|ver]] |
| [[programacion_recordatorio]] | `grupo_id` | [[grupo]] | 05 → 02 | sí | [[programacion_recordatorio.grupo_id → grupo\|ver]] |
| [[bloque_transparencia]] | `grupo_id` | [[grupo]] | 06 → 02 | no | [[bloque_transparencia.grupo_id → grupo\|ver]] |
| [[certificado_reputacion]] | `usuario_id` | [[usuario]] | 06 → 01 | no | [[certificado_reputacion.usuario_id → usuario\|ver]] |
| [[evento_reputacion]] | `grupo_id` | [[grupo]] | 06 → 02 | sí | [[evento_reputacion.grupo_id → grupo\|ver]] |
| [[evento_reputacion]] | `participante_id` | [[participante]] | 06 → 02 | sí | [[evento_reputacion.participante_id → participante\|ver]] |
| [[evento_reputacion]] | `usuario_id` | [[usuario]] | 06 → 01 | no | [[evento_reputacion.usuario_id → usuario\|ver]] |
| [[insignia_otorgada]] | `usuario_id` | [[usuario]] | 06 → 01 | no | [[insignia_otorgada.usuario_id → usuario\|ver]] |
| [[metrica_grupo]] | `grupo_id` | [[grupo]] | 06 → 02 | no | [[metrica_grupo.grupo_id → grupo\|ver]] |
| [[metrica_grupo]] | `periodo_id` | [[periodo]] | 06 → 02 | sí | [[metrica_grupo.periodo_id → periodo\|ver]] |
| [[puntaje_reputacion]] | `usuario_id` | [[usuario]] | 06 → 01 | no | [[puntaje_reputacion.usuario_id → usuario\|ver]] |
| [[resena_participante]] | `autor_participante_id` | [[participante]] | 06 → 02 | no | [[resena_participante.autor_participante_id → participante\|ver]] |
| [[resena_participante]] | `evaluado_usuario_id` | [[usuario]] | 06 → 01 | no | [[resena_participante.evaluado_usuario_id → usuario\|ver]] |
| [[resena_participante]] | `grupo_id` | [[grupo]] | 06 → 02 | no | [[resena_participante.grupo_id → grupo\|ver]] |
| [[resena_participante]] | `moderada_por` | [[usuario]] | 06 → 01 | sí | [[resena_participante.moderada_por → usuario\|ver]] |
| [[snapshot_reputacion]] | `usuario_id` | [[usuario]] | 06 → 01 | no | [[snapshot_reputacion.usuario_id → usuario\|ver]] |
| [[apelacion_sancion_org]] | `resuelta_por` | [[usuario]] | 07 → 01 | sí | [[apelacion_sancion_org.resuelta_por → usuario\|ver]] |
| [[contrato_organizador]] | `token_firma_id` | [[token_verificacion]] | 07 → 01 | sí | [[contrato_organizador.token_firma_id → token_verificacion\|ver]] |
| [[organizador]] | `usuario_id` | [[usuario]] | 07 → 01 | no | [[organizador.usuario_id → usuario\|ver]] |
| [[sancion_organizador]] | `aplicada_por` | [[usuario]] | 07 → 01 | no | [[sancion_organizador.aplicada_por → usuario\|ver]] |
| [[solicitud_organizador]] | `kyc_reforzado_id` | [[verificacion_kyc]] | 07 → 01 | sí | [[solicitud_organizador.kyc_reforzado_id → verificacion_kyc\|ver]] |
| [[solicitud_organizador]] | `revisada_por` | [[usuario]] | 07 → 01 | sí | [[solicitud_organizador.revisada_por → usuario\|ver]] |
| [[solicitud_organizador]] | `usuario_id` | [[usuario]] | 07 → 01 | no | [[solicitud_organizador.usuario_id → usuario\|ver]] |
| [[tarea_automatizada]] | `grupo_id` | [[grupo]] | 07 → 02 | no | [[tarea_automatizada.grupo_id → grupo\|ver]] |
| [[abono_recuperacion]] | `entrega_id` | [[entrega_fondo]] | 08 → 04 | sí | [[abono_recuperacion.entrega_id → entrega_fondo\|ver]] |
| [[abono_recuperacion]] | `pago_id` | [[pago]] | 08 → 03 | sí | [[abono_recuperacion.pago_id → pago\|ver]] |
| [[abono_recuperacion]] | `registrado_por` | [[usuario]] | 08 → 01 | sí | [[abono_recuperacion.registrado_por → usuario\|ver]] |
| [[accion_cobranza]] | `ejecutada_por` | [[usuario]] | 08 → 01 | sí | [[accion_cobranza.ejecutada_por → usuario\|ver]] |
| [[accion_cobranza]] | `notificacion_id` | [[notificacion]] | 08 → 05 | sí | [[accion_cobranza.notificacion_id → notificacion\|ver]] |
| [[acuerdo_quita]] | `acuerdo_grupo_id` | [[acuerdo]] | 08 → 02 | sí | [[acuerdo_quita.acuerdo_grupo_id → acuerdo\|ver]] |
| [[acuerdo_quita]] | `aprobado_por` | [[usuario]] | 08 → 01 | no | [[acuerdo_quita.aprobado_por → usuario\|ver]] |
| [[alerta_temprana]] | `grupo_id` | [[grupo]] | 08 → 02 | sí | [[alerta_temprana.grupo_id → grupo\|ver]] |
| [[alerta_temprana]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[alerta_temprana.usuario_id → usuario\|ver]] |
| [[apelacion_sancion]] | `apelante_id` | [[usuario]] | 08 → 01 | no | [[apelacion_sancion.apelante_id → usuario\|ver]] |
| [[apelacion_sancion]] | `resuelta_por` | [[usuario]] | 08 → 01 | sí | [[apelacion_sancion.resuelta_por → usuario\|ver]] |
| [[aval_participante]] | `avalista_usuario_id` | [[usuario]] | 08 → 01 | no | [[aval_participante.avalista_usuario_id → usuario\|ver]] |
| [[aval_participante]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[aval_participante.grupo_id → grupo\|ver]] |
| [[aval_participante]] | `participante_avalado_id` | [[participante]] | 08 → 02 | no | [[aval_participante.participante_avalado_id → participante\|ver]] |
| [[aval_participante]] | `token_aceptacion_id` | [[token_verificacion]] | 08 → 01 | sí | [[aval_participante.token_aceptacion_id → token_verificacion\|ver]] |
| [[candidato_reemplazo]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[candidato_reemplazo.usuario_id → usuario\|ver]] |
| [[castigo_deuda]] | `aprobado_por` | [[usuario]] | 08 → 01 | no | [[castigo_deuda.aprobado_por → usuario\|ver]] |
| [[castigo_deuda]] | `asiento_contable_id` | [[asiento_contable]] | 08 → 03 | sí | [[castigo_deuda.asiento_contable_id → asiento_contable\|ver]] |
| [[cobertura_incumplimiento]] | `aprobada_por` | [[usuario]] | 08 → 01 | sí | [[cobertura_incumplimiento.aprobada_por → usuario\|ver]] |
| [[cobertura_incumplimiento]] | `asiento_contable_id` | [[asiento_contable]] | 08 → 03 | sí | [[cobertura_incumplimiento.asiento_contable_id → asiento_contable\|ver]] |
| [[cobertura_incumplimiento]] | `obligacion_id` | [[obligacion_aporte]] | 08 → 03 | no | [[cobertura_incumplimiento.obligacion_id → obligacion_aporte\|ver]] |
| [[cobertura_incumplimiento]] | `periodo_id` | [[periodo]] | 08 → 02 | no | [[cobertura_incumplimiento.periodo_id → periodo\|ver]] |
| [[descargo_participante]] | `participante_id` | [[participante]] | 08 → 02 | no | [[descargo_participante.participante_id → participante\|ver]] |
| [[descargo_participante]] | `resuelto_por` | [[usuario]] | 08 → 01 | sí | [[descargo_participante.resuelto_por → usuario\|ver]] |
| [[deuda_participante]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[deuda_participante.grupo_id → grupo\|ver]] |
| [[deuda_participante]] | `participante_id` | [[participante]] | 08 → 02 | no | [[deuda_participante.participante_id → participante\|ver]] |
| [[deuda_participante]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[deuda_participante.usuario_id → usuario\|ver]] |
| [[devolucion_fondo]] | `participante_id` | [[participante]] | 08 → 02 | no | [[devolucion_fondo.participante_id → participante\|ver]] |
| [[disolucion_anticipada]] | `acuerdo_grupo_id` | [[acuerdo]] | 08 → 02 | sí | [[disolucion_anticipada.acuerdo_grupo_id → acuerdo\|ver]] |
| [[disolucion_anticipada]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[disolucion_anticipada.grupo_id → grupo\|ver]] |
| [[ejecucion_aval]] | `pago_id` | [[pago]] | 08 → 03 | sí | [[ejecucion_aval.pago_id → pago\|ver]] |
| [[evidencia_incumplimiento]] | `aportada_por` | [[usuario]] | 08 → 01 | sí | [[evidencia_incumplimiento.aportada_por → usuario\|ver]] |
| [[fondo_garantia]] | `cuenta_contable_id` | [[cuenta_contable]] | 08 → 03 | no | [[fondo_garantia.cuenta_contable_id → cuenta_contable\|ver]] |
| [[fondo_garantia]] | `grupo_id` | [[grupo]] | 08 → 02 | sí | [[fondo_garantia.grupo_id → grupo\|ver]] |
| [[gestion_cobranza]] | `gestor_asignado_id` | [[usuario]] | 08 → 01 | sí | [[gestion_cobranza.gestor_asignado_id → usuario\|ver]] |
| [[historial_estado_incumplimiento]] | `ejecutado_por` | [[usuario]] | 08 → 01 | sí | [[historial_estado_incumplimiento.ejecutado_por → usuario\|ver]] |
| [[historial_incumplimiento_usuario]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[historial_incumplimiento_usuario.usuario_id → usuario\|ver]] |
| [[liquidacion_participante]] | `participante_id` | [[participante]] | 08 → 02 | no | [[liquidacion_participante.participante_id → participante\|ver]] |
| [[lista_restriccion_interna]] | `retirado_por` | [[usuario]] | 08 → 01 | sí | [[lista_restriccion_interna.retirado_por → usuario\|ver]] |
| [[lista_restriccion_interna]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[lista_restriccion_interna.usuario_id → usuario\|ver]] |
| [[movimiento_fondo]] | `asiento_contable_id` | [[asiento_contable]] | 08 → 03 | sí | [[movimiento_fondo.asiento_contable_id → asiento_contable\|ver]] |
| [[movimiento_fondo]] | `registrado_por` | [[usuario]] | 08 → 01 | sí | [[movimiento_fondo.registrado_por → usuario\|ver]] |
| [[plan_contingencia]] | `acuerdo_grupo_id` | [[acuerdo]] | 08 → 02 | sí | [[plan_contingencia.acuerdo_grupo_id → acuerdo\|ver]] |
| [[plan_contingencia]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[plan_contingencia.grupo_id → grupo\|ver]] |
| [[politica_cobertura]] | `grupo_id` | [[grupo]] | 08 → 02 | sí | [[politica_cobertura.grupo_id → grupo\|ver]] |
| [[politica_sancion]] | `grupo_id` | [[grupo]] | 08 → 02 | sí | [[politica_sancion.grupo_id → grupo\|ver]] |
| [[promesa_pago]] | `registrada_por` | [[usuario]] | 08 → 01 | sí | [[promesa_pago.registrada_por → usuario\|ver]] |
| [[reemplazo_participante]] | `acuerdo_grupo_id` | [[acuerdo]] | 08 → 02 | sí | [[reemplazo_participante.acuerdo_grupo_id → acuerdo\|ver]] |
| [[reemplazo_participante]] | `cupo_id` | [[cupo]] | 08 → 02 | no | [[reemplazo_participante.cupo_id → cupo\|ver]] |
| [[reemplazo_participante]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[reemplazo_participante.grupo_id → grupo\|ver]] |
| [[reemplazo_participante]] | `participante_entrante_id` | [[participante]] | 08 → 02 | sí | [[reemplazo_participante.participante_entrante_id → participante\|ver]] |
| [[reemplazo_participante]] | `participante_saliente_id` | [[participante]] | 08 → 02 | no | [[reemplazo_participante.participante_saliente_id → participante\|ver]] |
| [[registro_incumplimiento]] | `cupo_id` | [[cupo]] | 08 → 02 | sí | [[registro_incumplimiento.cupo_id → cupo\|ver]] |
| [[registro_incumplimiento]] | `entrega_afectada_id` | [[entrega_fondo]] | 08 → 04 | sí | [[registro_incumplimiento.entrega_afectada_id → entrega_fondo\|ver]] |
| [[registro_incumplimiento]] | `grupo_id` | [[grupo]] | 08 → 02 | no | [[registro_incumplimiento.grupo_id → grupo\|ver]] |
| [[registro_incumplimiento]] | `obligacion_id` | [[obligacion_aporte]] | 08 → 03 | sí | [[registro_incumplimiento.obligacion_id → obligacion_aporte\|ver]] |
| [[registro_incumplimiento]] | `participante_id` | [[participante]] | 08 → 02 | no | [[registro_incumplimiento.participante_id → participante\|ver]] |
| [[registro_incumplimiento]] | `periodo_id` | [[periodo]] | 08 → 02 | sí | [[registro_incumplimiento.periodo_id → periodo\|ver]] |
| [[registro_incumplimiento]] | `reportado_por` | [[usuario]] | 08 → 01 | sí | [[registro_incumplimiento.reportado_por → usuario\|ver]] |
| [[registro_incumplimiento]] | `responsable_gestion` | [[usuario]] | 08 → 01 | sí | [[registro_incumplimiento.responsable_gestion → usuario\|ver]] |
| [[registro_incumplimiento]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[registro_incumplimiento.usuario_id → usuario\|ver]] |
| [[sancion]] | `acuerdo_grupo_id` | [[acuerdo]] | 08 → 02 | sí | [[sancion.acuerdo_grupo_id → acuerdo\|ver]] |
| [[sancion]] | `aplicada_por` | [[usuario]] | 08 → 01 | sí | [[sancion.aplicada_por → usuario\|ver]] |
| [[sancion]] | `participante_id` | [[participante]] | 08 → 02 | sí | [[sancion.participante_id → participante\|ver]] |
| [[sancion]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[sancion.usuario_id → usuario\|ver]] |
| [[score_riesgo_incumplimiento]] | `grupo_id` | [[grupo]] | 08 → 02 | sí | [[score_riesgo_incumplimiento.grupo_id → grupo\|ver]] |
| [[score_riesgo_incumplimiento]] | `usuario_id` | [[usuario]] | 08 → 01 | no | [[score_riesgo_incumplimiento.usuario_id → usuario\|ver]] |
| [[alerta_cumplimiento]] | `analista_id` | [[usuario]] | 09 → 01 | sí | [[alerta_cumplimiento.analista_id → usuario\|ver]] |
| [[alerta_cumplimiento]] | `grupo_id` | [[grupo]] | 09 → 02 | sí | [[alerta_cumplimiento.grupo_id → grupo\|ver]] |
| [[alerta_cumplimiento]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[alerta_cumplimiento.usuario_id → usuario\|ver]] |
| [[bitacora_evento]] | `actor_usuario_id` | [[usuario]] | 09 → 01 | sí | [[bitacora_evento.actor_usuario_id → usuario\|ver]] |
| [[bitacora_evento]] | `grupo_id` | [[grupo]] | 09 → 02 | sí | [[bitacora_evento.grupo_id → grupo\|ver]] |
| [[bitacora_evento]] | `suplantando_a_usuario_id` | [[usuario]] | 09 → 01 | sí | [[bitacora_evento.suplantando_a_usuario_id → usuario\|ver]] |
| [[coincidencia_lista]] | `revisada_por` | [[usuario]] | 09 → 01 | sí | [[coincidencia_lista.revisada_por → usuario\|ver]] |
| [[coincidencia_lista]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[coincidencia_lista.usuario_id → usuario\|ver]] |
| [[ejecucion_reporte]] | `grupo_id` | [[grupo]] | 09 → 02 | sí | [[ejecucion_reporte.grupo_id → grupo\|ver]] |
| [[ejecucion_reporte]] | `solicitado_por` | [[usuario]] | 09 → 01 | no | [[ejecucion_reporte.solicitado_por → usuario\|ver]] |
| [[proceso_anonimizacion]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[proceso_anonimizacion.usuario_id → usuario\|ver]] |
| [[registro_acceso_datos]] | `usuario_afectado_id` | [[usuario]] | 09 → 01 | no | [[registro_acceso_datos.usuario_afectado_id → usuario\|ver]] |
| [[registro_acceso_datos]] | `usuario_consultor_id` | [[usuario]] | 09 → 01 | no | [[registro_acceso_datos.usuario_consultor_id → usuario\|ver]] |
| [[reporte_operacion_sospechosa]] | `aprobado_por` | [[usuario]] | 09 → 01 | sí | [[reporte_operacion_sospechosa.aprobado_por → usuario\|ver]] |
| [[reporte_operacion_sospechosa]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[reporte_operacion_sospechosa.usuario_id → usuario\|ver]] |
| [[solicitud_datos_personales]] | `atendida_por` | [[usuario]] | 09 → 01 | sí | [[solicitud_datos_personales.atendida_por → usuario\|ver]] |
| [[solicitud_datos_personales]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[solicitud_datos_personales.usuario_id → usuario\|ver]] |
| [[ticket_soporte]] | `asignado_a` | [[usuario]] | 09 → 01 | sí | [[ticket_soporte.asignado_a → usuario\|ver]] |
| [[ticket_soporte]] | `usuario_id` | [[usuario]] | 09 → 01 | no | [[ticket_soporte.usuario_id → usuario\|ver]] |

## 01 — Identidad, Usuarios y Seguridad

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[asignacion_rol.otorgada_por → usuario]] | [[usuario]] | — | no |
| [[asignacion_rol.rol_id → rol]] | [[rol]] | — | no |
| [[asignacion_rol.usuario_id → usuario]] | [[usuario]] | — | no |
| [[bloqueo_cuenta.liberada_por → usuario]] | [[usuario]] | — | sí |
| [[bloqueo_cuenta.usuario_id → usuario]] | [[usuario]] | — | no |
| [[consentimiento.usuario_id → usuario]] | [[usuario]] | — | no |
| [[credencial_acceso.usuario_id → usuario]] | [[usuario]] | — | no |
| [[direccion_usuario.usuario_id → usuario]] | [[usuario]] | — | no |
| [[dispositivo.usuario_id → usuario]] | [[usuario]] | — | no |
| [[documento_identidad.usuario_id → usuario]] | [[usuario]] | — | no |
| [[factor_mfa.usuario_id → usuario]] | [[usuario]] | — | no |
| [[historial_credencial.usuario_id → usuario]] | [[usuario]] | — | no |
| [[intento_autenticacion.usuario_id → usuario]] | [[usuario]] | — | sí |
| [[intento_validacion_token.token_id → token_verificacion]] | [[token_verificacion]] | — | no |
| [[perfil_financiero.usuario_id → usuario]] | [[usuario]] | — | no |
| [[preferencia_notificacion.usuario_id → usuario]] | [[usuario]] | — | no |
| [[referencia_personal.usuario_id → usuario]] | [[usuario]] | — | no |
| [[reputacion_usuario.usuario_id → usuario]] | [[usuario]] | — | no |
| [[restriccion_usuario.levantada_por → usuario]] | [[usuario]] | — | sí |
| [[restriccion_usuario.usuario_id → usuario]] | [[usuario]] | — | no |
| [[rol_permiso.permiso_id → permiso]] | [[permiso]] | — | no |
| [[rol_permiso.rol_id → rol]] | [[rol]] | — | no |
| [[sesion.dispositivo_id → dispositivo]] | [[dispositivo]] | — | no |
| [[sesion.usuario_id → usuario]] | [[usuario]] | — | no |
| [[solicitud_baja.usuario_id → usuario]] | [[usuario]] | — | no |
| [[token_verificacion.dispositivo_id → dispositivo]] | [[dispositivo]] | — | sí |
| [[token_verificacion.politica_id → politica_sancion]] | [[politica_sancion]] | ↗ | no |
| [[token_verificacion.rotado_de_id → token_verificacion]] | [[token_verificacion]] | — | sí |
| [[token_verificacion.usuario_id → usuario]] | [[usuario]] | — | sí |
| [[verificacion_kyc.documento_id → documento_identidad]] | [[documento_identidad]] | — | sí |
| [[verificacion_kyc.revisada_por → usuario]] | [[usuario]] | — | sí |
| [[verificacion_kyc.usuario_id → usuario]] | [[usuario]] | — | no |

## 02 — Grupos, Cupos, Turnos y Gobernanza

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[aceptacion_reglamento.participante_id → participante]] | [[participante]] | — | no |
| [[aceptacion_reglamento.reglamento_id → reglamento_grupo]] | [[reglamento_grupo]] | — | no |
| [[aceptacion_reglamento.token_firma_id → token_verificacion]] | [[token_verificacion]] | ↗ | sí |
| [[acuerdo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[acuerdo.propuesto_por → usuario]] | [[usuario]] | ↗ | no |
| [[configuracion_grupo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[configuracion_grupo.politica_mora_id → politica_mora]] | [[politica_mora]] | ↗ | sí |
| [[configuracion_grupo.politica_sancion_id → politica_sancion]] | [[politica_sancion]] | ↗ | sí |
| [[cupo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[cupo.participante_id → participante]] | [[participante]] | — | sí |
| [[dia_no_habil.grupo_id → grupo]] | [[grupo]] | — | sí |
| [[grupo.organizador_id → organizador]] | [[organizador]] | ↗ | sí |
| [[historial_estado_grupo.ejecutado_por → usuario]] | [[usuario]] | ↗ | no |
| [[historial_estado_grupo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[invitacion.emisor_id → usuario]] | [[usuario]] | ↗ | no |
| [[invitacion.grupo_id → grupo]] | [[grupo]] | — | no |
| [[invitacion.token_id → token_verificacion]] | [[token_verificacion]] | ↗ | no |
| [[participante.grupo_id → grupo]] | [[grupo]] | — | no |
| [[participante.invitado_por_id → participante]] | [[participante]] | — | sí |
| [[participante.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[periodo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[postulacion_emparejamiento.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[propuesta_grupo.criterio_id → criterio_emparejamiento]] | [[criterio_emparejamiento]] | — | no |
| [[propuesta_grupo.grupo_materializado_id → grupo]] | [[grupo]] | — | sí |
| [[propuesta_postulacion.postulacion_id → postulacion_emparejamiento]] | [[postulacion_emparejamiento]] | — | no |
| [[propuesta_postulacion.propuesta_id → propuesta_grupo]] | [[propuesta_grupo]] | — | no |
| [[reglamento_grupo.grupo_id → grupo]] | [[grupo]] | — | no |
| [[reglamento_grupo.redactado_por → usuario]] | [[usuario]] | ↗ | no |
| [[solicitud_ingreso.grupo_id → grupo]] | [[grupo]] | — | no |
| [[solicitud_ingreso.revisada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[solicitud_ingreso.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[solicitud_permuta.contraparte_id → participante]] | [[participante]] | — | no |
| [[solicitud_permuta.solicitante_id → participante]] | [[participante]] | — | no |
| [[solicitud_permuta.turno_destino_id → turno]] | [[turno]] | — | no |
| [[solicitud_permuta.turno_origen_id → turno]] | [[turno]] | — | no |
| [[solicitud_retiro.participante_id → participante]] | [[participante]] | — | no |
| [[sorteo_turnos.ejecutado_por → usuario]] | [[usuario]] | ↗ | no |
| [[sorteo_turnos.grupo_id → grupo]] | [[grupo]] | — | no |
| [[traspaso_cupo.aprobado_por_acuerdo_id → acuerdo]] | [[acuerdo]] | — | sí |
| [[traspaso_cupo.cupo_id → cupo]] | [[cupo]] | — | no |
| [[traspaso_cupo.participante_destino_id → participante]] | [[participante]] | — | no |
| [[traspaso_cupo.participante_origen_id → participante]] | [[participante]] | — | no |
| [[turno.cupo_id → cupo]] | [[cupo]] | — | no |
| [[turno.grupo_id → grupo]] | [[grupo]] | — | no |
| [[turno.periodo_id → periodo]] | [[periodo]] | — | no |
| [[turno.permutado_con_turno_id → turno]] | [[turno]] | — | sí |
| [[voto_participante.acuerdo_id → acuerdo]] | [[acuerdo]] | — | no |
| [[voto_participante.participante_id → participante]] | [[participante]] | — | no |

## 03 — Aportes, Pagos QR y Conciliación

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[asiento_contable.asiento_reversa_id → asiento_contable]] | [[asiento_contable]] | — | sí |
| [[asiento_contable.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[asiento_contable.registrado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[cierre_diario.cerrado_por → usuario]] | [[usuario]] | ↗ | no |
| [[comprobante_manual.pago_id → pago]] | [[pago]] | — | no |
| [[comprobante_manual.revisado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[comprobante_manual.segunda_revision_por → usuario]] | [[usuario]] | ↗ | sí |
| [[conciliacion.conciliado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[conciliacion.movimiento_bancario_id → movimiento_bancario]] | [[movimiento_bancario]] | — | sí |
| [[conciliacion.pago_id → pago]] | [[pago]] | — | no |
| [[constancia_pago.pago_id → pago]] | [[pago]] | — | no |
| [[cuenta_contable.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[cuenta_contable.participante_id → participante]] | [[participante]] | ↗ | sí |
| [[disputa_pago.pago_id → pago]] | [[pago]] | — | no |
| [[enlace_pago_rapido.orden_cobro_id → orden_cobro]] | [[orden_cobro]] | — | no |
| [[enlace_pago_rapido.token_id → token_verificacion]] | [[token_verificacion]] | ↗ | no |
| [[excepcion_conciliacion.asignada_a → usuario]] | [[usuario]] | ↗ | sí |
| [[excepcion_conciliacion.conciliacion_id → conciliacion]] | [[conciliacion]] | — | no |
| [[extracto_bancario.importado_por → usuario]] | [[usuario]] | ↗ | no |
| [[extracto_bancario.proveedor_id → proveedor_pago]] | [[proveedor_pago]] | — | no |
| [[intento_pago.orden_cobro_id → orden_cobro]] | [[orden_cobro]] | — | no |
| [[movimiento_bancario.extracto_id → extracto_bancario]] | [[extracto_bancario]] | — | no |
| [[movimiento_contable.asiento_id → asiento_contable]] | [[asiento_contable]] | — | no |
| [[movimiento_contable.cuenta_id → cuenta_contable]] | [[cuenta_contable]] | — | no |
| [[obligacion_aporte.cupo_id → cupo]] | [[cupo]] | ↗ | no |
| [[obligacion_aporte.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[obligacion_aporte.obligacion_origen_id → obligacion_aporte]] | [[obligacion_aporte]] | — | sí |
| [[obligacion_aporte.participante_id → participante]] | [[participante]] | ↗ | no |
| [[obligacion_aporte.periodo_id → periodo]] | [[periodo]] | ↗ | no |
| [[obligacion_aporte.plan_regularizacion_id → plan_regularizacion]] | [[plan_regularizacion]] | — | sí |
| [[obligacion_aporte.politica_mora_id → politica_mora]] | [[politica_mora]] | — | sí |
| [[orden_cobro.obligacion_id → obligacion_aporte]] | [[obligacion_aporte]] | — | no |
| [[orden_cobro.proveedor_id → proveedor_pago]] | [[proveedor_pago]] | — | no |
| [[pago.intento_pago_id → intento_pago]] | [[intento_pago]] | — | sí |
| [[pago.obligacion_id → obligacion_aporte]] | [[obligacion_aporte]] | — | no |
| [[pago.registrado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[plan_regularizacion.aprobado_por → usuario]] | [[usuario]] | ↗ | no |
| [[plan_regularizacion.participante_id → participante]] | [[participante]] | ↗ | no |
| [[politica_mora.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[qr_cobro.orden_cobro_id → orden_cobro]] | [[orden_cobro]] | — | no |
| [[reembolso.aprobado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[reembolso.pago_id → pago]] | [[pago]] | — | no |
| [[reembolso.solicitado_por → usuario]] | [[usuario]] | ↗ | no |
| [[webhook_pasarela.pago_id → pago]] | [[pago]] | — | sí |
| [[webhook_pasarela.proveedor_id → proveedor_pago]] | [[proveedor_pago]] | — | no |

## 04 — Entregas de Fondo

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[confirmacion_recepcion.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[confirmacion_recepcion.token_confirmacion_id → token_verificacion]] | [[token_verificacion]] | ↗ | sí |
| [[cuenta_bancaria_beneficiario.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[deduccion_entrega.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[entrega_fondo.autorizada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[entrega_fondo.beneficiario_participante_id → participante]] | [[participante]] | ↗ | no |
| [[entrega_fondo.cuenta_destino_id → cuenta_bancaria_beneficiario]] | [[cuenta_bancaria_beneficiario]] | — | sí |
| [[entrega_fondo.cupo_id → cupo]] | [[cupo]] | ↗ | no |
| [[entrega_fondo.ejecutada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[entrega_fondo.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[entrega_fondo.periodo_id → periodo]] | [[periodo]] | ↗ | no |
| [[entrega_fondo.turno_id → turno]] | [[turno]] | ↗ | no |
| [[historial_estado_entrega.ejecutado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[historial_estado_entrega.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[incidencia_entrega.asignada_a → usuario]] | [[usuario]] | ↗ | sí |
| [[incidencia_entrega.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[incidencia_entrega.reportada_por → usuario]] | [[usuario]] | ↗ | no |
| [[intento_desembolso.orden_desembolso_id → orden_desembolso]] | [[orden_desembolso]] | — | no |
| [[orden_desembolso.cuenta_destino_id → cuenta_bancaria_beneficiario]] | [[cuenta_bancaria_beneficiario]] | — | no |
| [[orden_desembolso.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[orden_desembolso.proveedor_id → proveedor_pago]] | [[proveedor_pago]] | ↗ | no |
| [[validacion_pre_entrega.entrega_id → entrega_fondo]] | [[entrega_fondo]] | — | no |
| [[validacion_pre_entrega.omitida_por → usuario]] | [[usuario]] | ↗ | sí |
| [[validacion_pre_entrega.regla_id → regla_entrega]] | [[regla_entrega]] | — | no |

## 05 — Notificaciones y Comunicaciones

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[bandeja_entrada.notificacion_id → notificacion]] | [[notificacion]] | — | no |
| [[bandeja_entrada.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[canal_vinculado.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[cola_envio.envio_id → envio_notificacion]] | [[envio_notificacion]] | — | no |
| [[cola_muerta.envio_id → envio_notificacion]] | [[envio_notificacion]] | — | no |
| [[enlace_pago_notificado.notificacion_id → notificacion]] | [[notificacion]] | — | no |
| [[enlace_pago_notificado.orden_cobro_id → orden_cobro]] | [[orden_cobro]] | ↗ | no |
| [[enlace_pago_notificado.token_id → token_verificacion]] | [[token_verificacion]] | ↗ | no |
| [[envio_notificacion.canal_vinculado_id → canal_vinculado]] | [[canal_vinculado]] | — | sí |
| [[envio_notificacion.notificacion_id → notificacion]] | [[notificacion]] | — | no |
| [[envio_notificacion.proveedor_id → proveedor_mensajeria]] | [[proveedor_mensajeria]] | — | no |
| [[envio_notificacion.version_plantilla_id → version_plantilla]] | [[version_plantilla]] | — | no |
| [[evento_entrega_mensaje.envio_id → envio_notificacion]] | [[envio_notificacion]] | — | no |
| [[notificacion.evento_id → evento_notificable]] | [[evento_notificable]] | — | no |
| [[notificacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[plantilla_mensaje.evento_id → evento_notificable]] | [[evento_notificable]] | — | no |
| [[programacion_recordatorio.evento_id → evento_notificable]] | [[evento_notificable]] | — | no |
| [[programacion_recordatorio.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[respuesta_entrante.canal_vinculado_id → canal_vinculado]] | [[canal_vinculado]] | — | no |
| [[respuesta_entrante.notificacion_relacionada_id → notificacion]] | [[notificacion]] | — | sí |
| [[version_plantilla.plantilla_id → plantilla_mensaje]] | [[plantilla_mensaje]] | — | no |

## 06 — Transparencia y Reputación

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[bloque_transparencia.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[certificado_reputacion.snapshot_id → snapshot_reputacion]] | [[snapshot_reputacion]] | — | no |
| [[certificado_reputacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[componente_score.puntaje_id → puntaje_reputacion]] | [[puntaje_reputacion]] | — | no |
| [[evento_reputacion.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[evento_reputacion.participante_id → participante]] | [[participante]] | ↗ | sí |
| [[evento_reputacion.revertido_por_id → evento_reputacion]] | [[evento_reputacion]] | — | sí |
| [[evento_reputacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[insignia_otorgada.insignia_id → insignia_logro]] | [[insignia_logro]] | — | no |
| [[insignia_otorgada.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[metrica_grupo.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[metrica_grupo.periodo_id → periodo]] | [[periodo]] | ↗ | sí |
| [[peso_factor.modelo_id → modelo_scoring]] | [[modelo_scoring]] | — | no |
| [[puntaje_reputacion.modelo_id → modelo_scoring]] | [[modelo_scoring]] | — | no |
| [[puntaje_reputacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[registro_sellado.bloque_id → bloque_transparencia]] | [[bloque_transparencia]] | — | no |
| [[regla_impacto_evento.modelo_id → modelo_scoring]] | [[modelo_scoring]] | — | no |
| [[resena_participante.autor_participante_id → participante]] | [[participante]] | ↗ | no |
| [[resena_participante.evaluado_usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[resena_participante.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[resena_participante.moderada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[snapshot_reputacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |

## 07 — Organizador y Automatización

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[apelacion_sancion_org.resuelta_por → usuario]] | [[usuario]] | ↗ | sí |
| [[apelacion_sancion_org.sancion_organizador_id → sancion_organizador]] | [[sancion_organizador]] | — | no |
| [[capacitacion_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[contrato_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[contrato_organizador.token_firma_id → token_verificacion]] | [[token_verificacion]] | ↗ | sí |
| [[ejecucion_tarea.tarea_id → tarea_automatizada]] | [[tarea_automatizada]] | — | no |
| [[evaluacion_desempeno.organizador_id → organizador]] | [[organizador]] | — | no |
| [[metrica_organizador.evaluacion_id → evaluacion_desempeno]] | [[evaluacion_desempeno]] | — | no |
| [[organizador.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[sancion_organizador.aplicada_por → usuario]] | [[usuario]] | ↗ | no |
| [[sancion_organizador.evaluacion_id → evaluacion_desempeno]] | [[evaluacion_desempeno]] | — | sí |
| [[sancion_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[solicitud_organizador.kyc_reforzado_id → verificacion_kyc]] | [[verificacion_kyc]] | ↗ | sí |
| [[solicitud_organizador.revisada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[solicitud_organizador.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[tarea_automatizada.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[tarea_automatizada.regla_id → regla_automatizacion]] | [[regla_automatizacion]] | — | no |

## 08 — Garantía, Incumplimiento, Cobranza y Sanciones

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[abono_recuperacion.deuda_id → deuda_participante]] | [[deuda_participante]] | — | no |
| [[abono_recuperacion.entrega_id → entrega_fondo]] | [[entrega_fondo]] | ↗ | sí |
| [[abono_recuperacion.movimiento_fondo_id → movimiento_fondo]] | [[movimiento_fondo]] | — | sí |
| [[abono_recuperacion.pago_id → pago]] | [[pago]] | ↗ | sí |
| [[abono_recuperacion.registrado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[accion_cobranza.ejecutada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[accion_cobranza.gestion_id → gestion_cobranza]] | [[gestion_cobranza]] | — | no |
| [[accion_cobranza.notificacion_id → notificacion]] | [[notificacion]] | ↗ | sí |
| [[acuerdo_quita.acuerdo_grupo_id → acuerdo]] | [[acuerdo]] | ↗ | sí |
| [[acuerdo_quita.aprobado_por → usuario]] | [[usuario]] | ↗ | no |
| [[acuerdo_quita.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[alerta_temprana.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[alerta_temprana.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[apelacion_sancion.apelante_id → usuario]] | [[usuario]] | ↗ | no |
| [[apelacion_sancion.resuelta_por → usuario]] | [[usuario]] | ↗ | sí |
| [[apelacion_sancion.sancion_id → sancion]] | [[sancion]] | — | no |
| [[aval_participante.avalista_usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[aval_participante.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[aval_participante.participante_avalado_id → participante]] | [[participante]] | ↗ | no |
| [[aval_participante.token_aceptacion_id → token_verificacion]] | [[token_verificacion]] | ↗ | sí |
| [[candidato_reemplazo.reemplazo_id → reemplazo_participante]] | [[reemplazo_participante]] | — | no |
| [[candidato_reemplazo.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[castigo_deuda.aprobado_por → usuario]] | [[usuario]] | ↗ | no |
| [[castigo_deuda.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ | sí |
| [[castigo_deuda.deuda_id → deuda_participante]] | [[deuda_participante]] | — | no |
| [[cobertura_incumplimiento.aprobada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[cobertura_incumplimiento.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ | sí |
| [[cobertura_incumplimiento.fondo_id → fondo_garantia]] | [[fondo_garantia]] | — | no |
| [[cobertura_incumplimiento.movimiento_fondo_id → movimiento_fondo]] | [[movimiento_fondo]] | — | sí |
| [[cobertura_incumplimiento.obligacion_id → obligacion_aporte]] | [[obligacion_aporte]] | ↗ | no |
| [[cobertura_incumplimiento.periodo_id → periodo]] | [[periodo]] | ↗ | no |
| [[cobertura_incumplimiento.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[descargo_participante.participante_id → participante]] | [[participante]] | ↗ | no |
| [[descargo_participante.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[descargo_participante.resuelto_por → usuario]] | [[usuario]] | ↗ | sí |
| [[deuda_participante.cobertura_id → cobertura_incumplimiento]] | [[cobertura_incumplimiento]] | — | sí |
| [[deuda_participante.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[deuda_participante.participante_id → participante]] | [[participante]] | ↗ | no |
| [[deuda_participante.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[deuda_participante.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[devolucion_fondo.fondo_id → fondo_garantia]] | [[fondo_garantia]] | — | no |
| [[devolucion_fondo.participante_id → participante]] | [[participante]] | ↗ | no |
| [[disolucion_anticipada.acuerdo_grupo_id → acuerdo]] | [[acuerdo]] | ↗ | sí |
| [[disolucion_anticipada.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[ejecucion_aval.aval_id → aval_participante]] | [[aval_participante]] | — | no |
| [[ejecucion_aval.deuda_id → deuda_participante]] | [[deuda_participante]] | — | no |
| [[ejecucion_aval.pago_id → pago]] | [[pago]] | ↗ | sí |
| [[ejecucion_aval.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[evidencia_incumplimiento.aportada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[evidencia_incumplimiento.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[fondo_garantia.cuenta_contable_id → cuenta_contable]] | [[cuenta_contable]] | ↗ | no |
| [[fondo_garantia.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[fondo_garantia.politica_cobertura_id → politica_cobertura]] | [[politica_cobertura]] | — | no |
| [[gestion_cobranza.estrategia_id → estrategia_cobranza]] | [[estrategia_cobranza]] | — | no |
| [[gestion_cobranza.gestor_asignado_id → usuario]] | [[usuario]] | ↗ | sí |
| [[gestion_cobranza.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[historial_estado_incumplimiento.ejecutado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[historial_estado_incumplimiento.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[historial_incumplimiento_usuario.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[liquidacion_participante.disolucion_id → disolucion_anticipada]] | [[disolucion_anticipada]] | — | no |
| [[liquidacion_participante.participante_id → participante]] | [[participante]] | ↗ | no |
| [[lista_restriccion_interna.registro_origen_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | sí |
| [[lista_restriccion_interna.retirado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[lista_restriccion_interna.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[matriz_sancion.politica_id → politica_sancion]] | [[politica_sancion]] | — | no |
| [[movimiento_fondo.asiento_contable_id → asiento_contable]] | [[asiento_contable]] | ↗ | sí |
| [[movimiento_fondo.fondo_id → fondo_garantia]] | [[fondo_garantia]] | — | no |
| [[movimiento_fondo.registrado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[plan_contingencia.acuerdo_grupo_id → acuerdo]] | [[acuerdo]] | ↗ | sí |
| [[plan_contingencia.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[politica_cobertura.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[politica_sancion.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[promesa_pago.gestion_id → gestion_cobranza]] | [[gestion_cobranza]] | — | no |
| [[promesa_pago.registrada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[reemplazo_participante.acuerdo_grupo_id → acuerdo]] | [[acuerdo]] | ↗ | sí |
| [[reemplazo_participante.cupo_id → cupo]] | [[cupo]] | ↗ | no |
| [[reemplazo_participante.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[reemplazo_participante.participante_entrante_id → participante]] | [[participante]] | ↗ | sí |
| [[reemplazo_participante.participante_saliente_id → participante]] | [[participante]] | ↗ | no |
| [[reemplazo_participante.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | sí |
| [[registro_incumplimiento.cupo_id → cupo]] | [[cupo]] | ↗ | sí |
| [[registro_incumplimiento.entrega_afectada_id → entrega_fondo]] | [[entrega_fondo]] | ↗ | sí |
| [[registro_incumplimiento.grupo_id → grupo]] | [[grupo]] | ↗ | no |
| [[registro_incumplimiento.obligacion_id → obligacion_aporte]] | [[obligacion_aporte]] | ↗ | sí |
| [[registro_incumplimiento.participante_id → participante]] | [[participante]] | ↗ | no |
| [[registro_incumplimiento.periodo_id → periodo]] | [[periodo]] | ↗ | sí |
| [[registro_incumplimiento.reportado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[registro_incumplimiento.responsable_gestion → usuario]] | [[usuario]] | ↗ | sí |
| [[registro_incumplimiento.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[sancion.acuerdo_grupo_id → acuerdo]] | [[acuerdo]] | ↗ | sí |
| [[sancion.aplicada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[sancion.matriz_id → matriz_sancion]] | [[matriz_sancion]] | — | sí |
| [[sancion.participante_id → participante]] | [[participante]] | ↗ | sí |
| [[sancion.registro_id → registro_incumplimiento]] | [[registro_incumplimiento]] | — | no |
| [[sancion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[score_riesgo_incumplimiento.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[score_riesgo_incumplimiento.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[subrogacion.cobertura_id → cobertura_incumplimiento]] | [[cobertura_incumplimiento]] | — | no |
| [[subrogacion.deuda_id → deuda_participante]] | [[deuda_participante]] | — | no |

## 09 — Auditoría, Reportes y Cumplimiento

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[alerta_cumplimiento.analista_id → usuario]] | [[usuario]] | ↗ | sí |
| [[alerta_cumplimiento.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[alerta_cumplimiento.regla_id → regla_cumplimiento]] | [[regla_cumplimiento]] | — | no |
| [[alerta_cumplimiento.reporte_sospechoso_id → reporte_operacion_sospechosa]] | [[reporte_operacion_sospechosa]] | — | sí |
| [[alerta_cumplimiento.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[bitacora_evento.actor_usuario_id → usuario]] | [[usuario]] | ↗ | sí |
| [[bitacora_evento.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[bitacora_evento.suplantando_a_usuario_id → usuario]] | [[usuario]] | ↗ | sí |
| [[coincidencia_lista.lista_id → lista_restrictiva_externa]] | [[lista_restrictiva_externa]] | — | no |
| [[coincidencia_lista.revisada_por → usuario]] | [[usuario]] | ↗ | sí |
| [[coincidencia_lista.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[ejecucion_reporte.definicion_id → definicion_reporte]] | [[definicion_reporte]] | — | no |
| [[ejecucion_reporte.grupo_id → grupo]] | [[grupo]] | ↗ | sí |
| [[ejecucion_reporte.solicitado_por → usuario]] | [[usuario]] | ↗ | no |
| [[exportacion_reporte.ejecucion_id → ejecucion_reporte]] | [[ejecucion_reporte]] | — | no |
| [[proceso_anonimizacion.solicitud_id → solicitud_datos_personales]] | [[solicitud_datos_personales]] | — | sí |
| [[proceso_anonimizacion.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[programacion_reporte.definicion_id → definicion_reporte]] | [[definicion_reporte]] | — | no |
| [[registro_acceso_datos.usuario_afectado_id → usuario]] | [[usuario]] | ↗ | no |
| [[registro_acceso_datos.usuario_consultor_id → usuario]] | [[usuario]] | ↗ | no |
| [[reporte_operacion_sospechosa.aprobado_por → usuario]] | [[usuario]] | ↗ | sí |
| [[reporte_operacion_sospechosa.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[solicitud_datos_personales.atendida_por → usuario]] | [[usuario]] | ↗ | sí |
| [[solicitud_datos_personales.usuario_id → usuario]] | [[usuario]] | ↗ | no |
| [[ticket_soporte.asignado_a → usuario]] | [[usuario]] | ↗ | sí |
| [[ticket_soporte.usuario_id → usuario]] | [[usuario]] | ↗ | no |

