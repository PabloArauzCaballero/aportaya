---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: reporte_operacion_sospechosa
clase: ReporteOperacionSospechosa
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `reporte_operacion_sospechosa`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `ReporteOperacionSospechosa`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `aprobado_por` | UUID | FK | sí | FK, NULL |
| `tipologia` | VARCHAR(60) | — | no | — |
| `monto_total` | DECIMAL(16,2) | — | no | — |
| `periodo_analizado` | VARCHAR(20) | — | no | — |
| `narrativa` | TEXT | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `numero_radicado` | VARCHAR(40) | UQ | sí | UQ, NULL |
| `enviado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por` | [[usuario]] | ↗ 01 | sí | [[reporte_operacion_sospechosa.aprobado_por → usuario]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[reporte_operacion_sospechosa.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[alerta_cumplimiento]] | `reporte_sospechoso_id` | 09 | [[alerta_cumplimiento.reporte_sospechoso_id → reporte_operacion_sospechosa]] |

## Entidades vecinas

[[alerta_cumplimiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
