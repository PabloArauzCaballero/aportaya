---
tags:
  - relacion
  - fk
  - modulo/03-aportes-pagos-qr-y-conciliacion
  - cross-modulo
origen: plan_regularizacion
columna: aprobado_por
destino: usuario
modulo_origen: "03"
modulo_destino: "01"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# plan_regularizacion.aprobado_por → usuario

> **[[plan_regularizacion]]** `.aprobado_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[plan_regularizacion]] (módulo 03) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `aprobado_por` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 03 con el 01. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[03_aportes_pagos_qr]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
