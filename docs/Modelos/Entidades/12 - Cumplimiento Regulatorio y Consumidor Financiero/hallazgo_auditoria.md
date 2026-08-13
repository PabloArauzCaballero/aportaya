---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: hallazgo_auditoria
clase: HallazgoAuditoria
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `hallazgo_auditoria`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `HallazgoAuditoria`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `origen` | VARCHAR(25) | IDX | no | CK, IDX |
| `descripcion` | TEXT | — | no | — |
| `severidad` | VARCHAR(10) | IDX | no | CK, IDX |
| `proceso` | VARCHAR(60) | — | no | — |
| `fecha_identificacion` | DATE | — | no | — |
| `plazo_regularizacion` | DATE | IDX | no | IDX |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[hallazgo_auditoria.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[plan_accion_riesgo]] | `hallazgo_id` | 12 | [[plan_accion_riesgo.hallazgo_id → hallazgo_auditoria]] |

## Entidades vecinas

[[plan_accion_riesgo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
