---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: orden_cobro
columna: obligacion_id
destino: obligacion_aporte
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# orden_cobro.obligacion_id → obligacion_aporte

> **[[orden_cobro]]** `.obligacion_id` → **[[obligacion_aporte]]**

| | |
| --- | --- |
| Entidad origen | [[orden_cobro]] (módulo 03) |
| Entidad destino | [[obligacion_aporte]] (módulo 03) |
| Columna | `obligacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cobra con" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
