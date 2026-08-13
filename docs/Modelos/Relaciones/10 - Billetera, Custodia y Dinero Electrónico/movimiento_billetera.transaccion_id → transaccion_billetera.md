---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: movimiento_billetera
columna: transaccion_id
destino: transaccion_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# movimiento_billetera.transaccion_id → transaccion_billetera

> **[[movimiento_billetera]]** `.transaccion_id` → **[[transaccion_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_billetera]] (módulo 10) |
| Entidad destino | [[transaccion_billetera]] (módulo 10) |
| Columna | `transaccion_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detalla" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
