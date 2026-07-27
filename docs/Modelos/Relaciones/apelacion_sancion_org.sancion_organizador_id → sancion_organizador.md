---
tags:
  - relacion
  - fk
  - modulo/07-organizador-y-automatizacion
origen: apelacion_sancion_org
columna: sancion_organizador_id
destino: sancion_organizador
modulo_origen: "07"
modulo_destino: "07"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# apelacion_sancion_org.sancion_organizador_id → sancion_organizador

> **[[apelacion_sancion_org]]** `.sancion_organizador_id` → **[[sancion_organizador]]**

| | |
| --- | --- |
| Entidad origen | [[apelacion_sancion_org]] (módulo 07) |
| Entidad destino | [[sancion_organizador]] (módulo 07) |
| Columna | `sancion_organizador_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "se apela" |

## Ver también

- [[07_organizador_automatizacion]] — justificación de negocio del origen
- [[07_organizador_automatizacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
