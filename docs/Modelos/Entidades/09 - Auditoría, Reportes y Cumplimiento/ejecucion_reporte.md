---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: ejecucion_reporte
clase: EjecucionReporte
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 1
append_only: false
---

# `ejecucion_reporte`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `EjecucionReporte`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `definicion_id` | UUID | FK IDX | no | FK, IDX |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `solicitado_por` | UUID | FK IDX | no | FK, IDX |
| `parametros` | JSONB | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `filas_generadas` | INTEGER | — | no | — |
| `duracion_ms` | INTEGER | — | no | — |
| `hash_resultado` | VARCHAR(64) | — | sí | NULL |
| `mensaje_error` | TEXT | — | sí | NULL |
| `iniciada_en` | TIMESTAMPTZ | — | no | — |
| `finalizada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `definicion_id` | [[definicion_reporte]] | 09 | no | [[ejecucion_reporte.definicion_id → definicion_reporte]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[ejecucion_reporte.grupo_id → grupo]] |
| `solicitado_por` | [[usuario]] | ↗ 01 | no | [[ejecucion_reporte.solicitado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[exportacion_reporte]] | `ejecucion_id` | 09 | [[exportacion_reporte.ejecucion_id → ejecucion_reporte]] |

## Entidades vecinas

[[definicion_reporte]] · [[exportacion_reporte]] · [[grupo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
