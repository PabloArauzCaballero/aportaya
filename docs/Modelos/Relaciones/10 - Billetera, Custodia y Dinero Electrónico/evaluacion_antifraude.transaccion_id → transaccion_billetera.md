---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: evaluacion_antifraude
columna: transaccion_id
destino: transaccion_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# evaluacion_antifraude.transaccion_id → transaccion_billetera

> **[[evaluacion_antifraude]]** `.transaccion_id` → **[[transaccion_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[evaluacion_antifraude]] (módulo 10) |
| Entidad destino | [[transaccion_billetera]] (módulo 10) |
| Columna | `transaccion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se evalua en" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
