---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: envio_notificacion
columna: notificacion_id
destino: notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# envio_notificacion.notificacion_id → notificacion

> **[[envio_notificacion]]** `.notificacion_id` → **[[notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[envio_notificacion]] (módulo 05) |
| Entidad destino | [[notificacion]] (módulo 05) |
| Columna | `notificacion_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "despacha" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
