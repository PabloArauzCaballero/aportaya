---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: orden_cobro
columna: proveedor_id
destino: proveedor_pago
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# orden_cobro.proveedor_id → proveedor_pago

> **[[orden_cobro]]** `.proveedor_id` → **[[proveedor_pago]]**

| | |
| --- | --- |
| Entidad origen | [[orden_cobro]] (módulo 03) |
| Entidad destino | [[proveedor_pago]] (módulo 03) |
| Columna | `proveedor_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "procesa" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
