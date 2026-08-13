---
tags:
  - relacion
  - fk
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
origen: desvio_perfil
columna: perfil_transaccional_id
destino: perfil_transaccional
modulo_origen: "12"
modulo_destino: "12"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# desvio_perfil.perfil_transaccional_id → perfil_transaccional

> **[[desvio_perfil]]** `.perfil_transaccional_id` → **[[perfil_transaccional]]**

| | |
| --- | --- |
| Entidad origen | [[desvio_perfil]] (módulo 12) |
| Entidad destino | [[perfil_transaccional]] (módulo 12) |
| Columna | `perfil_transaccional_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "se contrasta en" |

## Ver también

- [[12_cumplimiento_asfi]] — justificación de negocio del origen
- [[12_cumplimiento_asfi]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
