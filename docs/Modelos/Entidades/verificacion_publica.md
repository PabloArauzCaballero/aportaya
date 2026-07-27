---
tags:
  - entidad
  - modulo/06-transparencia-y-reputacion
tabla: verificacion_publica
clase: VerificacionPublica
modulo: "06 — Transparencia y Reputación"
clave_primaria: [codigo]
columnas: 6
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `verificacion_publica`

> Módulo [[06_transparencia_reputacion|06 — Transparencia y Reputación]] · clase `VerificacionPublica`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `codigo` | VARCHAR(40) | PK | no | PK |
| `tipo_documento` | VARCHAR(30) | — | no | CK |
| `referencia_id` | UUID | IDX | no | IDX |
| `hash_esperado` | VARCHAR(64) | — | no | — |
| `consultas` | INTEGER | — | no | — |
| `ultima_consulta_en` | TIMESTAMPTZ | — | sí | NULL |

## Ver también

- Justificación de negocio: [[06_transparencia_reputacion]]
- Diagramas: `docs/entidades/06_transparencia_reputacion.puml`
- Índice: [[_Entidades]] · [[Index]]
