---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: validacion_pre_entrega
columna: entrega_id
destino: entrega_fondo
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# validacion_pre_entrega.entrega_id → entrega_fondo

> **[[validacion_pre_entrega]]** `.entrega_id` → **[[entrega_fondo]]**

| | |
| --- | --- |
| Entidad origen | [[validacion_pre_entrega]] (módulo 04) |
| Entidad destino | [[entrega_fondo]] (módulo 04) |
| Columna | `entrega_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "valida con" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
