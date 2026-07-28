---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: bloqueo_cuenta
clase: BloqueoCuenta
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 7
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `bloqueo_cuenta`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `BloqueoCuenta`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `motivo` | VARCHAR(30) | — | no | CK |
| `bloqueada_en` | TIMESTAMPTZ | — | no | — |
| `desbloquea_en` | TIMESTAMPTZ | — | sí | NULL |
| `liberada_en` | TIMESTAMPTZ | — | sí | NULL |
| `liberada_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `liberada_por` | [[usuario]] | 01 | sí | [[bloqueo_cuenta.liberada_por → usuario]] |
| `usuario_id` | [[usuario]] | 01 | no | [[bloqueo_cuenta.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
