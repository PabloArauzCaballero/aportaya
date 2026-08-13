---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: plan_accion_riesgo
clase: PlanAccionRiesgo
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `plan_accion_riesgo`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `PlanAccionRiesgo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `evento_riesgo_id` | UUID | FK | sí | FK, NULL |
| `hallazgo_id` | UUID | FK | sí | FK, NULL |
| `responsable_id` | UUID | FK | no | FK |
| `descripcion` | VARCHAR(500) | — | no | — |
| `fecha_compromiso` | DATE | IDX | no | IDX |
| `fecha_cierre` | DATE | — | sí | NULL |
| `avance_porcentaje` | DECIMAL(5,2) | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `evidencia_url` | VARCHAR(255) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `evento_riesgo_id` | [[evento_riesgo_operativo]] | 12 | sí | [[plan_accion_riesgo.evento_riesgo_id → evento_riesgo_operativo]] |
| `hallazgo_id` | [[hallazgo_auditoria]] | 12 | sí | [[plan_accion_riesgo.hallazgo_id → hallazgo_auditoria]] |
| `responsable_id` | [[usuario]] | ↗ 01 | no | [[plan_accion_riesgo.responsable_id → usuario]] |

## Entidades vecinas

[[evento_riesgo_operativo]] · [[hallazgo_auditoria]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
