---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
tabla: pieza_creativa
clase: PiezaCreativa
modulo: "14 — Publicidad y Campañas"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `pieza_creativa`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `PiezaCreativa` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `anunciante_id` | UUID | FK IDX | no | FK, IDX |
| `titulo` | VARCHAR(120) | — | no | — |
| `texto` | VARCHAR(300) | — | sí | NULL |
| `url_recurso` | VARCHAR(300) | — | no | — |
| `tipo_recurso` | VARCHAR(10) | — | no | CK |
| `estado_moderacion` | VARCHAR(15) | IDX | no | CK, IDX |
| `creada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `anunciante_id` | [[anunciante]] | 14 | no | [[pieza_creativa.anunciante_id → anunciante]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[anuncio]] | `pieza_creativa_id` | 14 | [[anuncio.pieza_creativa_id → pieza_creativa]] |
| [[revision_creativa]] | `pieza_creativa_id` | 14 | [[revision_creativa.pieza_creativa_id → pieza_creativa]] |

## Entidades vecinas

[[anunciante]] · [[anuncio]] · [[revision_creativa]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
