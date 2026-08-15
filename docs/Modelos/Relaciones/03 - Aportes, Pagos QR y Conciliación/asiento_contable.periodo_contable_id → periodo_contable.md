---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: asiento_contable
columna: periodo_contable_id
destino: periodo_contable
modulo_origen: "03"
modulo_destino: "13"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# asiento_contable.periodo_contable_id → periodo_contable

> **[[asiento_contable]]** `.periodo_contable_id` → **[[periodo_contable]]**

| | |
| --- | --- |
| Entidad origen | [[asiento_contable]] (módulo 03) |
| Entidad destino | [[periodo_contable]] (módulo 13) |
| Columna | `periodo_contable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 03 con el 13. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
