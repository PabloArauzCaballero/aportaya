---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: cobro_cuenta_por_cobrar
columna: cuenta_por_cobrar_id
destino: cuenta_por_cobrar
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# cobro_cuenta_por_cobrar.cuenta_por_cobrar_id → cuenta_por_cobrar

> **[[cobro_cuenta_por_cobrar]]** `.cuenta_por_cobrar_id` → **[[cuenta_por_cobrar]]**

| | |
| --- | --- |
| Entidad origen | [[cobro_cuenta_por_cobrar]] (módulo 13) |
| Entidad destino | [[cuenta_por_cobrar]] (módulo 13) |
| Columna | `cuenta_por_cobrar_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se cobra con" |

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
