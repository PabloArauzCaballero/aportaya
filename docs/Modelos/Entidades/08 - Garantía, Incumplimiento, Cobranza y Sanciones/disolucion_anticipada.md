---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: disolucion_anticipada
clase: DisolucionAnticipada
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 2
fk_entrantes: 1
append_only: false
---

# `disolucion_anticipada`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `DisolucionAnticipada`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK UQ | no | FK, UQ |
| `acuerdo_grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `causal` | VARCHAR(25) | — | no | CK |
| `motivo` | VARCHAR(400) | — | no | — |
| `total_aportado_grupo` | DECIMAL(16,2) | — | no | — |
| `total_entregado` | DECIMAL(16,2) | — | no | — |
| `saldo_a_distribuir` | DECIMAL(16,2) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `iniciada_en` | TIMESTAMPTZ | — | no | — |
| `cerrada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acuerdo_grupo_id` | [[acuerdo]] | ↗ 02 | sí | [[disolucion_anticipada.acuerdo_grupo_id → acuerdo]] |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[disolucion_anticipada.grupo_id → grupo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[liquidacion_participante]] | `disolucion_id` | 08 | [[liquidacion_participante.disolucion_id → disolucion_anticipada]] |

## Entidades vecinas

[[acuerdo]] · [[grupo]] · [[liquidacion_participante]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
