---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
  - append-only
tabla: conversion_anuncio
clase: ConversionAnuncio
modulo: "14 — Publicidad y Campañas"
clave_primaria: [id]
columnas: 6
fk_salientes: 2
fk_entrantes: 0
append_only: true
---

# `conversion_anuncio`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `ConversionAnuncio` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `clic_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `impresion_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `tipo` | VARCHAR(25) | — | no | CK |
| `referencia_id` | UUID | IDX | sí | NULL, IDX, polimorfica |
| `ocurrida_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `clic_id` | [[clic_anuncio]] | 14 | sí | [[conversion_anuncio.clic_id → clic_anuncio]] |
| `impresion_id` | [[impresion_anuncio]] | 14 | sí | [[conversion_anuncio.impresion_id → impresion_anuncio]] |

## Entidades vecinas

[[clic_anuncio]] · [[impresion_anuncio]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
