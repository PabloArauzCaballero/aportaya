---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: nota_credito_debito
columna: factura_id
destino: factura_electronica
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# nota_credito_debito.factura_id → factura_electronica

> **[[nota_credito_debito]]** `.factura_id` → **[[factura_electronica]]**

| | |
| --- | --- |
| Entidad origen | [[nota_credito_debito]] (módulo 11) |
| Entidad destino | [[factura_electronica]] (módulo 11) |
| Columna | `factura_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "corrige con" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
