---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: documento_publicado
clase: DocumentoPublicado
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `documento_publicado`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `DocumentoPublicado`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo` | VARCHAR(25) | IDX | no | CK, IDX |
| `referencia_tipo` | VARCHAR(30) | — | sí | NULL |
| `referencia_id` | UUID | — | sí | NULL, polimorfica |
| `publicado_por` | UUID | FK | sí | FK, NULL |
| `url_publica` | VARCHAR(255) | — | no | — |
| `hash_documento` | VARCHAR(64) | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `publicado_por` | [[usuario]] | ↗ 01 | sí | [[documento_publicado.publicado_por → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
