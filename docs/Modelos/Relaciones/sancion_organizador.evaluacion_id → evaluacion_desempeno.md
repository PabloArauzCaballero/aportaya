---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: sancion_organizador
columna: evaluacion_id
destino: evaluacion_desempeno
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# sancion_organizador.evaluacion_id → evaluacion_desempeno

> **[[sancion_organizador]]** `.evaluacion_id` → **[[evaluacion_desempeno]]**

| | |
| --- | --- |
| Entidad origen | [[sancion_organizador]] (módulo 07) |
| Entidad destino | [[evaluacion_desempeno]] (módulo 07) |
| Columna | `evaluacion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "origina" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
