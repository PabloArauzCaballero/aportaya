---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: metrica_organizador
columna: evaluacion_id
destino: evaluacion_desempeno
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# metrica_organizador.evaluacion_id → evaluacion_desempeno

> **[[metrica_organizador]]** `.evaluacion_id` → **[[evaluacion_desempeno]]**

| | |
| --- | --- |
| Entidad origen | [[metrica_organizador]] (módulo 07) |
| Entidad destino | [[evaluacion_desempeno]] (módulo 07) |
| Columna | `evaluacion_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "mide" |

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
