---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: periodo_contable
columna: ejercicio_fiscal_id
destino: ejercicio_fiscal
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# periodo_contable.ejercicio_fiscal_id → ejercicio_fiscal

> **[[periodo_contable]]** `.ejercicio_fiscal_id` → **[[ejercicio_fiscal]]**

| | |
| --- | --- |
| Entidad origen | [[periodo_contable]] (módulo 13) |
| Entidad destino | [[ejercicio_fiscal]] (módulo 13) |
| Columna | `ejercicio_fiscal_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "contiene" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
