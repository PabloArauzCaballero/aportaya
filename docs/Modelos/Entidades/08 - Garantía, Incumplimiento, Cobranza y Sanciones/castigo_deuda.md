---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: castigo_deuda
clase: CastigoDeuda
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `castigo_deuda`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `CastigoDeuda`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `deuda_id` | UUID | FK UQ | no | FK, UQ |
| `aprobado_por` | UUID | FK | no | FK |
| `asiento_contable_id` | UUID | FK | sí | FK, NULL, M3 |
| `monto_castigado` | DECIMAL(14,2) | — | no | — |
| `motivo` | VARCHAR(30) | — | no | CK |
| `justificacion` | VARCHAR(400) | — | no | — |
| `mantiene_registro_reputacional` | BOOLEAN | — | no | — |
| `fecha` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por` | [[usuario]] | ↗ 01 | no | [[castigo_deuda.aprobado_por → usuario]] |
| `asiento_contable_id` | [[asiento_contable]] | ↗ 03 | sí | [[castigo_deuda.asiento_contable_id → asiento_contable]] |
| `deuda_id` | [[deuda_participante]] | 08 | no | [[castigo_deuda.deuda_id → deuda_participante]] |

## Entidades vecinas

[[asiento_contable]] · [[deuda_participante]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
