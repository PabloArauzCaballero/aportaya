---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: orden_recarga
columna: punto_atencion_id
destino: punto_atencion
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# orden_recarga.punto_atencion_id → punto_atencion

> **[[orden_recarga]]** `.punto_atencion_id` → **[[punto_atencion]]**

| | |
| --- | --- |
| Entidad origen | [[orden_recarga]] (módulo 10) |
| Entidad destino | [[punto_atencion]] (módulo 10) |
| Columna | `punto_atencion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "atiende" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
