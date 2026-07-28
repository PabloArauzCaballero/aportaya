---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: enlace_pago_rapido
columna: orden_cobro_id
destino: orden_cobro
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# enlace_pago_rapido.orden_cobro_id → orden_cobro

> **[[enlace_pago_rapido]]** `.orden_cobro_id` → **[[orden_cobro]]**

| | |
| --- | --- |
| Entidad origen | [[enlace_pago_rapido]] (módulo 03) |
| Entidad destino | [[orden_cobro]] (módulo 03) |
| Columna | `orden_cobro_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "difunde" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
