---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: descuadre_custodia
columna: conciliacion_custodia_id
destino: conciliacion_custodia
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# descuadre_custodia.conciliacion_custodia_id → conciliacion_custodia

> **[[descuadre_custodia]]** `.conciliacion_custodia_id` → **[[conciliacion_custodia]]**

| | |
| --- | --- |
| Entidad origen | [[descuadre_custodia]] (módulo 10) |
| Entidad destino | [[conciliacion_custodia]] (módulo 10) |
| Columna | `conciliacion_custodia_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "levanta" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
