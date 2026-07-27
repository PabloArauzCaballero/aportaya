---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: solicitud_permuta
clase: SolicitudPermuta
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 11
fk_salientes: 4
fk_entrantes: 0
append_only: false
---

# `solicitud_permuta`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `SolicitudPermuta`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `turno_origen_id` | UUID | FK IDX | no | FK, IDX |
| `turno_destino_id` | UUID | FK | no | FK |
| `solicitante_id` | UUID | FK | no | FK |
| `contraparte_id` | UUID | FK | no | FK |
| `motivo` | VARCHAR(200) | — | no | — |
| `compensacion_ofrecida` | DECIMAL(14,2) | — | sí | NULL |
| `estado` | VARCHAR(20) | — | no | CK |
| `aprobada_por_organizador` | BOOLEAN | — | no | — |
| `fecha_solicitud` | TIMESTAMPTZ | — | no | — |
| `fecha_ejecucion` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `contraparte_id` | [[participante]] | 02 | no | [[solicitud_permuta.contraparte_id → participante]] |
| `solicitante_id` | [[participante]] | 02 | no | [[solicitud_permuta.solicitante_id → participante]] |
| `turno_destino_id` | [[turno]] | 02 | no | [[solicitud_permuta.turno_destino_id → turno]] |
| `turno_origen_id` | [[turno]] | 02 | no | [[solicitud_permuta.turno_origen_id → turno]] |

## Entidades vecinas

[[participante]] · [[turno]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
