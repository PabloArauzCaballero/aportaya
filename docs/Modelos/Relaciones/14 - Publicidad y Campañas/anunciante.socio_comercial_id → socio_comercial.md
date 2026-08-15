---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: anunciante
columna: socio_comercial_id
destino: socio_comercial
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# anunciante.socio_comercial_id → socio_comercial

> **[[anunciante]]** `.socio_comercial_id` → **[[socio_comercial]]**

| | |
| --- | --- |
| Entidad origen | [[anunciante]] (módulo 14) |
| Entidad destino | [[socio_comercial]] (módulo 14) |
| Columna | `socio_comercial_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
