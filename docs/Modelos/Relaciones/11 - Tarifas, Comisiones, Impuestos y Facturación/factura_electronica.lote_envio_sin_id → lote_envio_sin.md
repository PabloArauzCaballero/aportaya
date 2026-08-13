---
tags:
  - relacion
  - fk
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
origen: factura_electronica
columna: lote_envio_sin_id
destino: lote_envio_sin
modulo_origen: "11"
modulo_destino: "11"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# factura_electronica.lote_envio_sin_id → lote_envio_sin

> **[[factura_electronica]]** `.lote_envio_sin_id` → **[[lote_envio_sin]]**

| | |
| --- | --- |
| Entidad origen | [[factura_electronica]] (módulo 11) |
| Entidad destino | [[lote_envio_sin]] (módulo 11) |
| Columna | `lote_envio_sin_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "envia" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[11_tarifas_comisiones]] — justificación de negocio del origen
- [[11_tarifas_comisiones]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
