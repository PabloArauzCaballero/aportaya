---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: verificacion_kyc
columna: documento_id
destino: documento_identidad
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# verificacion_kyc.documento_id → documento_identidad

> **[[verificacion_kyc]]** `.documento_id` → **[[documento_identidad]]**

| | |
| --- | --- |
| Entidad origen | [[verificacion_kyc]] (módulo 01) |
| Entidad destino | [[documento_identidad]] (módulo 01) |
| Columna | `documento_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sustenta" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
