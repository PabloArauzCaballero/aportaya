---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: consumo_limite
columna: cuenta_billetera_id
destino: cuenta_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# consumo_limite.cuenta_billetera_id → cuenta_billetera

> **[[consumo_limite]]** `.cuenta_billetera_id` → **[[cuenta_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[consumo_limite]] (módulo 10) |
| Entidad destino | [[cuenta_billetera]] (módulo 10) |
| Columna | `cuenta_billetera_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "consume limite" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
