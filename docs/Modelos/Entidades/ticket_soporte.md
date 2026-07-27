---
tags:
  - entidad
  - modulo/09-auditoria-reportes-y-cumplimiento
tabla: ticket_soporte
clase: TicketSoporte
modulo: "09 — Auditoría, Reportes y Cumplimiento"
clave_primaria: [id]
columnas: 13
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `ticket_soporte`

> Módulo [[09_auditoria_reportes|09 — Auditoría, Reportes y Cumplimiento]] · clase `TicketSoporte`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `asignado_a` | UUID | FK IDX | sí | FK, NULL, IDX |
| `categoria` | VARCHAR(40) | — | no | — |
| `asunto` | VARCHAR(160) | — | no | — |
| `descripcion` | TEXT | — | no | — |
| `prioridad` | VARCHAR(10) | — | no | CK |
| `estado` | VARCHAR(20) | IDX | no | CK, IDX |
| `referencia_entidad` | VARCHAR(40) | — | sí | NULL |
| `referencia_id` | UUID | — | sí | NULL |
| `sla_horas` | SMALLINT | — | no | — |
| `abierto_en` | TIMESTAMPTZ | — | no | — |
| `resuelto_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `asignado_a` | [[usuario]] | ↗ 01 | sí | [[ticket_soporte.asignado_a → usuario]] |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[ticket_soporte.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[09_auditoria_reportes]]
- Diagramas: `docs/entidades/09_auditoria_reportes.puml`
- Índice: [[_Entidades]] · [[Index]]
