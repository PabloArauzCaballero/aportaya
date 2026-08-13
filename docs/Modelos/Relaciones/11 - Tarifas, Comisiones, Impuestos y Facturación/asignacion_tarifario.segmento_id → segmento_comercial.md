---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: asignacion_tarifario
columna: segmento_id
destino: segmento_comercial
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# asignacion_tarifario.segmento_id → segmento_comercial

> **[[asignacion_tarifario]]** `.segmento_id` → **[[segmento_comercial]]**

| | |
| --- | --- |
| Entidad origen | [[asignacion_tarifario]] (módulo 11) |
| Entidad destino | [[segmento_comercial]] (módulo 11) |
| Columna | `segmento_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "segmenta" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
