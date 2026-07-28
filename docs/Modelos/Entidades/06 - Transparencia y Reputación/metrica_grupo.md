---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: metrica_grupo
clase: MetricaGrupo
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `metrica_grupo`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `MetricaGrupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `periodo_id` | UUID | FK | sí | FK, NULL |
| `codigo` | VARCHAR(40) | UQ | no | UQ+grupo_id+periodo_id |
| `valor` | DECIMAL(12,4) | — | no | — |
| `unidad` | VARCHAR(15) | — | no | — |
| `umbral_alerta` | DECIMAL(12,4) | — | sí | NULL |
| `en_alerta` | BOOLEAN | IDX | no | IDX |
| `calculada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[metrica_grupo.grupo_id → grupo]] |
| `periodo_id` | [[periodo]] | ↗ 02 | sí | [[metrica_grupo.periodo_id → periodo]] |

## Entidades vecinas

[[grupo]] · [[periodo]]

## Notas del modelo

> Alimenta el panel de transparencia y las
> alertas tempranas del modulo 8
> (mora concentrada = grupo en riesgo de colapso).

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
