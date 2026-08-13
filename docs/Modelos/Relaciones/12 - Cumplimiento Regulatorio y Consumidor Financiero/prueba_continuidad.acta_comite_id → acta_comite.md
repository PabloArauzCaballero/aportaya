---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: prueba_continuidad
columna: acta_comite_id
destino: acta_comite
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# prueba_continuidad.acta_comite_id → acta_comite

> **[[prueba_continuidad]]** `.acta_comite_id` → **[[acta_comite]]**

| | |
| --- | --- |
| Entidad origen | [[prueba_continuidad]] (módulo 12) |
| Entidad destino | [[acta_comite]] (módulo 12) |
| Columna | `acta_comite_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
