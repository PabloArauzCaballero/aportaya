---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: intento_pago
columna: orden_cobro_id
destino: orden_cobro
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# intento_pago.orden_cobro_id → orden_cobro

> **[[intento_pago]]** `.orden_cobro_id` → **[[orden_cobro]]**

| | |
| --- | --- |
| Entidad origen | [[intento_pago]] (módulo 03) |
| Entidad destino | [[orden_cobro]] (módulo 03) |
| Columna | `orden_cobro_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "acumula" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
