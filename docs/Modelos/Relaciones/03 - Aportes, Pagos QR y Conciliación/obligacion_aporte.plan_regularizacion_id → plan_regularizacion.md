---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: obligacion_aporte
columna: plan_regularizacion_id
destino: plan_regularizacion
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# obligacion_aporte.plan_regularizacion_id → plan_regularizacion

> **[[obligacion_aporte]]** `.plan_regularizacion_id` → **[[plan_regularizacion]]**

| | |
| --- | --- |
| Entidad origen | [[obligacion_aporte]] (módulo 03) |
| Entidad destino | [[plan_regularizacion]] (módulo 03) |
| Columna | `plan_regularizacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "reprograma" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
