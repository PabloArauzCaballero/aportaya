---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: movimiento_fondo
columna: fondo_id
destino: fondo_garantia
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# movimiento_fondo.fondo_id → fondo_garantia

> **[[movimiento_fondo]]** `.fondo_id` → **[[fondo_garantia]]**

| | |
| --- | --- |
| Entidad origen | [[movimiento_fondo]] (módulo 08) |
| Entidad destino | [[fondo_garantia]] (módulo 08) |
| Columna | `fondo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "registra" |

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
