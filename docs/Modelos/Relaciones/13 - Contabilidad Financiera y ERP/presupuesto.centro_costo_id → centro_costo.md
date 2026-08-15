---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: presupuesto
columna: centro_costo_id
destino: centro_costo
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# presupuesto.centro_costo_id → centro_costo

> **[[presupuesto]]** `.centro_costo_id` → **[[centro_costo]]**

| | |
| --- | --- |
| Entidad origen | [[presupuesto]] (módulo 13) |
| Entidad destino | [[centro_costo]] (módulo 13) |
| Columna | `centro_costo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "presupuesta" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
