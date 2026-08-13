---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: plan_regularizacion
clase: PlanRegularizacion
modulo: "03 — Aportes, Pagos QR y Conciliación"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 2
append_only: false
---

# `plan_regularizacion`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `PlanRegularizacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `participante_id` | UUID | FK IDX | no | FK, IDX |
| `monto_total` | DECIMAL(14,2) | — | no | — |
| `num_cuotas` | SMALLINT | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `aprobado_por` | UUID | FK | no | FK |
| `creado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por` | [[usuario]] | ↗ 01 | no | [[plan_regularizacion.aprobado_por → usuario]] |
| `participante_id` | [[participante]] | ↗ 02 | no | [[plan_regularizacion.participante_id → participante]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[obligacion_aporte]] | `plan_regularizacion_id` | 03 | [[obligacion_aporte.plan_regularizacion_id → plan_regularizacion]] |
| [[solicitud_retiro]] | `plan_regularizacion_id` | ↗ 02 | [[solicitud_retiro.plan_regularizacion_id → plan_regularizacion]] |

## Entidades vecinas

[[obligacion_aporte]] · [[participante]] · [[solicitud_retiro]] · [[usuario]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
