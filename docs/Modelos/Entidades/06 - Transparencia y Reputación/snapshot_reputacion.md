---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: snapshot_reputacion
clase: SnapshotReputacion
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `snapshot_reputacion`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `SnapshotReputacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `puntaje` | DECIMAL(6,2) | — | no | — |
| `nivel_confianza` | VARCHAR(20) | — | no | — |
| `fotografia_factores` | JSONB | — | no | — |
| `motivo` | VARCHAR(25) | — | no | CK |
| `tomado_en` | TIMESTAMPTZ | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[snapshot_reputacion.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[certificado_reputacion]] | `snapshot_id` | 06 | [[certificado_reputacion.snapshot_id → snapshot_reputacion]] |

## Entidades vecinas

[[certificado_reputacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
