---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: plan_continuidad
clase: PlanContinuidad
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `plan_continuidad`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `PlanContinuidad`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `politica_interna_id` | UUID | FK | sí | FK, NULL |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `proceso_critico` | VARCHAR(80) | UQ | no | UQ |
| `rto_minutos` | INTEGER | — | no | — |
| `rpo_minutos` | INTEGER | — | no | — |
| `estrategia` | VARCHAR(300) | — | no | — |
| `periodicidad_prueba_meses` | SMALLINT | — | no | — |
| `vigente_desde` | DATE | — | no | — |
| `proxima_prueba` | DATE | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `politica_interna_id` | [[politica_interna]] | 12 | sí | [[plan_continuidad.politica_interna_id → politica_interna]] |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[plan_continuidad.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[prueba_continuidad]] | `plan_continuidad_id` | 12 | [[prueba_continuidad.plan_continuidad_id → plan_continuidad]] |

## Entidades vecinas

[[politica_interna]] · [[prueba_continuidad]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
