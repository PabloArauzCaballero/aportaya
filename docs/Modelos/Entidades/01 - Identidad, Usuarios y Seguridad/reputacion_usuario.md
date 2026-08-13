---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: reputacion_usuario
clase: ReputacionUsuario
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `reputacion_usuario`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `ReputacionUsuario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `puntaje` | DECIMAL(6,2) | — | no | — |
| `indice_puntualidad` | DECIMAL(5,2) | — | no | — |
| `total_obligaciones` | INTEGER | — | no | — |
| `obligaciones_cumplidas` | INTEGER | — | no | — |
| `obligaciones_en_mora` | INTEGER | — | no | — |
| `incumplimientos_graves` | INTEGER | — | no | — |
| `grupos_completados` | INTEGER | — | no | — |
| `version_modelo` | VARCHAR(20) | — | no | — |
| `calculado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[reputacion_usuario.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
