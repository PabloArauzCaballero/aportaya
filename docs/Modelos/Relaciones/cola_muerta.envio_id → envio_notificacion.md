---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: cola_muerta
columna: envio_id
destino: envio_notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# cola_muerta.envio_id → envio_notificacion

> **[[cola_muerta]]** `.envio_id` → **[[envio_notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[cola_muerta]] (módulo 05) |
| Entidad destino | [[envio_notificacion]] (módulo 05) |
| Columna | `envio_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cae en" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
