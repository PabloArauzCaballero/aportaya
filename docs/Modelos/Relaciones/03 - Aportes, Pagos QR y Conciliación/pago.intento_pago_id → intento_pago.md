---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: pago
columna: intento_pago_id
destino: intento_pago
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# pago.intento_pago_id → intento_pago

> **[[pago]]** `.intento_pago_id` → **[[intento_pago]]**

| | |
| --- | --- |
| Entidad origen | [[pago]] (módulo 03) |
| Entidad destino | [[intento_pago]] (módulo 03) |
| Columna | `intento_pago_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "produce" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
