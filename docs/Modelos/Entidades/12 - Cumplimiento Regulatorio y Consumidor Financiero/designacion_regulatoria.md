---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: designacion_regulatoria
clase: DesignacionRegulatoria
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `designacion_regulatoria`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `DesignacionRegulatoria`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `acta_comite_id` | UUID | FK | sí | FK, NULL |
| `cargo` | VARCHAR(40) | IDX | no | CK, IDX |
| `tipo` | VARCHAR(10) | — | no | CK |
| `fecha_designacion` | DATE | — | no | — |
| `organismo_comunicado` | VARCHAR(10) | — | sí | NULL |
| `comunicada_al_organismo_en` | DATE | — | sí | NULL |
| `fecha_baja` | DATE | — | sí | NULL |
| `activo` | BOOLEAN | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acta_comite_id` | [[acta_comite]] | 12 | sí | [[designacion_regulatoria.acta_comite_id → acta_comite]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[designacion_regulatoria.usuario_id → usuario]] |

## Entidades vecinas

[[acta_comite]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
