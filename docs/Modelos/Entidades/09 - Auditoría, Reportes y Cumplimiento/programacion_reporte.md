---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: programacion_reporte
clase: ProgramacionReporte
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `programacion_reporte`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `ProgramacionReporte`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `definicion_id` | UUID | FK IDX | no | FK, IDX |
| `expresion_cron` | VARCHAR(40) | — | no | — |
| `parametros_fijos` | JSONB | — | no | — |
| `destinatarios` | JSONB | — | no | — |
| `canal_entrega` | VARCHAR(20) | — | no | CK |
| `formato` | VARCHAR(10) | — | no | CK |
| `activa` | BOOLEAN | — | no | — |
| `ultima_ejecucion_en` | TIMESTAMPTZ | — | sí | NULL |
| `proxima_ejecucion_en` | TIMESTAMPTZ | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `definicion_id` | [[definicion_reporte]] | 09 | no | [[programacion_reporte.definicion_id → definicion_reporte]] |

## Entidades vecinas

[[definicion_reporte]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
