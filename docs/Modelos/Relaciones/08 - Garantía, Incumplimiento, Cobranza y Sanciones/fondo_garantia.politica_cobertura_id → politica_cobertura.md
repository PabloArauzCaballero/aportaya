---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: fondo_garantia
columna: politica_cobertura_id
destino: politica_cobertura
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# fondo_garantia.politica_cobertura_id → politica_cobertura

> **[[fondo_garantia]]** `.politica_cobertura_id` → **[[politica_cobertura]]**

| | |
| --- | --- |
| Entidad origen | [[fondo_garantia]] (módulo 08) |
| Entidad destino | [[politica_cobertura]] (módulo 08) |
| Columna | `politica_cobertura_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "rige" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
