---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: bloqueo_saldo
columna: retencion_id
destino: retencion_saldo
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# bloqueo_saldo.retencion_id → retencion_saldo

> **[[bloqueo_saldo]]** `.retencion_id` → **[[retencion_saldo]]**

| | |
| --- | --- |
| Entidad origen | [[bloqueo_saldo]] (módulo 10) |
| Entidad destino | [[retencion_saldo]] (módulo 10) |
| Columna | `retencion_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se aplica como" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
