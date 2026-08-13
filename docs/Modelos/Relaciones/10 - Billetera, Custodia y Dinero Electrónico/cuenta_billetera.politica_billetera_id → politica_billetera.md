---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: cuenta_billetera
columna: politica_billetera_id
destino: politica_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# cuenta_billetera.politica_billetera_id → politica_billetera

> **[[cuenta_billetera]]** `.politica_billetera_id` → **[[politica_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_billetera]] (módulo 10) |
| Entidad destino | [[politica_billetera]] (módulo 10) |
| Columna | `politica_billetera_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "parametriza" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
