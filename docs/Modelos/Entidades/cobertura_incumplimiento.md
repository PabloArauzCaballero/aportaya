---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: cobertura_incumplimiento
clase: CoberturaIncumplimiento
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 16
fk_salientes: 7
fk_entrantes: 2
append_only: false
---

# `cobertura_incumplimiento`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `CoberturaIncumplimiento` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `fondo_id` | UUID | FK IDX | no | FK, IDX |
| `registro_id` | UUID | FK UQ | no | FK, UQ |
| `obligacion_id` | UUID | FK UQ | no | FK, UQ, M3 |
| `periodo_id` | UUID | FK | no | FK, M2 |
| `movimiento_fondo_id` | UUID | FK | sí | FK, NULL |
| `asiento_contable_id` | UUID | FK | sí | FK, NULL, M3 |
| `aprobada_por` | UUID | FK | sí | FK, NULL |
| `monto_solicitado` | DECIMAL(14,2) | — | no | — |
| `monto_cubierto` | DECIMAL(14,2) | — | no | — |
| `porcentaje_cobertura` | DECIMAL(5,2) | — | no | — |
| `estado` | VARCHAR(25) | IDX | no | CK, IDX |
| `requirio_aprobacion_manual` | BOOLEAN | — | no | — |
| `motivo_rechazo` | VARCHAR(300) | — | sí | NULL |
| `solicitada_en` | TIMESTAMPTZ | — | no | — |
| `aplicada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[cobertura_incumplimiento.aprobada_por → usuario]] |
| `asiento_contable_id` | [[asiento_contable]] | ↗ 03 | sí | [[cobertura_incumplimiento.asiento_contable_id → asiento_contable]] |
| `fondo_id` | [[fondo_garantia]] | 08 | no | [[cobertura_incumplimiento.fondo_id → fondo_garantia]] |
| `movimiento_fondo_id` | [[movimiento_fondo]] | 08 | sí | [[cobertura_incumplimiento.movimiento_fondo_id → movimiento_fondo]] |
| `obligacion_id` | [[obligacion_aporte]] | ↗ 03 | no | [[cobertura_incumplimiento.obligacion_id → obligacion_aporte]] |
| `periodo_id` | [[periodo]] | ↗ 02 | no | [[cobertura_incumplimiento.periodo_id → periodo]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[cobertura_incumplimiento.registro_id → registro_incumplimiento]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[deuda_participante]] | `cobertura_id` | 08 | [[deuda_participante.cobertura_id → cobertura_incumplimiento]] |
| [[subrogacion]] | `cobertura_id` | 08 | [[subrogacion.cobertura_id → cobertura_incumplimiento]] |

## Entidades vecinas

[[asiento_contable]] · [[deuda_participante]] · [[fondo_garantia]] · [[movimiento_fondo]] · [[obligacion_aporte]] · [[periodo]] · [[registro_incumplimiento]] · [[subrogacion]] · [[usuario]]

## Notas del modelo

> UNIQUE (obligacion_id): el fondo cubre una
> obligacion una sola vez. La aplicacion es
> atomica con movimiento_fondo y con el asiento
> contable del modulo 3 (misma transaccion),
> para que el saldo del fondo nunca mienta.

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
