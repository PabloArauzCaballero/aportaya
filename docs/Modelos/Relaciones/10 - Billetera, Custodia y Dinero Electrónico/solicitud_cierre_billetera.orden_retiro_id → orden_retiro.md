---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: solicitud_cierre_billetera
columna: orden_retiro_id
destino: orden_retiro
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# solicitud_cierre_billetera.orden_retiro_id → orden_retiro

> **[[solicitud_cierre_billetera]]** `.orden_retiro_id` → **[[orden_retiro]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_cierre_billetera]] (módulo 10) |
| Entidad destino | [[orden_retiro]] (módulo 10) |
| Columna | `orden_retiro_id` — UUID |
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
