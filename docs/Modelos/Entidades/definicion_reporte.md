---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: definicion_reporte
clase: DefinicionReporte
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 11
fk_salientes: 0
fk_entrantes: 2
append_only: false
---

# `definicion_reporte`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `DefinicionReporte`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(40) | — | no | CK |
| `nombre` | VARCHAR(80) | UQ | no | UQ |
| `descripcion` | VARCHAR(300) | — | no | — |
| `consulta_base` | TEXT | — | no | — |
| `parametros_esperados` | JSONB | — | no | — |
| `columnas` | JSONB | — | no | — |
| `permiso_requerido` | VARCHAR(60) | — | no | — |
| `contiene_datos_sensibles` | BOOLEAN | — | no | — |
| `cache_minutos` | SMALLINT | — | no | — |
| `activa` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[ejecucion_reporte]] | `definicion_id` | 09 | [[ejecucion_reporte.definicion_id → definicion_reporte]] |
| [[programacion_reporte]] | `definicion_id` | 09 | [[programacion_reporte.definicion_id → definicion_reporte]] |

## Entidades vecinas

[[ejecucion_reporte]] · [[programacion_reporte]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
