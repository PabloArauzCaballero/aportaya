---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
  - cross-modulo
origen: linea_plantilla_asiento
columna: cuenta_contable_id
destino: cuenta_contable
modulo_origen: "13"
modulo_destino: "03"
cross_modulo: true
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# linea_plantilla_asiento.cuenta_contable_id → cuenta_contable

> **[[linea_plantilla_asiento]]** `.cuenta_contable_id` → **[[cuenta_contable]]**

| | |
| --- | --- |
| Entidad origen | [[linea_plantilla_asiento]] (módulo 13) |
| Entidad destino | [[cuenta_contable]] (módulo 03) |
| Columna | `cuenta_contable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | sí ↗ |

> [!info] Referencia entre módulos
> Esta FK conecta el módulo 13 con el 03. En los diagramas se documenta en notas al pie y, cuando es polimórfica, se valida por aplicación o trigger en lugar de con una FK física.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[03_aportes_pagos_qr]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
