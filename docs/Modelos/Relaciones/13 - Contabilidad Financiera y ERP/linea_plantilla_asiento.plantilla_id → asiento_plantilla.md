---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: linea_plantilla_asiento
columna: plantilla_id
destino: asiento_plantilla
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (1..N)"
---

# linea_plantilla_asiento.plantilla_id → asiento_plantilla

> **[[linea_plantilla_asiento]]** `.plantilla_id` → **[[asiento_plantilla]]**

| | |
| --- | --- |
| Entidad origen | [[linea_plantilla_asiento]] (módulo 13) |
| Entidad destino | [[asiento_plantilla]] (módulo 13) |
| Columna | `plantilla_id` — UUID |
| Cardinalidad | uno a muchos (1..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "detalla" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
