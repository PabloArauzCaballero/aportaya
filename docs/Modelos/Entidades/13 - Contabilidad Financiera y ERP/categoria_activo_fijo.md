---
tags:
  - entidad
  - modulo/13-contabilidad-financiera-y-erp
tabla: categoria_activo_fijo
clase: CategoriaActivoFijo
modulo: "13 — Contabilidad Financiera y ERP"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 3
fk_entrantes: 1
append_only: false
---

# `categoria_activo_fijo`

> Módulo [[13_contabilidad_erp|13 — Contabilidad Financiera y ERP]] · clase `CategoriaActivoFijo` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `nombre` | VARCHAR(80) | — | no | — |
| `vida_util_meses` | SMALLINT | — | no | CK: > 0 |
| `metodo_depreciacion` | VARCHAR(20) | — | no | CK |
| `cuenta_activo_id` | UUID | FK | no | FK, M3 |
| `cuenta_depreciacion_id` | UUID | FK | no | FK, M3 |
| `cuenta_gasto_depreciacion_id` | UUID | FK | no | FK, M3 |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `cuenta_activo_id` | [[cuenta_contable]] | ↗ 03 | no | [[categoria_activo_fijo.cuenta_activo_id → cuenta_contable]] |
| `cuenta_depreciacion_id` | [[cuenta_contable]] | ↗ 03 | no | [[categoria_activo_fijo.cuenta_depreciacion_id → cuenta_contable]] |
| `cuenta_gasto_depreciacion_id` | [[cuenta_contable]] | ↗ 03 | no | [[categoria_activo_fijo.cuenta_gasto_depreciacion_id → cuenta_contable]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[activo_fijo]] | `categoria_activo_fijo_id` | 13 | [[activo_fijo.categoria_activo_fijo_id → categoria_activo_fijo]] |

## Entidades vecinas

[[activo_fijo]] · [[cuenta_contable]]

## Notas del modelo

> Las tres cuentas (activo, depreciacion acumulada,
> gasto por depreciacion) son de M3 y deben tener
> es_cuenta_de_movimiento = true. depreciacion_activo
> arma el asiento DEBE cuenta_gasto_depreciacion_id /
> HABER cuenta_depreciacion_id.

## Ver también

- Justificación de negocio: [[13_contabilidad_erp]]
- Diagramas: `docs/entidades/13_contabilidad_erp.puml`
- Índice: [[_Entidades]] · [[Index]]
