---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: simulacion_tarifa
clase: SimulacionTarifa
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `simulacion_tarifa`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `SimulacionTarifa`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tarifario_id` | UUID | FK IDX | no | FK, IDX |
| `ejecutada_por` | UUID | FK | no | FK |
| `escenario` | JSONB | — | no | — |
| `resultado` | JSONB | — | no | — |
| `delta_ingreso_estimado` | DECIMAL(16,2) | — | no | — |
| `usuarios_impactados` | INTEGER | — | no | — |
| `ejecutada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `ejecutada_por` | [[usuario]] | ↗ 01 | no | [[simulacion_tarifa.ejecutada_por → usuario]] |
| `tarifario_id` | [[tarifario]] | 11 | no | [[simulacion_tarifa.tarifario_id → tarifario]] |

## Entidades vecinas

[[tarifario]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
