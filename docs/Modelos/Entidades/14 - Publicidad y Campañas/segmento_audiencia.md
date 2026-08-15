---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
tabla: segmento_audiencia
clase: SegmentoAudiencia
modulo: "14 — Publicidad y Campañas"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 6
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `segmento_audiencia`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `SegmentoAudiencia` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `nombre` | VARCHAR(100) | — | no | — |
| `criterios` | JSONB | — | no | — |
| `reutilizable` | BOOLEAN | — | no | — |
| `creado_por` | UUID | FK | no | FK |
| `creado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `creado_por` | [[usuario]] | ↗ 01 | no | [[segmento_audiencia.creado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[conjunto_anuncios]] | `segmento_audiencia_id` | 14 | [[conjunto_anuncios.segmento_audiencia_id → segmento_audiencia]] |

## Entidades vecinas

[[conjunto_anuncios]] · [[usuario]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
