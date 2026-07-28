---
tags:
  - entidad
  - modulo/02-grupos-cupos-turnos-y-gobernanza
tabla: traspaso_cupo
clase: TraspasoCupo
modulo: "02 — Grupos, Cupos, Turnos y Gobernanza"
clave_primaria: [id]
columnas: 10
fk_salientes: 4
fk_entrantes: 0
append_only: false
---

# `traspaso_cupo`

> Módulo [[02_grupos_turnos|02 — Grupos, Cupos, Turnos y Gobernanza]] · clase `TraspasoCupo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cupo_id` | UUID | FK IDX | no | FK, IDX |
| `participante_origen_id` | UUID | FK | no | FK |
| `participante_destino_id` | UUID | FK | no | FK |
| `motivo` | VARCHAR(30) | — | no | CK |
| `deuda_transferida` | DECIMAL(14,2) | — | no | — |
| `derecho_cobro_transferido` | BOOLEAN | — | no | — |
| `aprobado_por_acuerdo_id` | UUID | FK | sí | FK, NULL |
| `fecha` | TIMESTAMPTZ | — | no | — |
| `revertido_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por_acuerdo_id` | [[acuerdo]] | 02 | sí | [[traspaso_cupo.aprobado_por_acuerdo_id → acuerdo]] |
| `cupo_id` | [[cupo]] | 02 | no | [[traspaso_cupo.cupo_id → cupo]] |
| `participante_destino_id` | [[participante]] | 02 | no | [[traspaso_cupo.participante_destino_id → participante]] |
| `participante_origen_id` | [[participante]] | 02 | no | [[traspaso_cupo.participante_origen_id → participante]] |

## Entidades vecinas

[[acuerdo]] · [[cupo]] · [[participante]]

## Ver también

- Justificación de negocio: [[02_grupos_turnos]]
- Diagramas: `docs/entidades/02_grupos_turnos.puml`
- Índice: [[_Entidades]] · [[Index]]
