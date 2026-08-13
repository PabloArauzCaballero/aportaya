---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: aplicacion_promocion
columna: campana_id
destino: campana_promocional
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# aplicacion_promocion.campana_id → campana_promocional

> **[[aplicacion_promocion]]** `.campana_id` → **[[campana_promocional]]**

| | |
| --- | --- |
| Entidad origen | [[aplicacion_promocion]] (módulo 11) |
| Entidad destino | [[campana_promocional]] (módulo 11) |
| Columna | `campana_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "financia" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
