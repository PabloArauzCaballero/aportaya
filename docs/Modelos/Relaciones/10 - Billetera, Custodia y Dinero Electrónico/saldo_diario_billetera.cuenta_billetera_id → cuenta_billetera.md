---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: saldo_diario_billetera
columna: cuenta_billetera_id
destino: cuenta_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# saldo_diario_billetera.cuenta_billetera_id → cuenta_billetera

> **[[saldo_diario_billetera]]** `.cuenta_billetera_id` → **[[cuenta_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[saldo_diario_billetera]] (módulo 10) |
| Entidad destino | [[cuenta_billetera]] (módulo 10) |
| Columna | `cuenta_billetera_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cierra el dia como" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
