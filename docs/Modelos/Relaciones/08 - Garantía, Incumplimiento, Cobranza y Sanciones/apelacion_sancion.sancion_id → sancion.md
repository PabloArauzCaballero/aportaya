---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: apelacion_sancion
columna: sancion_id
destino: sancion
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# apelacion_sancion.sancion_id → sancion

> **[[apelacion_sancion]]** `.sancion_id` → **[[sancion]]**

| | |
| --- | --- |
| Entidad origen | [[apelacion_sancion]] (módulo 08) |
| Entidad destino | [[sancion]] (módulo 08) |
| Columna | `sancion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se apela" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
