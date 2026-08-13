---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: conciliacion
columna: pago_id
destino: pago
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# conciliacion.pago_id → pago

> **[[conciliacion]]** `.pago_id` → **[[pago]]**

| | |
| --- | --- |
| Entidad origen | [[conciliacion]] (módulo 03) |
| Entidad destino | [[pago]] (módulo 03) |
| Columna | `pago_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "concilia" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
