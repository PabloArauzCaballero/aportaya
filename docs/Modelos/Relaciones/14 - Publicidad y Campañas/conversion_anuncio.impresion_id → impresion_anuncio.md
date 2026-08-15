---
tags:
  - relacion
  - fk
  - modulo/14-publicidad-y-campanas
origen: conversion_anuncio
columna: impresion_id
destino: impresion_anuncio
modulo_origen: "14"
modulo_destino: "14"
cross_modulo: false
opcional: true
cardinalidad: "no declarada en el diagrama"
---

# conversion_anuncio.impresion_id → impresion_anuncio

> **[[conversion_anuncio]]** `.impresion_id` → **[[impresion_anuncio]]**

| | |
| --- | --- |
| Entidad origen | [[conversion_anuncio]] (módulo 14) |
| Entidad destino | [[impresion_anuncio]] (módulo 14) |
| Columna | `impresion_id` — UUID |
| Cardinalidad | no declarada en el diagrama |
| Obligatoria | no (admite NULL) |
| Uno a uno | no |
| Cruza módulos | no |

> [!note] Opcional
> La columna admite `NULL`: la relación puede no existir. Conviene revisar en la ficha de negocio qué significa su ausencia.

## Ver también

- [[14_publicidad_campanas]] — justificación de negocio del origen
- [[14_publicidad_campanas]] — justificación de negocio del destino
- [[_Relaciones]] · [[Index]]
