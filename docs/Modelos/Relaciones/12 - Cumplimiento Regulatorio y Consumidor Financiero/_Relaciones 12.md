---
tags:
  - moc
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
relaciones_fk: 102
---

# 12 — Cumplimiento Regulatorio y Consumidor Financiero · relaciones

Las **102 claves foráneas** que salen de las tablas de este módulo.

[[_Relaciones|← Todas las relaciones]] · [[Index]]

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[aceptacion_contrato.contrato_adhesion_id → contrato_adhesion]] | [[contrato_adhesion]] | — | no |
| [[aceptacion_contrato.dispositivo_id → dispositivo]] | [[dispositivo]] | ↗ 01 | sí |
| [[aceptacion_contrato.token_firma_id → token_verificacion]] | [[token_verificacion]] | ↗ 01 | sí |
| [[aceptacion_contrato.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[acta_comite.comite_gobierno_id → comite_gobierno]] | [[comite_gobierno]] | — | no |
| [[acta_comite.elaborada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[activo_informacion.contrato_tercero_id → contrato_tercero]] | [[contrato_tercero]] | — | sí |
| [[activo_informacion.custodio_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[activo_informacion.propietario_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[alerta_monitoreo_lft.asignada_a → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[alerta_monitoreo_lft.caso_id → caso_investigacion_lft]] | [[caso_investigacion_lft]] | — | sí |
| [[alerta_monitoreo_lft.cuenta_billetera_id → cuenta_billetera]] | [[cuenta_billetera]] | ↗ 10 | sí |
| [[alerta_monitoreo_lft.regla_monitoreo_id → regla_monitoreo_lft]] | [[regla_monitoreo_lft]] | — | no |
| [[alerta_monitoreo_lft.transaccion_id → transaccion_billetera]] | [[transaccion_billetera]] | ↗ 10 | sí |
| [[alerta_monitoreo_lft.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[beneficiario_final.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[calificacion_riesgo_cliente.calificado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[calificacion_riesgo_cliente.matriz_riesgo_id → matriz_riesgo_lft]] | [[matriz_riesgo_lft]] | — | sí |
| [[calificacion_riesgo_cliente.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[capacitacion_cumplimiento.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[caso_investigacion_lft.analista_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[caso_investigacion_lft.reporte_operacion_sospechosa_id → reporte_operacion_sospechosa]] | [[reporte_operacion_sospechosa]] | ↗ 09 | sí |
| [[caso_investigacion_lft.revisado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[caso_investigacion_lft.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[contrato_adhesion.aprobado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[contrato_tercero.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[control_interno.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[debida_diligencia.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[debida_diligencia.calificacion_riesgo_id → calificacion_riesgo_cliente]] | [[calificacion_riesgo_cliente]] | — | sí |
| [[debida_diligencia.segunda_revision_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[debida_diligencia.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[debida_diligencia.verificacion_kyc_id → verificacion_kyc]] | [[verificacion_kyc]] | ↗ 01 | sí |
| [[declaracion_origen_fondos.transaccion_id → transaccion_billetera]] | [[transaccion_billetera]] | ↗ 10 | sí |
| [[declaracion_origen_fondos.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[declaracion_origen_fondos.verificada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[declaracion_pep.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[declaracion_pep.verificada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[designacion_regulatoria.acta_comite_id → acta_comite]] | [[acta_comite]] | — | sí |
| [[designacion_regulatoria.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[desvio_perfil.alerta_monitoreo_id → alerta_monitoreo_lft]] | [[alerta_monitoreo_lft]] | — | sí |
| [[desvio_perfil.perfil_transaccional_id → perfil_transaccional]] | [[perfil_transaccional]] | — | no |
| [[desvio_perfil.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[documento_publicado.publicado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[entorno_prueba_regulado.licencia_regulatoria_id → licencia_regulatoria]] | [[licencia_regulatoria]] | — | no |
| [[envio_regulatorio.enviado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[envio_regulatorio.reporte_regulatorio_id → reporte_regulatorio]] | [[reporte_regulatorio]] | — | no |
| [[evaluacion_riesgo_producto.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[evaluacion_tercero.contrato_tercero_id → contrato_tercero]] | [[contrato_tercero]] | — | no |
| [[evaluacion_tercero.evaluado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[evento_riesgo_operativo.incidente_operativo_id → incidente_operativo]] | [[incidente_operativo]] | ↗ 09 | sí |
| [[evento_riesgo_operativo.registrado_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[expediente_cliente.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[expediente_cliente.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[factor_riesgo_evaluado.matriz_riesgo_id → matriz_riesgo_lft]] | [[matriz_riesgo_lft]] | — | no |
| [[factor_riesgo_evaluado.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[hallazgo_auditoria.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[incidente_seguridad.activo_informacion_id → activo_informacion]] | [[activo_informacion]] | — | sí |
| [[incidente_seguridad.evento_riesgo_id → evento_riesgo_operativo]] | [[evento_riesgo_operativo]] | — | sí |
| [[incidente_seguridad.incidente_operativo_id → incidente_operativo]] | [[incidente_operativo]] | ↗ 09 | sí |
| [[incidente_seguridad.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[instancia_reclamo.reclamo_id → reclamo_cliente]] | [[reclamo_cliente]] | — | no |
| [[licencia_regulatoria.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[matriz_riesgo_lft.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[observacion_regulatoria.envio_regulatorio_id → envio_regulatorio]] | [[envio_regulatorio]] | — | sí |
| [[observacion_regulatoria.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[oficial_cumplimiento.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[perfil_transaccional.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[plan_accion_riesgo.evento_riesgo_id → evento_riesgo_operativo]] | [[evento_riesgo_operativo]] | — | sí |
| [[plan_accion_riesgo.hallazgo_id → hallazgo_auditoria]] | [[hallazgo_auditoria]] | — | sí |
| [[plan_accion_riesgo.responsable_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[plan_continuidad.politica_interna_id → politica_interna]] | [[politica_interna]] | — | sí |
| [[plan_continuidad.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[politica_interna.acta_comite_id → acta_comite]] | [[acta_comite]] | — | sí |
| [[politica_interna.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[prueba_continuidad.acta_comite_id → acta_comite]] | [[acta_comite]] | — | sí |
| [[prueba_continuidad.ejecutada_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[prueba_continuidad.plan_continuidad_id → plan_continuidad]] | [[plan_continuidad]] | — | no |
| [[prueba_control.control_id → control_interno]] | [[control_interno]] | — | no |
| [[prueba_control.ejecutada_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[punto_reclamo.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[reclamo_cliente.devolucion_comision_id → devolucion_comision]] | [[devolucion_comision]] | ↗ 11 | sí |
| [[reclamo_cliente.punto_reclamo_id → punto_reclamo]] | [[punto_reclamo]] | — | no |
| [[reclamo_cliente.responsable_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[reclamo_cliente.ticket_soporte_id → ticket_soporte]] | [[ticket_soporte]] | ↗ 09 | sí |
| [[reclamo_cliente.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[registro_operacion_relevante.declaracion_origen_fondos_id → declaracion_origen_fondos]] | [[declaracion_origen_fondos]] | — | sí |
| [[registro_operacion_relevante.operacion_inicio_ventana_id → registro_operacion_relevante]] | [[registro_operacion_relevante]] | — | sí |
| [[registro_operacion_relevante.reporte_regulatorio_id → reporte_regulatorio]] | [[reporte_regulatorio]] | — | sí |
| [[registro_operacion_relevante.transaccion_id → transaccion_billetera]] | [[transaccion_billetera]] | ↗ 10 | no |
| [[registro_operacion_relevante.umbral_reporte_id → umbral_reporte_uif]] | [[umbral_reporte_uif]] | — | no |
| [[registro_operacion_relevante.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[regla_monitoreo_lft.aprobada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[reporte_regulatorio.aprobado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[reporte_regulatorio.catalogo_reporte_id → catalogo_reporte_regulatorio]] | [[catalogo_reporte_regulatorio]] | — | no |
| [[reporte_regulatorio.generado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[reporte_regulatorio.revisado_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[requerimiento_autoridad.bloqueo_saldo_id → bloqueo_saldo]] | [[bloqueo_saldo]] | ↗ 10 | sí |
| [[requerimiento_autoridad.respondido_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[requerimiento_autoridad.usuario_afectado_id → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[revision_periodica_kyc.calificacion_riesgo_id → calificacion_riesgo_cliente]] | [[calificacion_riesgo_cliente]] | — | sí |
| [[revision_periodica_kyc.ejecutada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[revision_periodica_kyc.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
