---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: subrogacion
clase: Subrogacion
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `subrogacion`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `Subrogacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cobertura_id` | UUID | FK UQ | no | FK, UQ |
| `deuda_id` | UUID | FK UQ | no | FK, UQ |
| `acreedor_original` | VARCHAR(30) | — | no | — |
| `acreedor_subrogado` | VARCHAR(30) | — | no | — |
| `monto_subrogado` | DECIMAL(14,2) | — | no | — |
| `fecha` | TIMESTAMPTZ | — | no | — |
| `documento_respaldo_url` | VARCHAR(255) | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cobertura_id` | [[cobertura_incumplimiento]] | 08 | no | [[subrogacion.cobertura_id → cobertura_incumplimiento]] |
| `deuda_id` | [[deuda_participante]] | 08 | no | [[subrogacion.deuda_id → deuda_participante]] |

## Entidades vecinas

[[cobertura_incumplimiento]] · [[deuda_participante]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
