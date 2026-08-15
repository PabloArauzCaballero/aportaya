---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: depreciacion_activo
columna: periodo_contable_id
destino: periodo_contable
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# depreciacion_activo.periodo_contable_id → periodo_contable

> **[[depreciacion_activo]]** `.periodo_contable_id` → **[[periodo_contable]]**

| | |
| --- | --- |
| Entidad origen | [[depreciacion_activo]] (módulo 13) |
| Entidad destino | [[periodo_contable]] (módulo 13) |
| Columna | `periodo_contable_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
