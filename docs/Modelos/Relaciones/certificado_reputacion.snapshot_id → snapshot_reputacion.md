---
tags:
  - relacion
  - fk
  - modulo/06-transparencia-y-reputacion
origen: certificado_reputacion
columna: snapshot_id
destino: snapshot_reputacion
modulo_origen: "06"
modulo_destino: "06"
cross_modulo: false
opcional: false
cardinalidad: "uno a uno opcional"
---

# certificado_reputacion.snapshot_id → snapshot_reputacion

> **[[certificado_reputacion]]** `.snapshot_id` → **[[snapshot_reputacion]]**

| | |
| --- | --- |
| Entidad origen | [[certificado_reputacion]] (módulo 06) |
| Entidad destino | [[snapshot_reputacion]] (módulo 06) |
| Columna | `snapshot_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | sí |
| Uno a uno | sí (columna UNIQUE) |
| Cruza módulos | no |
| Semántica | "certifica" |

## Ver también

- [[06_transparencia_reputacion]] — justificación de negocio del origen
- [[06_transparencia_reputacion]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
