---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: envio_notificacion
columna: version_plantilla_id
destino: version_plantilla
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# envio_notificacion.version_plantilla_id → version_plantilla

> **[[envio_notificacion]]** `.version_plantilla_id` → **[[version_plantilla]]**

| | |
| --- | --- |
| Entidad origen | [[envio_notificacion]] (módulo 05) |
| Entidad destino | [[version_plantilla]] (módulo 05) |
| Columna | `version_plantilla_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "formatea" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
