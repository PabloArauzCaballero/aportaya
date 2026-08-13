---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: aceptacion_contrato
columna: contrato_adhesion_id
destino: contrato_adhesion
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# aceptacion_contrato.contrato_adhesion_id → contrato_adhesion

> **[[aceptacion_contrato]]** `.contrato_adhesion_id` → **[[contrato_adhesion]]**

| | |
| --- | --- |
| Entidad origen | [[aceptacion_contrato]] (módulo 12) |
| Entidad destino | [[contrato_adhesion]] (módulo 12) |
| Columna | `contrato_adhesion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se acepta en" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
