---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: activo_fijo
columna: categoria_activo_fijo_id
destino: categoria_activo_fijo
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# activo_fijo.categoria_activo_fijo_id → categoria_activo_fijo

> **[[activo_fijo]]** `.categoria_activo_fijo_id` → **[[categoria_activo_fijo]]**

| | |
| --- | --- |
| Entidad origen | [[activo_fijo]] (módulo 13) |
| Entidad destino | [[categoria_activo_fijo]] (módulo 13) |
| Columna | `categoria_activo_fijo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "clasifica" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
