---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: envio_notificacion
columna: proveedor_id
destino: proveedor_mensajeria
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# envio_notificacion.proveedor_id → proveedor_mensajeria

> **[[envio_notificacion]]** `.proveedor_id` → **[[proveedor_mensajeria]]**

| | |
| --- | --- |
| Entidad origen | [[envio_notificacion]] (módulo 05) |
| Entidad destino | [[proveedor_mensajeria]] (módulo 05) |
| Columna | `proveedor_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "transporta" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
