---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: intento_desembolso
columna: orden_desembolso_id
destino: orden_desembolso
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# intento_desembolso.orden_desembolso_id → orden_desembolso

> **[[intento_desembolso]]** `.orden_desembolso_id` → **[[orden_desembolso]]**

| | |
| --- | --- |
| Entidad origen | [[intento_desembolso]] (módulo 04) |
| Entidad destino | [[orden_desembolso]] (módulo 04) |
| Columna | `orden_desembolso_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "intenta" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
