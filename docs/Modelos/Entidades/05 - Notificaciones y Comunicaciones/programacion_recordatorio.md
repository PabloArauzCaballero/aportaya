---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: programacion_recordatorio
clase: ProgramacionRecordatorio
modulo: "05 — Notificaciones y Comunicaciones"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `programacion_recordatorio`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `ProgramacionRecordatorio` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `evento_id` | UUID | FK | no | FK |
| `desfase_dias` | SMALLINT | — | no | — |
| `hora_envio` | TIME | — | no | — |
| `repetir_cada` | SMALLINT | — | sí | NULL |
| `max_repeticiones` | SMALLINT | — | no | — |
| `condicion` | VARCHAR(200) | — | no | — |
| `activa` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `evento_id` | [[evento_notificable]] | 05 | no | [[programacion_recordatorio.evento_id → evento_notificable]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[programacion_recordatorio.grupo_id → grupo]] |

## Entidades vecinas

[[evento_notificable]] · [[grupo]]

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
