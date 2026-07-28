---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: confirmacion_recepcion
columna: entrega_id
destino: entrega_fondo
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno"
---

# confirmacion_recepcion.entrega_id → entrega_fondo

> **[[confirmacion_recepcion]]** `.entrega_id` → **[[entrega_fondo]]**

| | |
| --- | --- |
| Entidad origen | [[confirmacion_recepcion]] (módulo 04) |
| Entidad destino | [[entrega_fondo]] (módulo 04) |
| Columna | `entrega_id` — UUID |
| Cardinalidad | uno a uno |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "espera" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
