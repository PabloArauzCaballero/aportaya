---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: observacion_regulatoria
columna: envio_regulatorio_id
destino: envio_regulatorio
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# observacion_regulatoria.envio_regulatorio_id → envio_regulatorio

> **[[observacion_regulatoria]]** `.envio_regulatorio_id` → **[[envio_regulatorio]]**

| | |
| --- | --- |
| Entidad origen | [[observacion_regulatoria]] (módulo 12) |
| Entidad destino | [[envio_regulatorio]] (módulo 12) |
| Columna | `envio_regulatorio_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
