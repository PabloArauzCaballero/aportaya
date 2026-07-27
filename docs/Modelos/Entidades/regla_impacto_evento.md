---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: regla_impacto_evento
clase: ReglaImpactoEvento
modulo: "06 — Transparencia y Reputación"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `regla_impacto_evento`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `ReglaImpactoEvento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `modelo_id` | UUID | FK IDX | no | FK, IDX |
| `tipo_evento` | VARCHAR(40) | UQ | no | UQ+modelo_id |
| `codigo_factor` | VARCHAR(40) | — | no | — |
| `impacto_base` | DECIMAL(6,2) | — | no | — |
| `multiplicador_por_reincidencia` | DECIMAL(4,2) | — | no | — |
| `impacto_maximo` | DECIMAL(6,2) | — | no | — |
| `requiere_confirmacion` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `modelo_id` | [[modelo_scoring]] | 06 | no | [[regla_impacto_evento.modelo_id → modelo_scoring]] |

## Entidades vecinas

[[modelo_scoring]]

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
