---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: webhook_pasarela
columna: proveedor_id
destino: proveedor_pago
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# webhook_pasarela.proveedor_id → proveedor_pago

> **[[webhook_pasarela]]** `.proveedor_id` → **[[proveedor_pago]]**

| | |
| --- | --- |
| Entidad origen | [[webhook_pasarela]] (módulo 03) |
| Entidad destino | [[proveedor_pago]] (módulo 03) |
| Columna | `proveedor_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "notifica" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
