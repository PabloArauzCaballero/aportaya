---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: consumo_limite
columna: limite_id
destino: limite_operativo_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# consumo_limite.limite_id → limite_operativo_billetera

> **[[consumo_limite]]** `.limite_id` → **[[limite_operativo_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[consumo_limite]] (módulo 10) |
| Entidad destino | [[limite_operativo_billetera]] (módulo 10) |
| Columna | `limite_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se mide en" |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
