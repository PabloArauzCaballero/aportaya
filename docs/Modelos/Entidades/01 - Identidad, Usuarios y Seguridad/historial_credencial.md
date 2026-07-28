---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: historial_credencial
clase: HistorialCredencial
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 4
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `historial_credencial`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `HistorialCredencial`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `hash_contrasena` | VARCHAR(255) | — | no | — |
| `reemplazada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[historial_credencial.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
