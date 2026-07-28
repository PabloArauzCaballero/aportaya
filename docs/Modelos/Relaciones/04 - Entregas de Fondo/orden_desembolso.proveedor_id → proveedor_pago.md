---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
  - cross-modulo
origen: orden_desembolso
columna: proveedor_id
destino: proveedor_pago
modulo_origen: "04"
modulo_destino: "03"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# orden_desembolso.proveedor_id → proveedor_pago

> **[[orden_desembolso]]** `.proveedor_id` → **[[proveedor_pago]]**

| | |
| --- | --- |
| Entidad origen | [[orden_desembolso]] (módulo 04) |
| Entidad destino | [[proveedor_pago]] (módulo 03) |
| Columna | `proveedor_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 04 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
