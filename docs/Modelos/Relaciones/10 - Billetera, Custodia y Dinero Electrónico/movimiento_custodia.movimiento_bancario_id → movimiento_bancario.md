---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
  - cross-modulo
origen: movimiento_custodia
columna: movimiento_bancario_id
destino: movimiento_bancario
modulo_origen: "10"
modulo_destino: "03"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# movimiento_custodia.movimiento_bancario_id → movimiento_bancario

> **[[movimiento_custodia]]** `.movimiento_bancario_id` → **[[movimiento_bancario]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_custodia]] (módulo 10) |
| Entidad destino | [[movimiento_bancario]] (módulo 03) |
| Columna | `movimiento_bancario_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 10 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
