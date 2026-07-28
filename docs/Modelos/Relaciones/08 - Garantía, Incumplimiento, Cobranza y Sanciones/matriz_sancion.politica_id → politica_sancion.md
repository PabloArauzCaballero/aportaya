---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: matriz_sancion
columna: politica_id
destino: politica_sancion
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# matriz_sancion.politica_id → politica_sancion

> **[[matriz_sancion]]** `.politica_id` → **[[politica_sancion]]**

| | |
| --- | --- |
| Entidad origen | [[matriz_sancion]] (módulo 08) |
| Entidad destino | [[politica_sancion]] (módulo 08) |
| Columna | `politica_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "tabula" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
