---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: plan_continuidad
columna: politica_interna_id
destino: politica_interna
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# plan_continuidad.politica_interna_id → politica_interna

> **[[plan_continuidad]]** `.politica_interna_id` → **[[politica_interna]]**

| | |
| --- | --- |
| Entidad origen | [[plan_continuidad]] (módulo 12) |
| Entidad destino | [[politica_interna]] (módulo 12) |
| Columna | `politica_interna_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "define" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
