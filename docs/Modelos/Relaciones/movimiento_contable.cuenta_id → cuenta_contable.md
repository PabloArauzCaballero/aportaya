---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: movimiento_contable
columna: cuenta_id
destino: cuenta_contable
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# movimiento_contable.cuenta_id → cuenta_contable

> **[[movimiento_contable]]** `.cuenta_id` → **[[cuenta_contable]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_contable]] (módulo 03) |
| Entidad destino | [[cuenta_contable]] (módulo 03) |
| Columna | `cuenta_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "afecta" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
