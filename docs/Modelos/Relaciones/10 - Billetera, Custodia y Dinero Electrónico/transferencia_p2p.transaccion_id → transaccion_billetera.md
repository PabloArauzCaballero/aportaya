---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: transferencia_p2p
columna: transaccion_id
destino: transaccion_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# transferencia_p2p.transaccion_id → transaccion_billetera

> **[[transferencia_p2p]]** `.transaccion_id` → **[[transaccion_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[transferencia_p2p]] (módulo 10) |
| Entidad destino | [[transaccion_billetera]] (módulo 10) |
| Columna | `transaccion_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "materializa" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
