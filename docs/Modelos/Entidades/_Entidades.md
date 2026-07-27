---
tags:
  - moc
  - indice
entidades: 174
---

# Índice de entidades

Las **174 tablas** del modelo, agrupadas por módulo. «Sal.» y «Ent.» son claves foráneas salientes y entrantes.

[[Index|← Índice general]] · [[_Relaciones|Relaciones →]]

## 01 — Identidad, Usuarios y Seguridad

> Saber con certeza a quién le estás confiando plata ajena · [[01_identidad_usuarios|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[usuario]] | 18 | 0 | 107 | muy conectada |
| [[direccion_usuario]] | 8 | 1 | 0 | — |
| [[perfil_financiero]] | 8 | 1 | 0 | — |
| [[credencial_acceso]] | 8 | 1 | 0 | — |
| [[historial_credencial]] | 4 | 1 | 0 | — |
| [[politica_token]] | 12 | 0 | 0 | — |
| [[token_verificacion]] | 31 | 4 | 9 | muy conectada |
| [[intento_validacion_token]] | 7 | 1 | 0 | — |
| [[factor_mfa]] | 8 | 1 | 0 | — |
| [[dispositivo]] | 11 | 1 | 2 | — |
| [[sesion]] | 11 | 2 | 0 | — |
| [[intento_autenticacion]] | 10 | 1 | 0 | — |
| [[bloqueo_cuenta]] | 7 | 2 | 0 | — |
| [[restriccion_usuario]] | 10 | 2 | 0 | — |
| [[documento_identidad]] | 13 | 1 | 1 | — |
| [[verificacion_kyc]] | 14 | 3 | 1 | — |
| [[referencia_personal]] | 8 | 1 | 0 | — |
| [[rol]] | 5 | 0 | 2 | — |
| [[permiso]] | 6 | 0 | 1 | — |
| [[rol_permiso]] | 2 | 2 | 0 | — |
| [[asignacion_rol]] | 10 | 3 | 0 | — |
| [[consentimiento]] | 10 | 1 | 0 | — |
| [[preferencia_notificacion]] | 11 | 1 | 0 | — |
| [[reputacion_usuario]] | 11 | 1 | 0 | — |
| [[solicitud_baja]] | 6 | 1 | 0 | — |

## 02 — Grupos, Cupos, Turnos y Gobernanza

> Reglas del juego, orden de cobro y decisiones colectivas · [[02_grupos_turnos|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[grupo]] | 27 | 1 | 38 | muy conectada |
| [[configuracion_grupo]] | 10 | 3 | 0 | — |
| [[reglamento_grupo]] | 10 | 2 | 1 | — |
| [[aceptacion_reglamento]] | 7 | 3 | 0 | — |
| [[historial_estado_grupo]] | 7 | 2 | 0 | — |
| [[participante]] | 13 | 3 | 24 | muy conectada |
| [[cupo]] | 8 | 2 | 6 | muy conectada |
| [[traspaso_cupo]] | 10 | 4 | 0 | — |
| [[solicitud_retiro]] | 7 | 1 | 0 | — |
| [[solicitud_ingreso]] | 10 | 3 | 0 | — |
| [[invitacion]] | 12 | 3 | 0 | — |
| [[periodo]] | 11 | 1 | 6 | — |
| [[turno]] | 11 | 4 | 4 | muy conectada |
| [[sorteo_turnos]] | 10 | 2 | 0 | — |
| [[solicitud_permuta]] | 11 | 4 | 0 | — |
| [[dia_no_habil]] | 5 | 1 | 0 | — |
| [[postulacion_emparejamiento]] | 11 | 1 | 1 | — |
| [[criterio_emparejamiento]] | 8 | 0 | 1 | — |
| [[propuesta_grupo]] | 10 | 2 | 1 | — |
| [[propuesta_postulacion]] | 4 | 2 | 0 | — |
| [[acuerdo]] | 14 | 2 | 7 | muy conectada |
| [[voto_participante]] | 7 | 2 | 0 | — |

## 03 — Aportes, Pagos QR y Conciliación

> Que "pagué" signifique "el banco lo confirmó" · [[03_aportes_pagos_qr|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[politica_mora]] | 10 | 1 | 2 | — |
| [[obligacion_aporte]] | 22 | 7 | 5 | muy conectada |
| [[plan_regularizacion]] | 7 | 2 | 1 | — |
| [[proveedor_pago]] | 12 | 0 | 4 | — |
| [[orden_cobro]] | 11 | 2 | 4 | — |
| [[qr_cobro]] | 9 | 1 | 0 | — |
| [[enlace_pago_rapido]] | 6 | 2 | 0 | — |
| [[intento_pago]] | 10 | 1 | 1 | — |
| [[pago]] | 18 | 3 | 8 | muy conectada |
| [[comprobante_manual]] | 9 | 3 | 0 | — |
| [[constancia_pago]] | 7 | 1 | 0 | — |
| [[reembolso]] | 10 | 3 | 0 | — |
| [[disputa_pago]] | 10 | 1 | 0 | — |
| [[extracto_bancario]] | 10 | 2 | 1 | — |
| [[movimiento_bancario]] | 9 | 1 | 1 | — |
| [[conciliacion]] | 8 | 3 | 1 | — |
| [[excepcion_conciliacion]] | 10 | 2 | 0 | — |
| [[webhook_pasarela]] | 13 | 2 | 0 | — |
| [[cuenta_contable]] | 8 | 2 | 2 | — |
| [[asiento_contable]] | 10 | 3 | 5 | append-only, muy conectada |
| [[movimiento_contable]] | 6 | 2 | 0 | append-only |
| [[cierre_diario]] | 10 | 1 | 0 | — |

## 04 — Entregas de Fondo

> Que la bolsa llegue completa, a la persona correcta, una sola vez · [[04_entregas_fondo|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[entrega_fondo]] | 23 | 8 | 8 | muy conectada |
| [[deduccion_entrega]] | 9 | 1 | 0 | — |
| [[regla_entrega]] | 8 | 0 | 1 | — |
| [[validacion_pre_entrega]] | 10 | 3 | 0 | — |
| [[cuenta_bancaria_beneficiario]] | 15 | 1 | 2 | — |
| [[orden_desembolso]] | 12 | 3 | 1 | — |
| [[intento_desembolso]] | 9 | 1 | 0 | — |
| [[confirmacion_recepcion]] | 10 | 2 | 0 | — |
| [[incidencia_entrega]] | 14 | 3 | 0 | — |
| [[historial_estado_entrega]] | 7 | 2 | 0 | — |

## 05 — Notificaciones y Comunicaciones

> WhatsApp como canal real de cobro, sin spam ni doble aviso · [[05_notificaciones|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[evento_notificable]] | 10 | 0 | 3 | — |
| [[plantilla_mensaje]] | 9 | 1 | 1 | — |
| [[version_plantilla]] | 11 | 1 | 1 | — |
| [[proveedor_mensajeria]] | 11 | 0 | 1 | — |
| [[canal_vinculado]] | 12 | 1 | 2 | — |
| [[lista_supresion]] | 6 | 0 | 0 | — |
| [[notificacion]] | 11 | 2 | 5 | — |
| [[envio_notificacion]] | 20 | 4 | 3 | — |
| [[evento_entrega_mensaje]] | 8 | 1 | 0 | — |
| [[cola_envio]] | 6 | 1 | 0 | — |
| [[cola_muerta]] | 6 | 1 | 0 | — |
| [[enlace_pago_notificado]] | 9 | 3 | 0 | — |
| [[respuesta_entrante]] | 8 | 2 | 0 | — |
| [[programacion_recordatorio]] | 9 | 2 | 0 | — |
| [[bandeja_entrada]] | 9 | 2 | 0 | — |

## 06 — Transparencia y Reputación

> Que nadie tenga que "creerle" al organizador · [[06_transparencia_reputacion|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[modelo_scoring]] | 12 | 0 | 3 | — |
| [[peso_factor]] | 7 | 1 | 0 | — |
| [[regla_impacto_evento]] | 8 | 1 | 0 | — |
| [[evento_reputacion]] | 14 | 4 | 1 | append-only |
| [[puntaje_reputacion]] | 16 | 2 | 1 | — |
| [[componente_score]] | 7 | 1 | 0 | — |
| [[snapshot_reputacion]] | 7 | 1 | 1 | — |
| [[certificado_reputacion]] | 10 | 2 | 0 | — |
| [[insignia_logro]] | 6 | 0 | 1 | — |
| [[insignia_otorgada]] | 6 | 2 | 0 | — |
| [[metrica_grupo]] | 9 | 2 | 0 | — |
| [[bloque_transparencia]] | 11 | 1 | 1 | — |
| [[registro_sellado]] | 7 | 1 | 0 | append-only |
| [[verificacion_publica]] | 6 | 0 | 0 | — |
| [[resena_participante]] | 10 | 4 | 0 | — |
| [[alerta_riesgo]] | 10 | 0 | 0 | — |

## 07 — Organizador y Automatización

> Administrar es un rol, no un negocio: sin comisión y sin custodia · [[07_organizador_automatizacion|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[organizador]] | 15 | 1 | 5 | — |
| [[solicitud_organizador]] | 11 | 3 | 0 | — |
| [[requisito_habilitacion]] | 8 | 0 | 0 | — |
| [[capacitacion_organizador]] | 7 | 1 | 0 | — |
| [[contrato_organizador]] | 12 | 2 | 0 | — |
| [[evaluacion_desempeno]] | 13 | 1 | 2 | — |
| [[metrica_organizador]] | 7 | 1 | 0 | — |
| [[sancion_organizador]] | 9 | 3 | 1 | — |
| [[apelacion_sancion_org]] | 9 | 2 | 0 | — |
| [[regla_automatizacion]] | 10 | 0 | 1 | — |
| [[tarea_automatizada]] | 8 | 2 | 1 | — |
| [[ejecucion_tarea]] | 8 | 1 | 0 | — |

## 08 — Garantía, Incumplimiento, Cobranza y Sanciones

> El grupo no se detiene, pero la deuda no se perdona sola · [[08_garantia_incumplimiento|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[politica_cobertura]] | 13 | 1 | 1 | — |
| [[fondo_garantia]] | 14 | 3 | 3 | — |
| [[movimiento_fondo]] | 11 | 3 | 2 | append-only |
| [[devolucion_fondo]] | 9 | 2 | 0 | — |
| [[registro_incumplimiento]] | 30 | 9 | 11 | append-only, muy conectada |
| [[evidencia_incumplimiento]] | 10 | 2 | 0 | — |
| [[historial_estado_incumplimiento]] | 9 | 2 | 0 | append-only |
| [[descargo_participante]] | 10 | 3 | 0 | — |
| [[historial_incumplimiento_usuario]] | 14 | 1 | 0 | — |
| [[lista_restriccion_interna]] | 11 | 3 | 0 | — |
| [[score_riesgo_incumplimiento]] | 8 | 2 | 0 | — |
| [[alerta_temprana]] | 8 | 2 | 0 | — |
| [[estrategia_cobranza]] | 12 | 0 | 1 | — |
| [[gestion_cobranza]] | 12 | 3 | 2 | — |
| [[accion_cobranza]] | 11 | 3 | 0 | — |
| [[promesa_pago]] | 10 | 2 | 0 | — |
| [[acuerdo_quita]] | 10 | 3 | 0 | — |
| [[cobertura_incumplimiento]] | 16 | 7 | 2 | muy conectada |
| [[deuda_participante]] | 18 | 5 | 4 | muy conectada |
| [[subrogacion]] | 8 | 2 | 0 | — |
| [[abono_recuperacion]] | 13 | 5 | 0 | append-only |
| [[castigo_deuda]] | 9 | 3 | 0 | — |
| [[aval_participante]] | 12 | 4 | 1 | — |
| [[ejecucion_aval]] | 10 | 4 | 0 | — |
| [[politica_sancion]] | 8 | 1 | 3 | — |
| [[matriz_sancion]] | 10 | 1 | 1 | — |
| [[sancion]] | 16 | 6 | 1 | — |
| [[apelacion_sancion]] | 12 | 3 | 0 | — |
| [[reemplazo_participante]] | 12 | 6 | 1 | — |
| [[candidato_reemplazo]] | 7 | 2 | 0 | — |
| [[plan_contingencia]] | 11 | 2 | 0 | — |
| [[disolucion_anticipada]] | 10 | 2 | 1 | — |
| [[liquidacion_participante]] | 8 | 2 | 0 | — |

## 09 — Auditoría, Reportes y Cumplimiento

> Poder demostrar todo lo anterior ante un reclamo o un regulador · [[09_auditoria_reportes|ficha de negocio]]

| Tabla | Columnas | Sal. | Ent. | Notas |
| --- | --: | --: | --: | --- |
| [[bitacora_evento]] | 21 | 3 | 0 | append-only |
| [[evento_dominio]] | 13 | 0 | 0 | append-only |
| [[registro_acceso_datos]] | 10 | 2 | 0 | append-only |
| [[politica_retencion]] | 7 | 0 | 0 | — |
| [[definicion_reporte]] | 11 | 0 | 2 | — |
| [[ejecucion_reporte]] | 12 | 3 | 1 | — |
| [[exportacion_reporte]] | 10 | 1 | 0 | — |
| [[programacion_reporte]] | 10 | 1 | 0 | — |
| [[indicador_kpi]] | 11 | 0 | 0 | — |
| [[regla_cumplimiento]] | 10 | 0 | 1 | — |
| [[alerta_cumplimiento]] | 15 | 5 | 0 | — |
| [[reporte_operacion_sospechosa]] | 10 | 2 | 1 | — |
| [[lista_restrictiva_externa]] | 5 | 0 | 1 | — |
| [[coincidencia_lista]] | 8 | 3 | 0 | — |
| [[umbral_operativo]] | 6 | 0 | 0 | — |
| [[solicitud_datos_personales]] | 10 | 2 | 1 | — |
| [[proceso_anonimizacion]] | 8 | 2 | 0 | — |
| [[ticket_soporte]] | 13 | 2 | 0 | — |
| [[incidente_operativo]] | 13 | 0 | 0 | — |

## Tablas append-only

No admiten `UPDATE` ni `DELETE`; se corrigen con el movimiento inverso:

[[abono_recuperacion]] · [[asiento_contable]] · [[bitacora_evento]] · [[evento_dominio]] · [[evento_reputacion]] · [[historial_estado_incumplimiento]] · [[movimiento_contable]] · [[movimiento_fondo]] · [[registro_acceso_datos]] · [[registro_incumplimiento]] · [[registro_sellado]]

