---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: declaracion_pep
clase: DeclaracionPep
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 12
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `declaracion_pep`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `DeclaracionPep`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `verificada_por` | UUID | FK | sí | FK, NULL |
| `es_pep` | BOOLEAN | IDX | no | IDX |
| `tipo_pep` | VARCHAR(25) | — | sí | CK, NULL |
| `cargo` | VARCHAR(120) | — | sí | NULL |
| `institucion` | VARCHAR(120) | — | sí | NULL |
| `pais` | CHAR(2) | — | sí | NULL |
| `desde` | DATE | — | sí | NULL |
| `hasta` | DATE | — | sí | NULL |
| `evidencia_url` | VARCHAR(255) | — | sí | NULL |
| `declarada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[declaracion_pep.usuario_id → usuario]] |
| `verificada_por` | [[usuario]] | ↗ 01 | sí | [[declaracion_pep.verificada_por → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
