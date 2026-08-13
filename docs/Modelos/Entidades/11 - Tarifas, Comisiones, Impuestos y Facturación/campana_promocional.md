---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: campana_promocional
clase: CampanaPromocional
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `campana_promocional`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CampanaPromocional`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `nombre` | VARCHAR(120) | — | no | — |
| `tipo` | VARCHAR(30) | — | no | CK |
| `presupuesto_maximo` | DECIMAL(16,2) | — | sí | NULL |
| `presupuesto_consumido` | DECIMAL(16,2) | — | no | — |
| `condiciones` | JSONB | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `aprobada_por` | UUID | FK | no | FK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | no | [[campana_promocional.aprobada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[aplicacion_promocion]] | `campana_id` | 11 | [[aplicacion_promocion.campana_id → campana_promocional]] |

## Entidades vecinas

[[aplicacion_promocion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
