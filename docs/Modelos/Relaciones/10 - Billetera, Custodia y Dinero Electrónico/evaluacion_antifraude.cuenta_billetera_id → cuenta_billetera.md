---
tags:
  - relacion
  - fk
  - modulo/10-billetera-custodia-y-dinero-electronico
origen: evaluacion_antifraude
columna: cuenta_billetera_id
destino: cuenta_billetera
modulo_origen: "10"
modulo_destino: "10"
cross_modulo: false
opcional: false
cardinalidad: "no declarada en el diagrama"
---

# evaluacion_antifraude.cuenta_billetera_id → cuenta_billetera

> **[[evaluacion_antifraude]]** `.cuenta_billetera_id` → **[[cuenta_billetera]]**

| | |
| --- | --- |
| Entidad origen | [[evaluacion_antifraude]] (módulo 10) |
| Entidad destino | [[cuenta_billetera]] (módulo 10) |
| Columna | `cuenta_billetera_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |

## Ver también

- [[10_billetera_custodia]] — justificación de negocio del origen
- [[10_billetera_custodia]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
