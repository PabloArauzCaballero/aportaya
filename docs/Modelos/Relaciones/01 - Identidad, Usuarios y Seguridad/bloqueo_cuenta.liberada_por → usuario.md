---
tags:
  - relacion
  - fk
  - modulo/01-identidad-usuarios-y-seguridad
origen: bloqueo_cuenta
columna: liberada_por
destino: usuario
modulo_origen: "01"
modulo_destino: "01"
cross_modulo: false
opcional: true
cardinalidad: "uno a muchos (0..N)"
---

# bloqueo_cuenta.liberada_por → usuario

> **[[bloqueo_cuenta]]** `.liberada_por` → **[[usuario]]**

| | |
| --- | --- |
| Entidad origen | [[bloqueo_cuenta]] (módulo 01) |
| Entidad destino | [[usuario]] (módulo 01) |
| Columna | `liberada_por` — UUID |
| Cardinalidad | uno a muchos (0..N) |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "sufre" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[01_identidad_usuarios]] — justificación de negocio del origen
- [[01_identidad_usuarios]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
