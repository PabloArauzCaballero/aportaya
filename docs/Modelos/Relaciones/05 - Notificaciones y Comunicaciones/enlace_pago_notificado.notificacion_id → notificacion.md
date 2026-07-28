---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: enlace_pago_notificado
columna: notificacion_id
destino: notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# enlace_pago_notificado.notificacion_id → notificacion

> **[[enlace_pago_notificado]]** `.notificacion_id` → **[[notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[enlace_pago_notificado]] (módulo 05) |
| Entidad destino | [[notificacion]] (módulo 05) |
| Columna | `notificacion_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "adjunta" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
