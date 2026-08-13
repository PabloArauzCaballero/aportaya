---
tags:
  - relacion
  - fk
  - modulo/02-grupos-cupos-turnos-y-gobernanza
  - cross-modulo
origen: solicitud_retiro
columna: plan_regularizacion_id
destino: plan_regularizacion
modulo_origen: "02"
modulo_destino: "03"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# solicitud_retiro.plan_regularizacion_id → plan_regularizacion

> **[[solicitud_retiro]]** `.plan_regularizacion_id` → **[[plan_regularizacion]]**

| | |
| --- | --- |
| Entidad origen | [[solicitud_retiro]] (módulo 02) |
| Entidad destino | [[plan_regularizacion]] (módulo 03) |
| Columna | `plan_regularizacion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 02 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[02_grupos_turnos]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
