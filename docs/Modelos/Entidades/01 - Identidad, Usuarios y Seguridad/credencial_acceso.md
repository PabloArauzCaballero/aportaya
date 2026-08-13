---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: credencial_acceso
clase: CredencialAcceso
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `credencial_acceso`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `CredencialAcceso`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `hash_contrasena` | VARCHAR(255) | — | no | — |
| `algoritmo` | VARCHAR(20) | — | no | — |
| `parametros_kdf` | JSONB | — | no | — |
| `requiere_cambio` | BOOLEAN | — | no | — |
| `cambiada_en` | TIMESTAMPTZ | — | no | — |
| `expira_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[credencial_acceso.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
