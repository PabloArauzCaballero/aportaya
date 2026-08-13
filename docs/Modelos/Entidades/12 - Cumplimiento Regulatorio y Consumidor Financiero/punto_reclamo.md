---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: punto_reclamo
clase: PuntoReclamo
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `punto_reclamo`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `PuntoReclamo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `tipo` | VARCHAR(12) | — | no | CK |
| `descripcion` | VARCHAR(200) | — | no | — |
| `horario` | VARCHAR(80) | — | no | — |
| `responsable_id` | UUID | FK | sí | FK, NULL |
| `activo` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_id` | [[usuario]] | ↗ 01 | sí | [[punto_reclamo.responsable_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[reclamo_cliente]] | `punto_reclamo_id` | 12 | [[reclamo_cliente.punto_reclamo_id → punto_reclamo]] |

## Entidades vecinas

[[reclamo_cliente]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
