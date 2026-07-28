---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: usuario
clase: Usuario
modulo: "01 — Identidad, Usuarios y Seguridad"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 18
fk_salientes: 0
fk_entrantes: 107
append_only: false
---

# `usuario`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `Usuario` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo_publico` | VARCHAR(12) | UQ | no | UQ |
| `nombres` | VARCHAR(80) | — | no | — |
| `apellidos` | VARCHAR(80) | — | no | — |
| `telefono_e164` | VARCHAR(20) | UQ IDX | no | UQ, IDX |
| `correo` | VARCHAR(150) | UQ | sí | UQ, NULL |
| `fecha_nacimiento` | DATE | — | no | — |
| `estado` | VARCHAR(25) | — | no | CK |
| `nivel_kyc` | VARCHAR(15) | — | no | CK |
| `idioma` | VARCHAR(10) | — | no | — |
| `zona_horaria` | VARCHAR(40) | — | no | — |
| `url_avatar` | VARCHAR(255) | — | sí | NULL |
| `telefono_verificado_en` | TIMESTAMPTZ | — | sí | NULL |
| `correo_verificado_en` | TIMESTAMPTZ | — | sí | NULL |
| `ultimo_acceso_en` | TIMESTAMPTZ | — | sí | NULL |
| `fecha_registro` | TIMESTAMPTZ | — | no | — |
| `eliminado_en` | TIMESTAMPTZ | — | sí | NULL |
| `version` | INTEGER | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[abono_recuperacion]] | `registrado_por` | ↗ 08 | [[abono_recuperacion.registrado_por → usuario]] |
| [[accion_cobranza]] | `ejecutada_por` | ↗ 08 | [[accion_cobranza.ejecutada_por → usuario]] |
| [[acuerdo]] | `propuesto_por` | ↗ 02 | [[acuerdo.propuesto_por → usuario]] |
| [[acuerdo_quita]] | `aprobado_por` | ↗ 08 | [[acuerdo_quita.aprobado_por → usuario]] |
| [[alerta_cumplimiento]] | `analista_id` | ↗ 09 | [[alerta_cumplimiento.analista_id → usuario]] |
| [[alerta_cumplimiento]] | `usuario_id` | ↗ 09 | [[alerta_cumplimiento.usuario_id → usuario]] |
| [[alerta_temprana]] | `usuario_id` | ↗ 08 | [[alerta_temprana.usuario_id → usuario]] |
| [[apelacion_sancion]] | `apelante_id` | ↗ 08 | [[apelacion_sancion.apelante_id → usuario]] |
| [[apelacion_sancion]] | `resuelta_por` | ↗ 08 | [[apelacion_sancion.resuelta_por → usuario]] |
| [[apelacion_sancion_org]] | `resuelta_por` | ↗ 07 | [[apelacion_sancion_org.resuelta_por → usuario]] |
| [[asiento_contable]] | `registrado_por` | ↗ 03 | [[asiento_contable.registrado_por → usuario]] |
| [[asignacion_rol]] | `otorgada_por` | 01 | [[asignacion_rol.otorgada_por → usuario]] |
| [[asignacion_rol]] | `usuario_id` | 01 | [[asignacion_rol.usuario_id → usuario]] |
| [[aval_participante]] | `avalista_usuario_id` | ↗ 08 | [[aval_participante.avalista_usuario_id → usuario]] |
| [[bandeja_entrada]] | `usuario_id` | ↗ 05 | [[bandeja_entrada.usuario_id → usuario]] |
| [[bitacora_evento]] | `actor_usuario_id` | ↗ 09 | [[bitacora_evento.actor_usuario_id → usuario]] |
| [[bitacora_evento]] | `suplantando_a_usuario_id` | ↗ 09 | [[bitacora_evento.suplantando_a_usuario_id → usuario]] |
| [[bloqueo_cuenta]] | `liberada_por` | 01 | [[bloqueo_cuenta.liberada_por → usuario]] |
| [[bloqueo_cuenta]] | `usuario_id` | 01 | [[bloqueo_cuenta.usuario_id → usuario]] |
| [[canal_vinculado]] | `usuario_id` | ↗ 05 | [[canal_vinculado.usuario_id → usuario]] |
| [[candidato_reemplazo]] | `usuario_id` | ↗ 08 | [[candidato_reemplazo.usuario_id → usuario]] |
| [[castigo_deuda]] | `aprobado_por` | ↗ 08 | [[castigo_deuda.aprobado_por → usuario]] |
| [[certificado_reputacion]] | `usuario_id` | ↗ 06 | [[certificado_reputacion.usuario_id → usuario]] |
| [[cierre_diario]] | `cerrado_por` | ↗ 03 | [[cierre_diario.cerrado_por → usuario]] |
| [[cobertura_incumplimiento]] | `aprobada_por` | ↗ 08 | [[cobertura_incumplimiento.aprobada_por → usuario]] |
| [[coincidencia_lista]] | `revisada_por` | ↗ 09 | [[coincidencia_lista.revisada_por → usuario]] |
| [[coincidencia_lista]] | `usuario_id` | ↗ 09 | [[coincidencia_lista.usuario_id → usuario]] |
| [[comprobante_manual]] | `revisado_por` | ↗ 03 | [[comprobante_manual.revisado_por → usuario]] |
| [[comprobante_manual]] | `segunda_revision_por` | ↗ 03 | [[comprobante_manual.segunda_revision_por → usuario]] |
| [[conciliacion]] | `conciliado_por` | ↗ 03 | [[conciliacion.conciliado_por → usuario]] |
| [[consentimiento]] | `usuario_id` | 01 | [[consentimiento.usuario_id → usuario]] |
| [[credencial_acceso]] | `usuario_id` | 01 | [[credencial_acceso.usuario_id → usuario]] |
| [[cuenta_bancaria_beneficiario]] | `usuario_id` | ↗ 04 | [[cuenta_bancaria_beneficiario.usuario_id → usuario]] |
| [[descargo_participante]] | `resuelto_por` | ↗ 08 | [[descargo_participante.resuelto_por → usuario]] |
| [[deuda_participante]] | `usuario_id` | ↗ 08 | [[deuda_participante.usuario_id → usuario]] |
| [[direccion_usuario]] | `usuario_id` | 01 | [[direccion_usuario.usuario_id → usuario]] |
| [[dispositivo]] | `usuario_id` | 01 | [[dispositivo.usuario_id → usuario]] |
| [[documento_identidad]] | `usuario_id` | 01 | [[documento_identidad.usuario_id → usuario]] |
| [[ejecucion_reporte]] | `solicitado_por` | ↗ 09 | [[ejecucion_reporte.solicitado_por → usuario]] |
| [[entrega_fondo]] | `autorizada_por` | ↗ 04 | [[entrega_fondo.autorizada_por → usuario]] |
| [[entrega_fondo]] | `ejecutada_por` | ↗ 04 | [[entrega_fondo.ejecutada_por → usuario]] |
| [[evento_reputacion]] | `usuario_id` | ↗ 06 | [[evento_reputacion.usuario_id → usuario]] |
| [[evidencia_incumplimiento]] | `aportada_por` | ↗ 08 | [[evidencia_incumplimiento.aportada_por → usuario]] |
| [[excepcion_conciliacion]] | `asignada_a` | ↗ 03 | [[excepcion_conciliacion.asignada_a → usuario]] |
| [[extracto_bancario]] | `importado_por` | ↗ 03 | [[extracto_bancario.importado_por → usuario]] |
| [[factor_mfa]] | `usuario_id` | 01 | [[factor_mfa.usuario_id → usuario]] |
| [[gestion_cobranza]] | `gestor_asignado_id` | ↗ 08 | [[gestion_cobranza.gestor_asignado_id → usuario]] |
| [[historial_credencial]] | `usuario_id` | 01 | [[historial_credencial.usuario_id → usuario]] |
| [[historial_estado_entrega]] | `ejecutado_por` | ↗ 04 | [[historial_estado_entrega.ejecutado_por → usuario]] |
| [[historial_estado_grupo]] | `ejecutado_por` | ↗ 02 | [[historial_estado_grupo.ejecutado_por → usuario]] |
| [[historial_estado_incumplimiento]] | `ejecutado_por` | ↗ 08 | [[historial_estado_incumplimiento.ejecutado_por → usuario]] |
| [[historial_incumplimiento_usuario]] | `usuario_id` | ↗ 08 | [[historial_incumplimiento_usuario.usuario_id → usuario]] |
| [[incidencia_entrega]] | `asignada_a` | ↗ 04 | [[incidencia_entrega.asignada_a → usuario]] |
| [[incidencia_entrega]] | `reportada_por` | ↗ 04 | [[incidencia_entrega.reportada_por → usuario]] |
| [[insignia_otorgada]] | `usuario_id` | ↗ 06 | [[insignia_otorgada.usuario_id → usuario]] |
| [[intento_autenticacion]] | `usuario_id` | 01 | [[intento_autenticacion.usuario_id → usuario]] |
| [[invitacion]] | `emisor_id` | ↗ 02 | [[invitacion.emisor_id → usuario]] |
| [[lista_restriccion_interna]] | `retirado_por` | ↗ 08 | [[lista_restriccion_interna.retirado_por → usuario]] |
| [[lista_restriccion_interna]] | `usuario_id` | ↗ 08 | [[lista_restriccion_interna.usuario_id → usuario]] |
| [[movimiento_fondo]] | `registrado_por` | ↗ 08 | [[movimiento_fondo.registrado_por → usuario]] |
| [[notificacion]] | `usuario_id` | ↗ 05 | [[notificacion.usuario_id → usuario]] |
| [[organizador]] | `usuario_id` | ↗ 07 | [[organizador.usuario_id → usuario]] |
| [[pago]] | `registrado_por` | ↗ 03 | [[pago.registrado_por → usuario]] |
| [[participante]] | `usuario_id` | ↗ 02 | [[participante.usuario_id → usuario]] |
| [[perfil_financiero]] | `usuario_id` | 01 | [[perfil_financiero.usuario_id → usuario]] |
| [[plan_regularizacion]] | `aprobado_por` | ↗ 03 | [[plan_regularizacion.aprobado_por → usuario]] |
| [[postulacion_emparejamiento]] | `usuario_id` | ↗ 02 | [[postulacion_emparejamiento.usuario_id → usuario]] |
| [[preferencia_notificacion]] | `usuario_id` | 01 | [[preferencia_notificacion.usuario_id → usuario]] |
| [[proceso_anonimizacion]] | `usuario_id` | ↗ 09 | [[proceso_anonimizacion.usuario_id → usuario]] |
| [[promesa_pago]] | `registrada_por` | ↗ 08 | [[promesa_pago.registrada_por → usuario]] |
| [[puntaje_reputacion]] | `usuario_id` | ↗ 06 | [[puntaje_reputacion.usuario_id → usuario]] |
| [[reembolso]] | `aprobado_por` | ↗ 03 | [[reembolso.aprobado_por → usuario]] |
| [[reembolso]] | `solicitado_por` | ↗ 03 | [[reembolso.solicitado_por → usuario]] |
| [[referencia_personal]] | `usuario_id` | 01 | [[referencia_personal.usuario_id → usuario]] |
| [[registro_acceso_datos]] | `usuario_afectado_id` | ↗ 09 | [[registro_acceso_datos.usuario_afectado_id → usuario]] |
| [[registro_acceso_datos]] | `usuario_consultor_id` | ↗ 09 | [[registro_acceso_datos.usuario_consultor_id → usuario]] |
| [[registro_incumplimiento]] | `reportado_por` | ↗ 08 | [[registro_incumplimiento.reportado_por → usuario]] |
| [[registro_incumplimiento]] | `responsable_gestion` | ↗ 08 | [[registro_incumplimiento.responsable_gestion → usuario]] |
| [[registro_incumplimiento]] | `usuario_id` | ↗ 08 | [[registro_incumplimiento.usuario_id → usuario]] |
| [[reglamento_grupo]] | `redactado_por` | ↗ 02 | [[reglamento_grupo.redactado_por → usuario]] |
| [[reporte_operacion_sospechosa]] | `aprobado_por` | ↗ 09 | [[reporte_operacion_sospechosa.aprobado_por → usuario]] |
| [[reporte_operacion_sospechosa]] | `usuario_id` | ↗ 09 | [[reporte_operacion_sospechosa.usuario_id → usuario]] |
| [[reputacion_usuario]] | `usuario_id` | 01 | [[reputacion_usuario.usuario_id → usuario]] |
| [[resena_participante]] | `evaluado_usuario_id` | ↗ 06 | [[resena_participante.evaluado_usuario_id → usuario]] |
| [[resena_participante]] | `moderada_por` | ↗ 06 | [[resena_participante.moderada_por → usuario]] |
| [[restriccion_usuario]] | `levantada_por` | 01 | [[restriccion_usuario.levantada_por → usuario]] |
| [[restriccion_usuario]] | `usuario_id` | 01 | [[restriccion_usuario.usuario_id → usuario]] |
| [[sancion]] | `aplicada_por` | ↗ 08 | [[sancion.aplicada_por → usuario]] |
| [[sancion]] | `usuario_id` | ↗ 08 | [[sancion.usuario_id → usuario]] |
| [[sancion_organizador]] | `aplicada_por` | ↗ 07 | [[sancion_organizador.aplicada_por → usuario]] |
| [[score_riesgo_incumplimiento]] | `usuario_id` | ↗ 08 | [[score_riesgo_incumplimiento.usuario_id → usuario]] |
| [[sesion]] | `usuario_id` | 01 | [[sesion.usuario_id → usuario]] |
| [[snapshot_reputacion]] | `usuario_id` | ↗ 06 | [[snapshot_reputacion.usuario_id → usuario]] |
| [[solicitud_baja]] | `usuario_id` | 01 | [[solicitud_baja.usuario_id → usuario]] |
| [[solicitud_datos_personales]] | `atendida_por` | ↗ 09 | [[solicitud_datos_personales.atendida_por → usuario]] |
| [[solicitud_datos_personales]] | `usuario_id` | ↗ 09 | [[solicitud_datos_personales.usuario_id → usuario]] |
| [[solicitud_ingreso]] | `revisada_por` | ↗ 02 | [[solicitud_ingreso.revisada_por → usuario]] |
| [[solicitud_ingreso]] | `usuario_id` | ↗ 02 | [[solicitud_ingreso.usuario_id → usuario]] |
| [[solicitud_organizador]] | `revisada_por` | ↗ 07 | [[solicitud_organizador.revisada_por → usuario]] |
| [[solicitud_organizador]] | `usuario_id` | ↗ 07 | [[solicitud_organizador.usuario_id → usuario]] |
| [[sorteo_turnos]] | `ejecutado_por` | ↗ 02 | [[sorteo_turnos.ejecutado_por → usuario]] |
| [[ticket_soporte]] | `asignado_a` | ↗ 09 | [[ticket_soporte.asignado_a → usuario]] |
| [[ticket_soporte]] | `usuario_id` | ↗ 09 | [[ticket_soporte.usuario_id → usuario]] |
| [[token_verificacion]] | `usuario_id` | 01 | [[token_verificacion.usuario_id → usuario]] |
| [[validacion_pre_entrega]] | `omitida_por` | ↗ 04 | [[validacion_pre_entrega.omitida_por → usuario]] |
| [[verificacion_kyc]] | `revisada_por` | 01 | [[verificacion_kyc.revisada_por → usuario]] |
| [[verificacion_kyc]] | `usuario_id` | 01 | [[verificacion_kyc.usuario_id → usuario]] |

