---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: movimiento_contable
columna: asiento_id
destino: asiento_contable
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# movimiento_contable.asiento_id → asiento_contable

> **[[movimiento_contable]]** `.asiento_id` → **[[asiento_contable]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_contable]] (módulo 03) |
| Entidad destino | [[asiento_contable]] (módulo 03) |
| Columna | `asiento_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detalla" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
