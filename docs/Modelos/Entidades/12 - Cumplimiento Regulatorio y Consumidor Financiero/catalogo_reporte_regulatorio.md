---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: catalogo_reporte_regulatorio
clase: CatalogoReporteRegulatorio
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `catalogo_reporte_regulatorio`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `CatalogoReporteRegulatorio` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `organismo` | VARCHAR(10) | IDX | no | CK, IDX |
| `nombre` | VARCHAR(120) | — | no | — |
| `periodicidad` | VARCHAR(12) | — | no | CK |
| `formato` | VARCHAR(15) | — | no | CK |
| `plazo_dias` | SMALLINT | — | no | — |
| `base_normativa` | VARCHAR(120) | — | no | — |
| `obligatorio` | BOOLEAN | — | no | — |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[reporte_regulatorio]] | `catalogo_reporte_id` | 12 | [[reporte_regulatorio.catalogo_reporte_id → catalogo_reporte_regulatorio]] |

## Entidades vecinas

[[reporte_regulatorio]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
