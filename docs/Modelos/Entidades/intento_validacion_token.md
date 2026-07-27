---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: intento_validacion_token
clase: IntentoValidacionToken
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `intento_validacion_token`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `IntentoValidacionToken`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `token_id` | UUID | FK IDX | no | FK, IDX |
| `fecha_hora` | TIMESTAMPTZ | — | no | — |
| `resultado` | VARCHAR(30) | — | no | CK |
| `ip_origen` | INET | — | no | — |
| `agente_usuario` | VARCHAR(255) | — | no | — |
| `huella_dispositivo` | VARCHAR(128) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `token_id` | [[token_verificacion]] | 01 | no | [[intento_validacion_token.token_id → token_verificacion]] |

## Entidades vecinas

[[token_verificacion]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
