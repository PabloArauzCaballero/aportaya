---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: conciliacion_custodia
columna: cuenta_custodia_id
destino: cuenta_custodia
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# conciliacion_custodia.cuenta_custodia_id → cuenta_custodia

> **[[conciliacion_custodia]]** `.cuenta_custodia_id` → **[[cuenta_custodia]]**

| | |
| --- | --- |
| Entidad origen | [[conciliacion_custodia]] (módulo 10) |
| Entidad destino | [[cuenta_custodia]] (módulo 10) |
| Columna | `cuenta_custodia_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se concilia en" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
