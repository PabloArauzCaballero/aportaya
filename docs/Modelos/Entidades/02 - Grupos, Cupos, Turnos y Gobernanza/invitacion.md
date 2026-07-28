---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: invitacion
clase: Invitacion
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `invitacion`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `Invitacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `telefono_invitado` | VARCHAR(20) | IDX | no | IDX |
| `nombre_sugerido` | VARCHAR(80) | — | sí | NULL |
| `emisor_id` | UUID | FK | no | FK |
| `token_id` | UUID | FK UQ | no | FK, UQ, M1 |
| `canal` | VARCHAR(15) | — | no | CK |
| `estado` | VARCHAR(15) | — | no | CK |
| `envios_realizados` | SMALLINT | — | no | — |
| `fecha_envio` | TIMESTAMPTZ | — | no | — |
| `fecha_expiracion` | TIMESTAMPTZ | — | no | — |
| `fecha_respuesta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `emisor_id` | [[usuario]] | ↗ 01 | no | [[invitacion.emisor_id → usuario]] |
| `grupo_id` | [[grupo]] | 02 | no | [[invitacion.grupo_id → grupo]] |
| `token_id` | [[token_verificacion]] | ↗ 01 | no | [[invitacion.token_id → token_verificacion]] |

## Entidades vecinas

[[grupo]] · [[token_verificacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
