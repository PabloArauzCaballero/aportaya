---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: alerta_cumplimiento
clase: AlertaCumplimiento
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 15
fk_salientes: 5
fk_entrantes: 0
append_only: false
---

# `alerta_cumplimiento`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `AlertaCumplimiento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `regla_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `analista_id` | UUID | FK | sí | FK, NULL |
| `reporte_sospechoso_id` | UUID | FK | sí | FK, NULL |
| `operacion_tipo` | VARCHAR(30) | — | no | — |
| `operacion_id` | UUID | IDX | no | IDX |
| `monto_involucrado` | DECIMAL(16,2) | — | no | — |
| `detalle_deteccion` | JSONB | — | no | — |
| `severidad` | VARCHAR(10) | — | no | CK |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `conclusion` | VARCHAR(500) | — | sí | NULL |
| `detectada_en` | TIMESTAMPTZ | IDX | no | IDX |
| `resuelta_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `analista_id` | [[usuario]] | ↗ 01 | sí | [[alerta_cumplimiento.analista_id → usuario]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[alerta_cumplimiento.grupo_id → grupo]] |
| `regla_id` | [[regla_cumplimiento]] | 09 | no | [[alerta_cumplimiento.regla_id → regla_cumplimiento]] |
| `reporte_sospechoso_id` | [[reporte_operacion_sospechosa]] | 09 | sí | [[alerta_cumplimiento.reporte_sospechoso_id → reporte_operacion_sospechosa]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[alerta_cumplimiento.usuario_id → usuario]] |

## Entidades vecinas

[[grupo]] · [[regla_cumplimiento]] · [[reporte_operacion_sospechosa]] · [[usuario]]

## Notas del modelo

> operacion_id es polimorfica: pago.id (M3),
> entrega_fondo.id (M4), cobertura.id (M8).
> Varias alertas se agrupan en un unico
> reporte_operacion_sospechosa antes de
> remitirse a la autoridad competente.

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
