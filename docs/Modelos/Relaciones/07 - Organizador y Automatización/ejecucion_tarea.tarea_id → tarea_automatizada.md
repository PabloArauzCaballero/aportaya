---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: ejecucion_tarea
columna: tarea_id
destino: tarea_automatizada
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# ejecucion_tarea.tarea_id → tarea_automatizada

> **[[ejecucion_tarea]]** `.tarea_id` → **[[tarea_automatizada]]**

| | |
| --- | --- |
| Entidad origen | [[ejecucion_tarea]] (módulo 07) |
| Entidad destino | [[tarea_automatizada]] (módulo 07) |
| Columna | `tarea_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se ejecuta en" |

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
