---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: orden_retiro
columna: retencion_id
destino: retencion_saldo
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# orden_retiro.retencion_id → retencion_saldo

> **[[orden_retiro]]** `.retencion_id` → **[[retencion_saldo]]**

| | |
| --- | --- |
| Entidad origen | [[orden_retiro]] (módulo 10) |
| Entidad destino | [[retencion_saldo]] (módulo 10) |
| Columna | `retencion_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "reserva con" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
