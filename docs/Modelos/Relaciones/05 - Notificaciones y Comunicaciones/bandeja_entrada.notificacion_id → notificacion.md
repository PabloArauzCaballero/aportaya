---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: bandeja_entrada
columna: notificacion_id
destino: notificacion
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# bandeja_entrada.notificacion_id → notificacion

> **[[bandeja_entrada]]** `.notificacion_id` → **[[notificacion]]**

| | |
| --- | --- |
| Entidad origen | [[bandeja_entrada]] (módulo 05) |
| Entidad destino | [[notificacion]] (módulo 05) |
| Columna | `notificacion_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "espeja en" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
