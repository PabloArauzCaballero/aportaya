---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: rol_permiso
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [rol_id, permiso_id]
columnas: 2
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `rol_permiso`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]]

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `rol_id` | UUID | PK FK | no | PK, FK |
| `permiso_id` | UUID | PK FK | no | PK, FK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `permiso_id` | [[permiso]] | 01 | no | [[rol_permiso.permiso_id → permiso]] |
| `rol_id` | [[rol]] | 01 | no | [[rol_permiso.rol_id → rol]] |

## Entidades vecinas

[[permiso]] · [[rol]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
