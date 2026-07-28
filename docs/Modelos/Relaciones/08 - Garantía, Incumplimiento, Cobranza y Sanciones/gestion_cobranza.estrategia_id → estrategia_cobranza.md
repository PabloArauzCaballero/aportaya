---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: gestion_cobranza
columna: estrategia_id
destino: estrategia_cobranza
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# gestion_cobranza.estrategia_id → estrategia_cobranza

> **[[gestion_cobranza]]** `.estrategia_id` → **[[estrategia_cobranza]]**

| | |
| --- | --- |
| Entidad origen | [[gestion_cobranza]] (módulo 08) |
| Entidad destino | [[estrategia_cobranza]] (módulo 08) |
| Columna | `estrategia_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "guia" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
