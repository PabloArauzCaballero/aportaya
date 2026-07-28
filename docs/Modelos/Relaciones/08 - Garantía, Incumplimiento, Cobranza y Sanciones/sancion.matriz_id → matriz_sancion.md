---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: sancion
columna: matriz_id
destino: matriz_sancion
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# sancion.matriz_id → matriz_sancion

> **[[sancion]]** `.matriz_id` → **[[matriz_sancion]]**

| | |
| --- | --- |
| Entidad origen | [[sancion]] (módulo 08) |
| Entidad destino | [[matriz_sancion]] (módulo 08) |
| Columna | `matriz_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "instancia" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
