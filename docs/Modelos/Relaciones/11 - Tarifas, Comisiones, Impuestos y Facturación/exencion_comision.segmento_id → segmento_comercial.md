---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: exencion_comision
columna: segmento_id
destino: segmento_comercial
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# exencion_comision.segmento_id → segmento_comercial

> **[[exencion_comision]]** `.segmento_id` → **[[segmento_comercial]]**

| | |
| --- | --- |
| Entidad origen | [[exencion_comision]] (módulo 11) |
| Entidad destino | [[segmento_comercial]] (módulo 11) |
| Columna | `segmento_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
