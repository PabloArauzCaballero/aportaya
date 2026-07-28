---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: validacion_pre_entrega
columna: regla_id
destino: regla_entrega
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# validacion_pre_entrega.regla_id → regla_entrega

> **[[validacion_pre_entrega]]** `.regla_id` → **[[regla_entrega]]**

| | |
| --- | --- |
| Entidad origen | [[validacion_pre_entrega]] (módulo 04) |
| Entidad destino | [[regla_entrega]] (módulo 04) |
| Columna | `regla_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "instancia" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
