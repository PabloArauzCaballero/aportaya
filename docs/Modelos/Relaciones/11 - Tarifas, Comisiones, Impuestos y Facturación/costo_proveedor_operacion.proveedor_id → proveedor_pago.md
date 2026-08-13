---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
  - cross-modulo
origen: costo_proveedor_operacion
columna: proveedor_id
destino: proveedor_pago
modulo_origen: "11"
modulo_destino: "03"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# costo_proveedor_operacion.proveedor_id → proveedor_pago

> **[[costo_proveedor_operacion]]** `.proveedor_id` → **[[proveedor_pago]]**

| | |
| --- | --- |
| Entidad origen | [[costo_proveedor_operacion]] (módulo 11) |
| Entidad destino | [[proveedor_pago]] (módulo 03) |
| Columna | `proveedor_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 11 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
