---
tags:
  - relacion
  - fk
  - modulo/05-notificaciones-y-comunicaciones
  - cross-modulo
origen: enlace_pago_notificado
columna: orden_cobro_id
destino: orden_cobro
modulo_origen: "05"
modulo_destino: "03"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# enlace_pago_notificado.orden_cobro_id → orden_cobro

> **[[enlace_pago_notificado]]** `.orden_cobro_id` → **[[orden_cobro]]**

| | |
| --- | --- |
| Entidad origen | [[enlace_pago_notificado]] (módulo 05) |
| Entidad destino | [[orden_cobro]] (módulo 03) |
| Columna | `orden_cobro_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 05 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[05_notificaciones]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
