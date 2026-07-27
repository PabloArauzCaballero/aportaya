---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: plan_regularizacion
columna: participante_id
destino: participante
modulo_origen: "03"
modulo_destino: "02"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# plan_regularizacion.participante_id → participante

> **[[plan_regularizacion]]** `.participante_id` → **[[participante]]**

| | |
| --- | --- |
| Entidad origen | [[plan_regularizacion]] (módulo 03) |
| Entidad destino | [[participante]] (módulo 02) |
| Columna | `participante_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 03 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
