---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
tabla: anuncio
clase: Anuncio
modulo: "14 — Publicidad y Campañas"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 6
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `anuncio`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `Anuncio` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `conjunto_anuncios_id` | UUID | FK IDX | no | FK, IDX |
| `pieza_creativa_id` | UUID | FK IDX | no | FK, IDX |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `iniciado_en` | TIMESTAMPTZ | — | sí | NULL |
| `finalizado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `conjunto_anuncios_id` | [[conjunto_anuncios]] | 14 | no | [[anuncio.conjunto_anuncios_id → conjunto_anuncios]] |
| `pieza_creativa_id` | [[pieza_creativa]] | 14 | no | [[anuncio.pieza_creativa_id → pieza_creativa]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[impresion_anuncio]] | `anuncio_id` | 14 | [[impresion_anuncio.anuncio_id → anuncio]] |

## Entidades vecinas

[[conjunto_anuncios]] · [[impresion_anuncio]] · [[pieza_creativa]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
