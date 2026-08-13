---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: evento_notificable
clase: EventoNotificable
modulo: "05 — Notificaciones y Comunicaciones"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 12
fk_salientes: 0
fk_entrantes: 3
append_only: false
---

# `evento_notificable`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `EventoNotificable` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(200) | — | no | — |
| `categoria` | VARCHAR(20) | IDX | no | CK, IDX |
| `es_obligatorio` | BOOLEAN | — | no | — |
| `prioridad` | VARCHAR(10) | — | no | CK |
| `es_transaccional` | BOOLEAN | — | no | — |
| `permite_agrupacion` | BOOLEAN | — | no | — |
| `ventana_deduplicacion_min` | SMALLINT | — | no | — |
| `canales_permitidos` | VARCHAR(120) | — | no | — |
| `cadena_respaldo` | VARCHAR(120) | — | no | — |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[notificacion]] | `evento_id` | 05 | [[notificacion.evento_id → evento_notificable]] |
| [[plantilla_mensaje]] | `evento_id` | 05 | [[plantilla_mensaje.evento_id → evento_notificable]] |
| [[programacion_recordatorio]] | `evento_id` | 05 | [[programacion_recordatorio.evento_id → evento_notificable]] |

## Entidades vecinas

[[notificacion]] · [[plantilla_mensaje]] · [[programacion_recordatorio]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
