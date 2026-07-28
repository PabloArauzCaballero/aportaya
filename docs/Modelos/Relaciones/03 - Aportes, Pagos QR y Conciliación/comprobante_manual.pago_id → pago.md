---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: comprobante_manual
columna: pago_id
destino: pago
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# comprobante_manual.pago_id → pago

> **[[comprobante_manual]]** `.pago_id` → **[[pago]]**

| | |
| --- | --- |
| Entidad origen | [[comprobante_manual]] (módulo 03) |
| Entidad destino | [[pago]] (módulo 03) |
| Columna | `pago_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "respalda (manual)" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
