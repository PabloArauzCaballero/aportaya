---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: orden_recarga
columna: instrumento_fondeo_id
destino: instrumento_fondeo
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# orden_recarga.instrumento_fondeo_id → instrumento_fondeo

> **[[orden_recarga]]** `.instrumento_fondeo_id` → **[[instrumento_fondeo]]**

| | |
| --- | --- |
| Entidad origen | [[orden_recarga]] (módulo 10) |
| Entidad destino | [[instrumento_fondeo]] (módulo 10) |
| Columna | `instrumento_fondeo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "acredita desde" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
