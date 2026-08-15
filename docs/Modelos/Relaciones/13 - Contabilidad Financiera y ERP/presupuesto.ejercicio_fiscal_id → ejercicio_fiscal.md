---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: presupuesto
columna: ejercicio_fiscal_id
destino: ejercicio_fiscal
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# presupuesto.ejercicio_fiscal_id → ejercicio_fiscal

> **[[presupuesto]]** `.ejercicio_fiscal_id` → **[[ejercicio_fiscal]]**

| | |
| --- | --- |
| Entidad origen | [[presupuesto]] (módulo 13) |
| Entidad destino | [[ejercicio_fiscal]] (módulo 13) |
| Columna | `ejercicio_fiscal_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
