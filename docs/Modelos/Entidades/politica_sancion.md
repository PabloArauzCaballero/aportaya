---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: politica_sancion
clase: PoliticaSancion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 3
append_only: false
---

# `politica_sancion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `PoliticaSancion` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `version` | VARCHAR(20) | — | no | — |
| `requiere_acuerdo_grupo` | BOOLEAN | — | no | — |
| `plazo_descargo_dias` | SMALLINT | — | no | — |
| `plazo_apelacion_dias` | SMALLINT | — | no | — |
| `prescribe_en_dias` | SMALLINT | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[politica_sancion.grupo_id → grupo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[configuracion_grupo]] | `politica_sancion_id` | ↗ 02 | [[configuracion_grupo.politica_sancion_id → politica_sancion]] |
| [[matriz_sancion]] | `politica_id` | 08 | [[matriz_sancion.politica_id → politica_sancion]] |
| [[token_verificacion]] | `politica_id` | ↗ 01 | [[token_verificacion.politica_id → politica_sancion]] |

## Entidades vecinas

[[configuracion_grupo]] · [[grupo]] · [[matriz_sancion]] · [[token_verificacion]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
