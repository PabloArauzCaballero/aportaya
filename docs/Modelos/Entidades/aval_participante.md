---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: aval_participante
clase: AvalParticipante
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 12
fk_salientes: 4
fk_entrantes: 1
append_only: false
---

# `aval_participante`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `AvalParticipante`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `participante_avalado_id` | UUID | FK IDX | no | FK, IDX |
| `avalista_usuario_id` | UUID | FK IDX | no | FK, IDX |
| `token_aceptacion_id` | UUID | FK | sí | FK, NULL, M1 |
| `es_participante_del_grupo` | BOOLEAN | — | no | — |
| `monto_maximo_avalado` | DECIMAL(14,2) | — | no | — |
| `alcance` | VARCHAR(15) | — | no | CK |
| `porcentaje_responsabilidad` | DECIMAL(5,2) | — | no | — |
| `aceptado_en` | TIMESTAMPTZ | — | sí | NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `liberado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `avalista_usuario_id` | [[usuario]] | ↗ 01 | no | [[aval_participante.avalista_usuario_id → usuario]] |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[aval_participante.grupo_id → grupo]] |
| `participante_avalado_id` | [[participante]] | ↗ 02 | no | [[aval_participante.participante_avalado_id → participante]] |
| `token_aceptacion_id` | [[token_verificacion]] | ↗ 01 | sí | [[aval_participante.token_aceptacion_id → token_verificacion]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[ejecucion_aval]] | `aval_id` | 08 | [[ejecucion_aval.aval_id → aval_participante]] |

## Entidades vecinas

[[ejecucion_aval]] · [[grupo]] · [[participante]] · [[token_verificacion]] · [[usuario]]

## Notas del modelo

> avalista_usuario_id -> usuario.id (M1) y suele
> coincidir con participante.invitado_por_id (M2):
> formaliza el "yo respondo por el" del pasanaku
> presencial con monto maximo y aceptacion firmada.

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
