---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: cola_envio
columna: envio_id
destino: envio_notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# cola_envio.envio_id → envio_notificacion

> **[[cola_envio]]** `.envio_id` → **[[envio_notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[cola_envio]] (módulo 05) |
| Entidad destino | [[envio_notificacion]] (módulo 05) |
| Columna | `envio_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "espera en" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
