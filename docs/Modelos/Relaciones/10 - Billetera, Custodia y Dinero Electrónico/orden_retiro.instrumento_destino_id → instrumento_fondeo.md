---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: orden_retiro
columna: instrumento_destino_id
destino: instrumento_fondeo
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# orden_retiro.instrumento_destino_id → instrumento_fondeo

> **[[orden_retiro]]** `.instrumento_destino_id` → **[[instrumento_fondeo]]**

| | |
| --- | --- |
| Entidad origen | [[orden_retiro]] (módulo 10) |
| Entidad destino | [[instrumento_fondeo]] (módulo 10) |
| Columna | `instrumento_destino_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "paga hacia" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
