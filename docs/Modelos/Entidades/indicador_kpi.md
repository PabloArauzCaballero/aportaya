---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: indicador_kpi
clase: IndicadorKPI
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 11
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `indicador_kpi`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `IndicadorKPI`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ+dimension+dimension_id+periodo |
| `nombre` | VARCHAR(80) | — | no | — |
| `valor` | DECIMAL(16,4) | — | no | — |
| `unidad` | VARCHAR(15) | — | no | — |
| `dimension` | VARCHAR(20) | — | no | CK |
| `dimension_id` | UUID | — | sí | NULL |
| `periodo` | VARCHAR(10) | — | no | — |
| `meta` | DECIMAL(16,4) | — | sí | NULL |
| `variacion_periodo_anterior` | DECIMAL(8,4) | — | sí | NULL |
| `calculado_en` | TIMESTAMPTZ | — | no | — |

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
