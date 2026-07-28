---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: obligacion_aporte
columna: periodo_id
destino: periodo
modulo_origen: "03"
modulo_destino: "02"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# obligacion_aporte.periodo_id → periodo

> **[[obligacion_aporte]]** `.periodo_id` → **[[periodo]]**

| | |
| --- | --- |
| Entidad origen | [[obligacion_aporte]] (módulo 03) |
| Entidad destino | [[periodo]] (módulo 02) |
| Columna | `periodo_id` — UUID |
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
