---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
  - append-only
tabla: clic_anuncio
clase: ClicAnuncio
modulo: "14 — Publicidad y Campañas"
clave_primaria: [id]
columnas: 6
fk_salientes: 2
fk_entrantes: 1
append_only: true
---

# `clic_anuncio`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `ClicAnuncio` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `impresion_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | sí | FK, NULL, IDX, M1 |
| `clic_en` | TIMESTAMPTZ | IDX | no | IDX |
| `costo` | DECIMAL(10,4) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `impresion_id` | [[impresion_anuncio]] | 14 | no | [[clic_anuncio.impresion_id → impresion_anuncio]] |
| `usuario_id` | [[usuario]] | ↗ 01 | sí | [[clic_anuncio.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[conversion_anuncio]] | `clic_id` | 14 | [[conversion_anuncio.clic_id → clic_anuncio]] |

## Entidades vecinas

[[conversion_anuncio]] · [[impresion_anuncio]] · [[usuario]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
