---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: cuenta_contable
columna: grupo_id
destino: grupo
modulo_origen: "03"
modulo_destino: "02"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# cuenta_contable.grupo_id → grupo

> **[[cuenta_contable]]** `.grupo_id` → **[[grupo]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_contable]] (módulo 03) |
| Entidad destino | [[grupo]] (módulo 02) |
| Columna | `grupo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 03 con el 02. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[02_grupos_turnos]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
