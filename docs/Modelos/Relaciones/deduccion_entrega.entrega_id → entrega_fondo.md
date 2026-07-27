---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: deduccion_entrega
columna: entrega_id
destino: entrega_fondo
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# deduccion_entrega.entrega_id → entrega_fondo

> **[[deduccion_entrega]]** `.entrega_id` → **[[entrega_fondo]]**

| | |
| --- | --- |
| Entidad origen | [[deduccion_entrega]] (módulo 04) |
| Entidad destino | [[entrega_fondo]] (módulo 04) |
| Columna | `entrega_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "descuenta" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
