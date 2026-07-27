---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
origen: version_plantilla
columna: plantilla_id
destino: plantilla_mensaje
modulo_origen: "05"
modulo_destino: "05"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# version_plantilla.plantilla_id → plantilla_mensaje

> **[[version_plantilla]]** `.plantilla_id` → **[[plantilla_mensaje]]**

| | |
| --- | --- |
| Entidad origen | [[version_plantilla]] (módulo 05) |
| Entidad destino | [[plantilla_mensaje]] (módulo 05) |
| Columna | `plantilla_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "versiona" |

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[05_notificaciones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
