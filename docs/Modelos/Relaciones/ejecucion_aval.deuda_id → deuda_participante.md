---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: ejecucion_aval
columna: deuda_id
destino: deuda_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "muchos a uno"
---

# ejecucion_aval.deuda_id → deuda_participante

> **[[ejecucion_aval]]** `.deuda_id` → **[[deuda_participante]]**

| | |
| --- | --- |
| Entidad origen | [[ejecucion_aval]] (módulo 08) |
| Entidad destino | [[deuda_participante]] (módulo 08) |
| Columna | `deuda_id` — UUID |
| Cardinalidad | muchos a uno |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "abona" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
