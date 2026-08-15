---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
  - append-only
tabla: impresion_anuncio
clase: ImpresionAnuncio
modulo: "14 — Publicidad y Campañas"
clave_primaria: [id]
columnas: 6
fk_salientes: 2
fk_entrantes: 2
append_only: true
---

# `impresion_anuncio`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `ImpresionAnuncio` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `anuncio_id` | UUID | FK IDX | no | FK, IDX |
| `usuario_id` | UUID | FK IDX | sí | FK, NULL, IDX, M1 |
| `mostrada_en` | TIMESTAMPTZ | IDX | no | IDX |
| `costo` | DECIMAL(10,4) | — | no | — |
| `moneda` | CHAR(3) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `anuncio_id` | [[anuncio]] | 14 | no | [[impresion_anuncio.anuncio_id → anuncio]] |
| `usuario_id` | [[usuario]] | ↗ 01 | sí | [[impresion_anuncio.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[clic_anuncio]] | `impresion_id` | 14 | [[clic_anuncio.impresion_id → impresion_anuncio]] |
| [[conversion_anuncio]] | `impresion_id` | 14 | [[conversion_anuncio.impresion_id → impresion_anuncio]] |

## Entidades vecinas

[[anuncio]] · [[clic_anuncio]] · [[conversion_anuncio]] · [[usuario]]

## Notas del modelo

> Alto volumen, APPEND_ONLY. usuario_id es NULL si la
> impresion ocurre sin sesion identificada (ej.
> landing publica). costo se calcula segun
> modelo_puja del conjunto (CPM aqui, CPC en clic).

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
