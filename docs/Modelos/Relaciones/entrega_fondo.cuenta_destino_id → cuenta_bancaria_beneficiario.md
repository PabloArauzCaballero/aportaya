---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: entrega_fondo
columna: cuenta_destino_id
destino: cuenta_bancaria_beneficiario
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: true
cardinalidad: "muchos a uno opcional"
---

# entrega_fondo.cuenta_destino_id → cuenta_bancaria_beneficiario

> **[[entrega_fondo]]** `.cuenta_destino_id` → **[[cuenta_bancaria_beneficiario]]**

| | |
| --- | --- |
| Entidad origen | [[entrega_fondo]] (módulo 04) |
| Entidad destino | [[cuenta_bancaria_beneficiario]] (módulo 04) |
| Columna | `cuenta_destino_id` — UUID |
| Cardinalidad | muchos a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "abona en" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
