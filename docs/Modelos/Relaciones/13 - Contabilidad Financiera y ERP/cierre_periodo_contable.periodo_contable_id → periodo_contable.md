---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: cierre_periodo_contable
columna: periodo_contable_id
destino: periodo_contable
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# cierre_periodo_contable.periodo_contable_id → periodo_contable

> **[[cierre_periodo_contable]]** `.periodo_contable_id` → **[[periodo_contable]]**

| | |
| --- | --- |
| Entidad origen | [[cierre_periodo_contable]] (módulo 13) |
| Entidad destino | [[periodo_contable]] (módulo 13) |
| Columna | `periodo_contable_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se cierra con" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
