---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: reemplazo_participante
clase: ReemplazoParticipante
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 12
fk_salientes: 6
fk_entrantes: 1
append_only: false
---

# `reemplazo_participante`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `ReemplazoParticipante`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `cupo_id` | UUID | FK | no | FK |
| `registro_id` | UUID | FK | sí | FK, NULL |
| `participante_saliente_id` | UUID | FK | no | FK |
| `participante_entrante_id` | UUID | FK | sí | FK, NULL |
| `acuerdo_grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `deuda_asumida_por_entrante` | DECIMAL(14,2) | — | no | — |
| `deuda_retenida_por_saliente` | DECIMAL(14,2) | — | no | — |
| `conserva_orden_de_turno` | BOOLEAN | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `fecha` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acuerdo_grupo_id` | [[acuerdo]] | ↗ 02 | sí | [[reemplazo_participante.acuerdo_grupo_id → acuerdo]] |
| `cupo_id` | [[cupo]] | ↗ 02 | no | [[reemplazo_participante.cupo_id → cupo]] |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[reemplazo_participante.grupo_id → grupo]] |
| `participante_entrante_id` | [[participante]] | ↗ 02 | sí | [[reemplazo_participante.participante_entrante_id → participante]] |
| `participante_saliente_id` | [[participante]] | ↗ 02 | no | [[reemplazo_participante.participante_saliente_id → participante]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | sí | [[reemplazo_participante.registro_id → registro_incumplimiento]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[candidato_reemplazo]] | `reemplazo_id` | 08 | [[candidato_reemplazo.reemplazo_id → reemplazo_participante]] |

## Entidades vecinas

[[acuerdo]] · [[candidato_reemplazo]] · [[cupo]] · [[grupo]] · [[participante]] · [[registro_incumplimiento]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
