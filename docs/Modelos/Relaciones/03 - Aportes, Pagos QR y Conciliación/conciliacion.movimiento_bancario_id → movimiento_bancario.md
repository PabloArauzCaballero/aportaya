---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: conciliacion
columna: movimiento_bancario_id
destino: movimiento_bancario
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# conciliacion.movimiento_bancario_id → movimiento_bancario

> **[[conciliacion]]** `.movimiento_bancario_id` → **[[movimiento_bancario]]**

| | |
| --- | --- |
| Entidad origen | [[conciliacion]] (módulo 03) |
| Entidad destino | [[movimiento_bancario]] (módulo 03) |
| Columna | `movimiento_bancario_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "cruza con" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
