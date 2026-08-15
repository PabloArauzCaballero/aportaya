---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: factura_publicidad
columna: cuenta_publicitaria_id
destino: cuenta_publicitaria
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# factura_publicidad.cuenta_publicitaria_id → cuenta_publicitaria

> **[[factura_publicidad]]** `.cuenta_publicitaria_id` → **[[cuenta_publicitaria]]**

| | |
| --- | --- |
| Entidad origen | [[factura_publicidad]] (módulo 14) |
| Entidad destino | [[cuenta_publicitaria]] (módulo 14) |
| Columna | `cuenta_publicitaria_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "liquida" |

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
