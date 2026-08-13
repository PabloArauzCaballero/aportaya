---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: cargo_comision
columna: obligacion_id
destino: obligacion_aporte
modulo_origen: "11"
modulo_destino: "03"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# cargo_comision.obligacion_id → obligacion_aporte

> **[[cargo_comision]]** `.obligacion_id` → **[[obligacion_aporte]]**

| | |
| --- | --- |
| Entidad origen | [[cargo_comision]] (módulo 11) |
| Entidad destino | [[obligacion_aporte]] (módulo 03) |
| Columna | `obligacion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
