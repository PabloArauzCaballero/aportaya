---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: calculo_impuesto
columna: impuesto_id
destino: impuesto
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# calculo_impuesto.impuesto_id → impuesto

> **[[calculo_impuesto]]** `.impuesto_id` → **[[impuesto]]**

| | |
| --- | --- |
| Entidad origen | [[calculo_impuesto]] (módulo 11) |
| Entidad destino | [[impuesto]] (módulo 11) |
| Columna | `impuesto_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "define" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
