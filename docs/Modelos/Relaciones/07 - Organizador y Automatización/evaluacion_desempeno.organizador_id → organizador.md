---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: evaluacion_desempeno
columna: organizador_id
destino: organizador
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# evaluacion_desempeno.organizador_id → organizador

> **[[evaluacion_desempeno]]** `.organizador_id` → **[[organizador]]**

| | |
| --- | --- |
| Entidad origen | [[evaluacion_desempeno]] (módulo 07) |
| Entidad destino | [[organizador]] (módulo 07) |
| Columna | `organizador_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "es evaluado" |

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
