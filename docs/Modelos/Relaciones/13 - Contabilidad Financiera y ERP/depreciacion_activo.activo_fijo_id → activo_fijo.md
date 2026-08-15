---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: depreciacion_activo
columna: activo_fijo_id
destino: activo_fijo
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# depreciacion_activo.activo_fijo_id → activo_fijo

> **[[depreciacion_activo]]** `.activo_fijo_id` → **[[activo_fijo]]**

| | |
| --- | --- |
| Entidad origen | [[depreciacion_activo]] (módulo 13) |
| Entidad destino | [[activo_fijo]] (módulo 13) |
| Columna | `activo_fijo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "deprecia" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