## Entidades vecinas

[[abono_recuperacion]] · [[accion_cobranza]] · [[acuerdo]] · [[acuerdo_quita]] · [[alerta_cumplimiento]] · [[alerta_temprana]] · [[apelacion_sancion]] · [[apelacion_sancion_org]] · [[asiento_contable]] · [[asignacion_rol]] · [[aval_participante]] · [[bandeja_entrada]] · [[bitacora_evento]] · [[bloqueo_cuenta]] · [[canal_vinculado]] · [[candidato_reemplazo]] · [[castigo_deuda]] · [[certificado_reputacion]] · [[cierre_diario]] · [[cobertura_incumplimiento]] · [[coincidencia_lista]] · [[comprobante_manual]] · [[conciliacion]] · [[consentimiento]] · [[credencial_acceso]] · [[cuenta_bancaria_beneficiario]] · [[descargo_participante]] · [[deuda_participante]] · [[direccion_usuario]] · [[dispositivo]] · [[documento_identidad]] · [[ejecucion_reporte]] · [[entrega_fondo]] · [[evento_reputacion]] · [[evidencia_incumplimiento]] · [[excepcion_conciliacion]] · [[extracto_bancario]] · [[factor_mfa]] · [[gestion_cobranza]] · [[historial_credencial]] · [[historial_estado_entrega]] · [[historial_estado_grupo]] · [[historial_estado_incumplimiento]] · [[historial_incumplimiento_usuario]] · [[incidencia_entrega]] · [[insignia_otorgada]] · [[intento_autenticacion]] · [[invitacion]] · [[lista_restriccion_interna]] · [[movimiento_fondo]] · [[notificacion]] · [[organizador]] · [[pago]] · [[participante]] · [[perfil_financiero]] · [[plan_regularizacion]] · [[postulacion_emparejamiento]] · [[preferencia_notificacion]] · [[proceso_anonimizacion]] · [[promesa_pago]] · [[puntaje_reputacion]] · [[reembolso]] · [[referencia_personal]] · [[registro_acceso_datos]] · [[registro_incumplimiento]] · [[reglamento_grupo]] · [[reporte_operacion_sospechosa]] · [[reputacion_usuario]] · [[resena_participante]] · [[restriccion_usuario]] · [[sancion]] · [[sancion_organizador]] · [[score_riesgo_incumplimiento]] · [[sesion]] · [[snapshot_reputacion]] · [[solicitud_baja]] · [[solicitud_datos_personales]] · [[solicitud_ingreso]] · [[solicitud_organizador]] · [[sorteo_turnos]] · [[ticket_soporte]] · [[token_verificacion]] · [[validacion_pre_entrega]] · [[verificacion_kyc]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
