---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: reemplazo_participante
columna: registro_id
destino: registro_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# reemplazo_participante.registro_id → registro_incumplimiento

> **[[reemplazo_participante]]** `.registro_id` → **[[registro_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[reemplazo_participante]] (módulo 08) |
| Entidad destino | [[registro_incumplimiento]] (módulo 08) |
| Columna | `registro_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puede forzar" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
