---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: evaluacion_tercero
columna: contrato_tercero_id
destino: contrato_tercero
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# evaluacion_tercero.contrato_tercero_id → contrato_tercero

> **[[evaluacion_tercero]]** `.contrato_tercero_id` → **[[contrato_tercero]]**

| | |
| --- | --- |
| Entidad origen | [[evaluacion_tercero]] (módulo 12) |
| Entidad destino | [[contrato_tercero]] (módulo 12) |
| Columna | `contrato_tercero_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se evalua en" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
