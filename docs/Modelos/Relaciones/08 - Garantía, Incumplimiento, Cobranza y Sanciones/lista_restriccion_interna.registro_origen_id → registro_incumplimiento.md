---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: lista_restriccion_interna
columna: registro_origen_id
destino: registro_incumplimiento
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# lista_restriccion_interna.registro_origen_id → registro_incumplimiento

> **[[lista_restriccion_interna]]** `.registro_origen_id` → **[[registro_incumplimiento]]**

| | |
| --- | --- |
| Entidad origen | [[lista_restriccion_interna]] (módulo 08) |
| Entidad destino | [[registro_incumplimiento]] (módulo 08) |
| Columna | `registro_origen_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "restringe por" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
