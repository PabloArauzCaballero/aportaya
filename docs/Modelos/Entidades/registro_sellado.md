---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
  - append-only
tabla: registro_sellado
clase: RegistroSellado
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: true
---

# `registro_sellado`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `RegistroSellado` · **append-only** (sin `UPDATE`/`DELETE`)

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `bloque_id` | UUID | FK IDX | no | FK, IDX |
| `tipo_entidad` | VARCHAR(25) | — | no | CK |
| `entidad_id` | UUID | IDX | no | IDX, polimorfica |
| `hash_contenido` | VARCHAR(64) | — | no | — |
| `resumen_publico` | JSONB | — | no | — |
| `ocurrido_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `bloque_id` | [[bloque_transparencia]] | 06 | no | [[registro_sellado.bloque_id → bloque_transparencia]] |

## Entidades vecinas

[[bloque_transparencia]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
