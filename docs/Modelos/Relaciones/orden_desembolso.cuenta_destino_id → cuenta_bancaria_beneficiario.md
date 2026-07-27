---
tags:
  - relacion
  - fk
  - modulo/04-entregas-de-fondo
origen: orden_desembolso
columna: cuenta_destino_id
destino: cuenta_bancaria_beneficiario
modulo_origen: "04"
modulo_destino: "04"
cross_modulo: false
opcional: false
cardinalidad: "uno a muchos (0..N)"
---

# orden_desembolso.cuenta_destino_id → cuenta_bancaria_beneficiario

> **[[orden_desembolso]]** `.cuenta_destino_id` → **[[cuenta_bancaria_beneficiario]]**

| | |
| --- | --- |
| Entidad origen | [[orden_desembolso]] (módulo 04) |
| Entidad destino | [[cuenta_bancaria_beneficiario]] (módulo 04) |
| Columna | `cuenta_destino_id` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | sí |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "recibe" |

## Ver también

- [[04_entregas_fondo]] — justificación de negocio del origen
- [[04_entregas_fondo]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
