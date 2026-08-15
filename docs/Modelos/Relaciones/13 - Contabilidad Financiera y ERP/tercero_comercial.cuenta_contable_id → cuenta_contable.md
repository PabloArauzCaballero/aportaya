---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
  - cross-modulo
origen: tercero_comercial
columna: cuenta_contable_id
destino: cuenta_contable
modulo_origen: "13"
modulo_destino: "03"
cross_modulo: true
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# tercero_comercial.cuenta_contable_id → cuenta_contable

> **[[tercero_comercial]]** `.cuenta_contable_id` → **[[cuenta_contable]]**

| | |
| --- | --- |
| Entidad origen | [[tercero_comercial]] (módulo 13) |
| Entidad destino | [[cuenta_contable]] (módulo 03) |
| Columna | `cuenta_contable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 13 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
