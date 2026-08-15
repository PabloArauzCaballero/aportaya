---
tags:
  - relacion
  - fk
  - modulo/13-contabilidad-financiera-y-erp
origen: activo_fijo
columna: centro_costo_id
destino: centro_costo
modulo_origen: "13"
modulo_destino: "13"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# activo_fijo.centro_costo_id → centro_costo

> **[[activo_fijo]]** `.centro_costo_id` → **[[centro_costo]]**

| | |
| --- | --- |
| Entidad origen | [[activo_fijo]] (módulo 13) |
| Entidad destino | [[centro_costo]] (módulo 13) |
| Columna | `centro_costo_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[13_contabilidad_erp]] — justificación de negocio del origen
- [[13_contabilidad_erp]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
