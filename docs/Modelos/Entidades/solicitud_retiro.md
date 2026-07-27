---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: solicitud_retiro
clase: SolicitudRetiro
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `solicitud_retiro`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `SolicitudRetiro`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `participante_id` | UUID | FK UQ | no | FK, UQ parcial |
| `motivo` | VARCHAR(200) | — | no | — |
| `solicitado_en` | TIMESTAMPTZ | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `requiere_reemplazo` | BOOLEAN | — | no | — |
| `liquidacion_calculada` | DECIMAL(14,2) | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `participante_id` | [[participante]] | 02 | no | [[solicitud_retiro.participante_id → participante]] |

## Entidades vecinas

[[participante]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
