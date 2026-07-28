---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: plan_contingencia
clase: PlanContingencia
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 11
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `plan_contingencia`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `PlanContingencia`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK IDX | no | FK, IDX |
| `acuerdo_grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `disparador` | VARCHAR(30) | — | no | CK |
| `tipo` | VARCHAR(30) | — | no | CK |
| `descripcion` | TEXT | — | no | — |
| `impacto_estimado` | DECIMAL(14,2) | — | no | — |
| `requiere_acuerdo` | BOOLEAN | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `propuesto_en` | TIMESTAMPTZ | — | no | — |
| `ejecutado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acuerdo_grupo_id` | [[acuerdo]] | ↗ 02 | sí | [[plan_contingencia.acuerdo_grupo_id → acuerdo]] |
| `grupo_id` | [[grupo]] | ↗ 02 | no | [[plan_contingencia.grupo_id → grupo]] |

## Entidades vecinas

[[acuerdo]] · [[grupo]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
