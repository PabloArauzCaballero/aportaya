---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
origen: cuenta_contable
columna: cuenta_padre_id
destino: cuenta_contable
modulo_origen: "03"
modulo_destino: "03"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos, origen opcional"
---

# cuenta_contable.cuenta_padre_id → cuenta_contable

> **[[cuenta_contable]]** `.cuenta_padre_id` → **[[cuenta_contable]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_contable]] (módulo 03) |
| Entidad destino | [[cuenta_contable]] (módulo 03) |
| Columna | `cuenta_padre_id` — UUID |
| Cardinalidad | uno a muchos, origen opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "agrupa (plan de cuentas)" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
