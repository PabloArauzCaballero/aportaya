---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: segmento_comercial
clase: SegmentoComercial
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 2
append_only: false
---

# `segmento_comercial`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `SegmentoComercial`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `descripcion` | VARCHAR(200) | — | no | — |
| `criterio` | JSONB | — | no | — |
| `prioridad` | SMALLINT | — | no | — |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[asignacion_tarifario]] | `segmento_id` | 11 | [[asignacion_tarifario.segmento_id → segmento_comercial]] |
| [[exencion_comision]] | `segmento_id` | 11 | [[exencion_comision.segmento_id → segmento_comercial]] |

## Entidades vecinas

[[asignacion_tarifario]] · [[exencion_comision]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
