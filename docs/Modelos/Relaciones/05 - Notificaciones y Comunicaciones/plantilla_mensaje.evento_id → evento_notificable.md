---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: plantilla_mensaje
columna: evento_id
destino: evento_notificable
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# plantilla_mensaje.evento_id → evento_notificable

> **[[plantilla_mensaje]]** `.evento_id` → **[[evento_notificable]]**

| | |
| --- | --- |
| Entidad origen | [[plantilla_mensaje]] (módulo 05) |
| Entidad destino | [[evento_notificable]] (módulo 05) |
| Columna | `evento_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se comunica con" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
