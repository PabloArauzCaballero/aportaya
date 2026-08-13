---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: obligacion_aporte
columna: obligacion_origen_id
destino: obligacion_aporte
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos, origen opcional"
---

# obligacion_aporte.obligacion_origen_id → obligacion_aporte

> **[[obligacion_aporte]]** `.obligacion_origen_id` → **[[obligacion_aporte]]**

| | |
| --- | --- |
| Entidad origen | [[obligacion_aporte]] (módulo 03) |
| Entidad destino | [[obligacion_aporte]] (módulo 03) |
| Columna | `obligacion_origen_id` — UUID |
| Cardinalidad | uno a muchos, origen opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recargo de" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
