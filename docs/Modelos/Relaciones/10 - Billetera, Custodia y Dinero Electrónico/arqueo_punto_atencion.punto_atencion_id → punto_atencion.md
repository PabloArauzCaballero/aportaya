---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: arqueo_punto_atencion
columna: punto_atencion_id
destino: punto_atencion
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# arqueo_punto_atencion.punto_atencion_id → punto_atencion

> **[[arqueo_punto_atencion]]** `.punto_atencion_id` → **[[punto_atencion]]**

| | |
| --- | --- |
| Entidad origen | [[arqueo_punto_atencion]] (módulo 10) |
| Entidad destino | [[punto_atencion]] (módulo 10) |
| Columna | `punto_atencion_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "cuadra en" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
