---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: asiento_contable
columna: asiento_reversa_id
destino: asiento_contable
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# asiento_contable.asiento_reversa_id → asiento_contable

> **[[asiento_contable]]** `.asiento_reversa_id` → **[[asiento_contable]]**

| | |
| --- | --- |
| Entidad origen | [[asiento_contable]] (módulo 03) |
| Entidad destino | [[asiento_contable]] (módulo 03) |
| Columna | `asiento_reversa_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
