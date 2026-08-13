---
tags:
  - moc
  - modulo/07-organizador-y-automatizacion
modulo: "07 — Organizador y Automatización"
relaciones_fk: 17
---

# 07 — Organizador y Automatización · relaciones

Las **17 claves foráneas** que salen de las tablas de este módulo.

[[_Relaciones|← Todas las relaciones]] · [[Index]]

| Relación | Destino | Cruza | Opcional |
| --- | --- | :-: | :-: |
| [[apelacion_sancion_org.resuelta_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[apelacion_sancion_org.sancion_organizador_id → sancion_organizador]] | [[sancion_organizador]] | — | no |
| [[capacitacion_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[contrato_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[contrato_organizador.token_firma_id → token_verificacion]] | [[token_verificacion]] | ↗ 01 | sí |
| [[ejecucion_tarea.tarea_id → tarea_automatizada]] | [[tarea_automatizada]] | — | no |
| [[evaluacion_desempeno.organizador_id → organizador]] | [[organizador]] | — | no |
| [[metrica_organizador.evaluacion_id → evaluacion_desempeno]] | [[evaluacion_desempeno]] | — | no |
| [[organizador.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[sancion_organizador.aplicada_por → usuario]] | [[usuario]] | ↗ 01 | no |
| [[sancion_organizador.evaluacion_id → evaluacion_desempeno]] | [[evaluacion_desempeno]] | — | sí |
| [[sancion_organizador.organizador_id → organizador]] | [[organizador]] | — | no |
| [[solicitud_organizador.kyc_reforzado_id → verificacion_kyc]] | [[verificacion_kyc]] | ↗ 01 | sí |
| [[solicitud_organizador.revisada_por → usuario]] | [[usuario]] | ↗ 01 | sí |
| [[solicitud_organizador.usuario_id → usuario]] | [[usuario]] | ↗ 01 | no |
| [[tarea_automatizada.grupo_id → grupo]] | [[grupo]] | ↗ 02 | no |
| [[tarea_automatizada.regla_id → regla_automatizacion]] | [[regla_automatizacion]] | — | no |
