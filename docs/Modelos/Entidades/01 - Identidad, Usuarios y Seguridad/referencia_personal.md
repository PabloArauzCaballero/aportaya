---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: referencia_personal
clase: ReferenciaPersonal
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `referencia_personal`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `ReferenciaPersonal`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `nombre` | VARCHAR(120) | — | no | — |
| `telefono` | VARCHAR(20) | — | no | — |
| `relacion` | VARCHAR(20) | — | no | CK |
| `verificada` | BOOLEAN | — | no | — |
| `verificada_en` | TIMESTAMPTZ | — | sí | NULL |
| `acepta_ser_avalista` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[referencia_personal.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
