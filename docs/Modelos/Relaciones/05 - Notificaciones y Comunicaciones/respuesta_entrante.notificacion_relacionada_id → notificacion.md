---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: respuesta_entrante
columna: notificacion_relacionada_id
destino: notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# respuesta_entrante.notificacion_relacionada_id → notificacion

> **[[respuesta_entrante]]** `.notificacion_relacionada_id` → **[[notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[respuesta_entrante]] (módulo 05) |
| Entidad destino | [[notificacion]] (módulo 05) |
| Columna | `notificacion_relacionada_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "provoca" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
