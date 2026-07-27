---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: castigo_deuda
columna: deuda_id
destino: deuda_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# castigo_deuda.deuda_id → deuda_participante

> **[[castigo_deuda]]** `.deuda_id` → **[[deuda_participante]]**

| | |
| --- | --- |
| Entidad origen | [[castigo_deuda]] (módulo 08) |
| Entidad destino | [[deuda_participante]] (módulo 08) |
| Columna | `deuda_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se castiga" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
