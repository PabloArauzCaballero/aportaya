---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: concepto_tarifa
columna: hecho_generador_id
destino: catalogo_hecho_generador
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# concepto_tarifa.hecho_generador_id → catalogo_hecho_generador

> **[[concepto_tarifa]]** `.hecho_generador_id` → **[[catalogo_hecho_generador]]**

| | |
| --- | --- |
| Entidad origen | [[concepto_tarifa]] (módulo 11) |
| Entidad destino | [[catalogo_hecho_generador]] (módulo 11) |
| Columna | `hecho_generador_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "genera" |

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
