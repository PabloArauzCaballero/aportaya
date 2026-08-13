---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: prueba_control
columna: control_id
destino: control_interno
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# prueba_control.control_id → control_interno

> **[[prueba_control]]** `.control_id` → **[[control_interno]]**

| | |
| --- | --- |
| Entidad origen | [[prueba_control]] (módulo 12) |
| Entidad destino | [[control_interno]] (módulo 12) |
| Columna | `control_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se prueba con" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
