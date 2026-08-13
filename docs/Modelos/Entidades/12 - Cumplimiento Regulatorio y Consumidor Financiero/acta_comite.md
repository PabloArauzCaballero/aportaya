---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
  - append-only
tabla: acta_comite
clase: ActaComite
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
clave_primaria: [id]
columnas: 11
fk_salientes: 2
fk_entrantes: 3
append_only: true
---

# `acta_comite`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ActaComite` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `comite_gobierno_id` | UUID | FK IDX | no | FK, IDX |
| `elaborada_por` | UUID | FK | sí | FK, NULL |
| `numero` | VARCHAR(20) | UQ | no | UQ+comite_gobierno_id |
| `fecha` | DATE | IDX | no | IDX |
| `asistentes` | JSONB | — | no | — |
| `cumple_quorum` | BOOLEAN | — | no | — |
| `temas_tratados` | JSONB | — | no | — |
| `decisiones` | JSONB | — | no | — |
| `url_documento` | VARCHAR(255) | — | no | — |
| `hash_documento` | VARCHAR(64) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `comite_gobierno_id` | [[comite_gobierno]] | 12 | no | [[acta_comite.comite_gobierno_id → comite_gobierno]] |
| `elaborada_por` | [[usuario]] | ↗ 01 | sí | [[acta_comite.elaborada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[designacion_regulatoria]] | `acta_comite_id` | 12 | [[designacion_regulatoria.acta_comite_id → acta_comite]] |
| [[politica_interna]] | `acta_comite_id` | 12 | [[politica_interna.acta_comite_id → acta_comite]] |
| [[prueba_continuidad]] | `acta_comite_id` | 12 | [[prueba_continuidad.acta_comite_id → acta_comite]] |

## Entidades vecinas

[[comite_gobierno]] · [[designacion_regulatoria]] · [[politica_interna]] · [[prueba_continuidad]] · [[usuario]]

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
