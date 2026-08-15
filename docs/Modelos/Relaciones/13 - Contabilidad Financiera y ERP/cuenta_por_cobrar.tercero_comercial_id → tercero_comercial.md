---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: cuenta_por_cobrar
columna: tercero_comercial_id
destino: tercero_comercial
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# cuenta_por_cobrar.tercero_comercial_id → tercero_comercial

> **[[cuenta_por_cobrar]]** `.tercero_comercial_id` → **[[tercero_comercial]]**

| | |
| --- | --- |
| Entidad origen | [[cuenta_por_cobrar]] (módulo 13) |
| Entidad destino | [[tercero_comercial]] (módulo 13) |
| Columna | `tercero_comercial_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "debe" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
