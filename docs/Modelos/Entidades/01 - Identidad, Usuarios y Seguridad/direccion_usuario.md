---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: direccion_usuario
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `direccion_usuario`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]]

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `departamento` | VARCHAR(60) | — | no | — |
| `ciudad` | VARCHAR(60) | — | no | — |
| `zona` | VARCHAR(80) | — | no | — |
| `detalle` | VARCHAR(160) | — | no | — |
| `latitud` | DECIMAL(9,6) | — | sí | NULL |
| `longitud` | DECIMAL(9,6) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[direccion_usuario.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
