---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: candidato_reemplazo
columna: reemplazo_id
destino: reemplazo_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# candidato_reemplazo.reemplazo_id → reemplazo_participante

> **[[candidato_reemplazo]]** `.reemplazo_id` → **[[reemplazo_participante]]**

| | |
| --- | --- |
| Entidad origen | [[candidato_reemplazo]] (módulo 08) |
| Entidad destino | [[reemplazo_participante]] (módulo 08) |
| Columna | `reemplazo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "evalua" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
