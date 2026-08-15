---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: partida_presupuestaria
columna: periodo_contable_id
destino: periodo_contable
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# partida_presupuestaria.periodo_contable_id → periodo_contable

> **[[partida_presupuestaria]]** `.periodo_contable_id` → **[[periodo_contable]]**

| | |
| --- | --- |
| Entidad origen | [[partida_presupuestaria]] (módulo 13) |
| Entidad destino | [[periodo_contable]] (módulo 13) |
| Columna | `periodo_contable_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "acota" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
