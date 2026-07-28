---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: abono_recuperacion
columna: deuda_id
destino: deuda_participante
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# abono_recuperacion.deuda_id → deuda_participante

> **[[abono_recuperacion]]** `.deuda_id` → **[[deuda_participante]]**

| | |
| --- | --- |
| Entidad origen | [[abono_recuperacion]] (módulo 08) |
| Entidad destino | [[deuda_participante]] (módulo 08) |
| Columna | `deuda_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "amortiza con" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
