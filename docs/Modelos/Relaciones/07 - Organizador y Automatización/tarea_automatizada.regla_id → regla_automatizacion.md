---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: tarea_automatizada
columna: regla_id
destino: regla_automatizacion
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# tarea_automatizada.regla_id → regla_automatizacion

> **[[tarea_automatizada]]** `.regla_id` → **[[regla_automatizacion]]**

| | |
| --- | --- |
| Entidad origen | [[tarea_automatizada]] (módulo 07) |
| Entidad destino | [[regla_automatizacion]] (módulo 07) |
| Columna | `regla_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "programa" |

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
