---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: solicitud_cierre_billetera
columna: cuenta_billetera_id
destino: cuenta_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# solicitud_cierre_billetera.cuenta_billetera_id → cuenta_billetera

> **[[solicitud_cierre_billetera]]** `.cuenta_billetera_id` → **[[cuenta_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_cierre_billetera]] (módulo 10) |
| Entidad destino | [[cuenta_billetera]] (módulo 10) |
| Columna | `cuenta_billetera_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se cierra con" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
