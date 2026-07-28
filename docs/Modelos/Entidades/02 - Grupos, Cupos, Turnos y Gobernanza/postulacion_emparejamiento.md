---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: postulacion_emparejamiento
clase: PostulacionEmparejamiento
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `postulacion_emparejamiento`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `PostulacionEmparejamiento`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX |
| `monto_deseado` | DECIMAL(14,2) | — | no | — |
| `rango_monto_min` | DECIMAL(14,2) | — | no | — |
| `rango_monto_max` | DECIMAL(14,2) | — | no | — |
| `periodicidad_deseada` | VARCHAR(15) | — | no | — |
| `fecha_inicio_deseada` | DATE | — | no | — |
| `preferencia_turno` | VARCHAR(15) | — | no | CK |
| `tolerancia_riesgo` | VARCHAR(15) | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `vigente_hasta` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[postulacion_emparejamiento.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[propuesta_postulacion]] | `postulacion_id` | 02 | [[propuesta_postulacion.postulacion_id → postulacion_emparejamiento]] |

## Entidades vecinas

[[propuesta_postulacion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
