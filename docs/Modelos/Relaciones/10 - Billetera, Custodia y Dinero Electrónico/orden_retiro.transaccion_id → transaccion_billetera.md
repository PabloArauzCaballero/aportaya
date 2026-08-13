---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: orden_retiro
columna: transaccion_id
destino: transaccion_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# orden_retiro.transaccion_id → transaccion_billetera

> **[[orden_retiro]]** `.transaccion_id` → **[[transaccion_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[orden_retiro]] (módulo 10) |
| Entidad destino | [[transaccion_billetera]] (módulo 10) |
| Columna | `transaccion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
