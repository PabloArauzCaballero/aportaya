---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: acuerdo_quita
clase: AcuerdoQuita
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `acuerdo_quita`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `AcuerdoQuita`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registro_id` | UUID | FK UQ | no | FK, UQ |
| `aprobado_por` | UUID | FK | no | FK |
| `acuerdo_grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `monto_original` | DECIMAL(14,2) | — | no | — |
| `monto_condonado` | DECIMAL(14,2) | — | no | — |
| `monto_a_pagar` | DECIMAL(14,2) | — | no | — |
| `justificacion` | VARCHAR(400) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `fecha` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `acuerdo_grupo_id` | [[acuerdo]] | ↗ 02 | sí | [[acuerdo_quita.acuerdo_grupo_id → acuerdo]] |
| `aprobado_por` | [[usuario]] | ↗ 01 | no | [[acuerdo_quita.aprobado_por → usuario]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[acuerdo_quita.registro_id → registro_incumplimiento]] |

## Entidades vecinas

[[acuerdo]] · [[registro_incumplimiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
