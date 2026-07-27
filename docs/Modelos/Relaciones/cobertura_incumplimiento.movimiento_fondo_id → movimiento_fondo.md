---
tags:
  - relacion
  - fk
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
origen: cobertura_incumplimiento
columna: movimiento_fondo_id
destino: movimiento_fondo
modulo_origen: "08"
modulo_destino: "08"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# cobertura_incumplimiento.movimiento_fondo_id → movimiento_fondo

> **[[cobertura_incumplimiento]]** `.movimiento_fondo_id` → **[[movimiento_fondo]]**

| | |
| --- | --- |
| Entidad origen | [[cobertura_incumplimiento]] (módulo 08) |
| Entidad destino | [[movimiento_fondo]] (módulo 08) |
| Columna | `movimiento_fondo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[08_garantia_incumplimiento]] — justificación de negocio del origen
- [[08_garantia_incumplimiento]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
