---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
  - append-only
tabla: evento_dominio
clase: EventoDominio
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 13
fk_salientes: 0
fk_entrantes: 0
append_only: true
---

# `evento_dominio`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `EventoDominio` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(60) | IDX | no | IDX |
| `version` | VARCHAR(10) | — | no | — |
| `agregado` | VARCHAR(40) | — | no | — |
| `agregado_id` | UUID | IDX | no | IDX |
| `payload` | JSONB | — | no | — |
| `metadatos` | JSONB | — | no | — |
| `correlation_id` | UUID | IDX | no | IDX |
| `causation_id` | UUID | — | sí | NULL |
| `ocurrido_en` | TIMESTAMPTZ | IDX | no | IDX |
| `publicado_en` | TIMESTAMPTZ | — | sí | NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `intentos` | SMALLINT | — | no | — |

## Notas del modelo

> **Outbox transaccional**
> Indice parcial de despacho:
> CREATE INDEX ON evento_dominio (ocurrido_en)
> WHERE estado = 'PENDIENTE';
> Consumidores: reputacion (M6), notificaciones
> (M5), metricas (M6/M9) y cumplimiento (este modulo).

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
