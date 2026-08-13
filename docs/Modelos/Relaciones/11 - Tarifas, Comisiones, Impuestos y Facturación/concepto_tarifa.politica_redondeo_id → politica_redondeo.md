---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: concepto_tarifa
columna: politica_redondeo_id
destino: politica_redondeo
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# concepto_tarifa.politica_redondeo_id → politica_redondeo

> **[[concepto_tarifa]]** `.politica_redondeo_id` → **[[politica_redondeo]]**

| | |
| --- | --- |
| Entidad origen | [[concepto_tarifa]] (módulo 11) |
| Entidad destino | [[politica_redondeo]] (módulo 11) |
| Columna | `politica_redondeo_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "redondea" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
