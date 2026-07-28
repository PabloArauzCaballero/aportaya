---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: deuda_participante
columna: cobertura_id
destino: cobertura_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# deuda_participante.cobertura_id → cobertura_incumplimiento

> **[[deuda_participante]]** `.cobertura_id` → **[[cobertura_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[deuda_participante]] (módulo 08) |
| Entidad destino | [[cobertura_incumplimiento]] (módulo 08) |
| Columna | `cobertura_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "origina" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
