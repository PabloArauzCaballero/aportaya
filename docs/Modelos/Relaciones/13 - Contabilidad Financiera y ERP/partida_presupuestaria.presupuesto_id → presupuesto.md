---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: partida_presupuestaria
columna: presupuesto_id
destino: presupuesto
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# partida_presupuestaria.presupuesto_id → presupuesto

> **[[partida_presupuestaria]]** `.presupuesto_id` → **[[presupuesto]]**

| | |
| --- | --- |
| Entidad origen | [[partida_presupuestaria]] (módulo 13) |
| Entidad destino | [[presupuesto]] (módulo 13) |
| Columna | `presupuesto_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detalla" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
