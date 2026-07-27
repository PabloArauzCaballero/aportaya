---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: solicitud_baja
clase: SolicitudBaja
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 6
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `solicitud_baja`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `SolicitudBaja`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `motivo` | VARCHAR(160) | — | no | — |
| `solicitada_en` | TIMESTAMPTZ | — | no | — |
| `fecha_efectiva` | TIMESTAMPTZ | — | sí | NULL |
| `bloqueada_por_obligaciones` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[solicitud_baja.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
