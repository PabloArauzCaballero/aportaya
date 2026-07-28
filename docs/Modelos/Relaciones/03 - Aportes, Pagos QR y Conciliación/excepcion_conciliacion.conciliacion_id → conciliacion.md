---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: excepcion_conciliacion
columna: conciliacion_id
destino: conciliacion
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# excepcion_conciliacion.conciliacion_id → conciliacion

> **[[excepcion_conciliacion]]** `.conciliacion_id` → **[[conciliacion]]**

| | |
| --- | --- |
| Entidad origen | [[excepcion_conciliacion]] (módulo 03) |
| Entidad destino | [[conciliacion]] (módulo 03) |
| Columna | `conciliacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "levanta" |

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
