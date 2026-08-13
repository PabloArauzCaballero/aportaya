---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: matriz_sancion
clase: MatrizSancion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `matriz_sancion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `MatrizSancion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `politica_id` | UUID | FK IDX | no | FK, IDX |
| `tipo_incumplimiento` | VARCHAR(40) | UQ | no | UQ+severidad+numero_reincidencia |
| `severidad` | VARCHAR(10) | — | no | CK |
| `numero_reincidencia` | SMALLINT | — | no | — |
| `tipo_sancion` | VARCHAR(35) | — | no | CK |
| `valor` | DECIMAL(12,2) | — | no | — |
| `duracion_dias` | SMALLINT | — | sí | NULL |
| `es_automatica` | BOOLEAN | — | no | — |
| `requiere_revision_humana` | BOOLEAN | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `politica_id` | [[politica_sancion]] | 08 | no | [[matriz_sancion.politica_id → politica_sancion]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[sancion]] | `matriz_id` | 08 | [[sancion.matriz_id → matriz_sancion]] |

## Entidades vecinas

[[politica_sancion]] · [[sancion]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
