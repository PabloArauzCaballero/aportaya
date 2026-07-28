---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: movimiento_bancario
columna: extracto_id
destino: extracto_bancario
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# movimiento_bancario.extracto_id → extracto_bancario

> **[[movimiento_bancario]]** `.extracto_id` → **[[extracto_bancario]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_bancario]] (módulo 03) |
| Entidad destino | [[extracto_bancario]] (módulo 03) |
| Columna | `extracto_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "contiene" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
