---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: estado_financiero_generado
columna: periodo_contable_id
destino: periodo_contable
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# estado_financiero_generado.periodo_contable_id → periodo_contable

> **[[estado_financiero_generado]]** `.periodo_contable_id` → **[[periodo_contable]]**

| | |
| --- | --- |
| Entidad origen | [[estado_financiero_generado]] (módulo 13) |
| Entidad destino | [[periodo_contable]] (módulo 13) |
| Columna | `periodo_contable_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "genera" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
