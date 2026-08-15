---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: conversion_anuncio
columna: clic_id
destino: clic_anuncio
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: true
cardinalidad: "uno a uno opcional"
---

# conversion_anuncio.clic_id → clic_anuncio

> **[[conversion_anuncio]]** `.clic_id` → **[[clic_anuncio]]**

| | |
| --- | --- |
| Entidad origen | [[conversion_anuncio]] (módulo 14) |
| Entidad destino | [[clic_anuncio]] (módulo 14) |
| Columna | `clic_id` — UUID |
| Cardinalidad | uno a uno opcional |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |
| Semántica | "puede derivar en" |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
