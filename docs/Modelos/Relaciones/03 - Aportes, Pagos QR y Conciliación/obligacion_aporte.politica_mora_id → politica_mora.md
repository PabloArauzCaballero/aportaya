---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: obligacion_aporte
columna: politica_mora_id
destino: politica_mora
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# obligacion_aporte.politica_mora_id → politica_mora

> **[[obligacion_aporte]]** `.politica_mora_id` → **[[politica_mora]]**

| | |
| --- | --- |
| Entidad origen | [[obligacion_aporte]] (módulo 03) |
| Entidad destino | [[politica_mora]] (módulo 03) |
| Columna | `politica_mora_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "rige" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
