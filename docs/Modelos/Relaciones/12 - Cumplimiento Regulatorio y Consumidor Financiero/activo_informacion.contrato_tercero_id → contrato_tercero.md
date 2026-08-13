---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: activo_informacion
columna: contrato_tercero_id
destino: contrato_tercero
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# activo_informacion.contrato_tercero_id → contrato_tercero

> **[[activo_informacion]]** `.contrato_tercero_id` → **[[contrato_tercero]]**

| | |
| --- | --- |
| Entidad origen | [[activo_informacion]] (módulo 12) |
| Entidad destino | [[contrato_tercero]] (módulo 12) |
| Columna | `contrato_tercero_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "custodia" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
