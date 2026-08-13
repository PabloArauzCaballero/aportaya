---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: fondo_garantia
clase: FondoGarantia
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 14
fk_salientes: 3
fk_entrantes: 3
append_only: false
---

# `fondo_garantia`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `FondoGarantia` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `ambito` | VARCHAR(20) | — | no | CK |
| `grupo_id` | UUID | FK UQ | sí | FK, NULL, UQ parcial |
| `politica_cobertura_id` | UUID | FK | no | FK |
| `cuenta_contable_id` | UUID | FK | no | FK, M3 |
| `moneda` | CHAR(3) | — | no | — |
| `saldo_disponible` | DECIMAL(16,2) | — | no | CK: >= 0 |
| `saldo_comprometido` | DECIMAL(16,2) | — | no | — |
| `total_aportado` | DECIMAL(16,2) | — | no | — |
| `total_cubierto` | DECIMAL(16,2) | — | no | — |
| `total_recuperado` | DECIMAL(16,2) | — | no | — |
| `total_castigado` | DECIMAL(16,2) | — | no | — |
| `estado` | VARCHAR(20) | — | no | CK |
| `version` | INTEGER | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_contable_id` | [[cuenta_contable]] | ↗ 03 | no | [[fondo_garantia.cuenta_contable_id → cuenta_contable]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[fondo_garantia.grupo_id → grupo]] |
| `politica_cobertura_id` | [[politica_cobertura]] | 08 | no | [[fondo_garantia.politica_cobertura_id → politica_cobertura]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[cobertura_incumplimiento]] | `fondo_id` | 08 | [[cobertura_incumplimiento.fondo_id → fondo_garantia]] |
| [[devolucion_fondo]] | `fondo_id` | 08 | [[devolucion_fondo.fondo_id → fondo_garantia]] |
| [[movimiento_fondo]] | `fondo_id` | 08 | [[movimiento_fondo.fondo_id → fondo_garantia]] |

## Entidades vecinas

[[cobertura_incumplimiento]] · [[cuenta_contable]] · [[devolucion_fondo]] · [[grupo]] · [[movimiento_fondo]] · [[politica_cobertura]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
