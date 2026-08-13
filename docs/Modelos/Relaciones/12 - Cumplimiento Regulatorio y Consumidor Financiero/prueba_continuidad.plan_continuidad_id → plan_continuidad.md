---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: prueba_continuidad
columna: plan_continuidad_id
destino: plan_continuidad
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# prueba_continuidad.plan_continuidad_id → plan_continuidad

> **[[prueba_continuidad]]** `.plan_continuidad_id` → **[[plan_continuidad]]**

| | |
| --- | --- |
| Entidad origen | [[prueba_continuidad]] (módulo 12) |
| Entidad destino | [[plan_continuidad]] (módulo 12) |
| Columna | `plan_continuidad_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se prueba con" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
