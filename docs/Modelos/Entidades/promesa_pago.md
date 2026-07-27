---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: promesa_pago
clase: PromesaPago
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 10
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `promesa_pago`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `PromesaPago`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `gestion_id` | UUID | FK IDX | no | FK, IDX |
| `monto_prometido` | DECIMAL(14,2) | — | no | — |
| `fecha_prometida` | DATE | IDX | no | IDX |
| `canal_compromiso` | VARCHAR(20) | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `monto_efectivo` | DECIMAL(14,2) | — | no | — |
| `registrada_por` | UUID | FK | sí | FK, NULL |
| `creada_en` | TIMESTAMPTZ | — | no | — |
| `evaluada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `gestion_id` | [[gestion_cobranza]] | 08 | no | [[promesa_pago.gestion_id → gestion_cobranza]] |
| `registrada_por` | [[usuario]] | ↗ 01 | sí | [[promesa_pago.registrada_por → usuario]] |

## Entidades vecinas

[[gestion_cobranza]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
