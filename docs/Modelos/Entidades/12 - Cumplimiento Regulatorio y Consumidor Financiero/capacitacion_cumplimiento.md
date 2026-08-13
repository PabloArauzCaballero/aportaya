---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: capacitacion_cumplimiento
clase: CapacitacionCumplimiento
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `capacitacion_cumplimiento`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `CapacitacionCumplimiento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `tema` | VARCHAR(120) | — | no | — |
| `modalidad` | VARCHAR(15) | — | no | CK |
| `horas` | DECIMAL(5,2) | — | no | — |
| `fecha` | DATE | IDX | no | IDX |
| `calificacion` | DECIMAL(5,2) | — | sí | NULL |
| `aprobada` | BOOLEAN | — | no | — |
| `evidencia_url` | VARCHAR(255) | — | sí | NULL |
| `periodo` | CHAR(4) | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[capacitacion_cumplimiento.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
