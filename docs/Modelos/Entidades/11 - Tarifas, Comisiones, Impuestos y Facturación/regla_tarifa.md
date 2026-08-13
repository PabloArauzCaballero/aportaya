---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: regla_tarifa
clase: ReglaTarifa
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 12
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `regla_tarifa`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `ReglaTarifa`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `concepto_tarifa_id` | UUID | FK IDX | no | FK, IDX |
| `orden` | SMALLINT | — | no | — |
| `condicion` | JSONB | — | no | — |
| `monto_base_desde` | DECIMAL(14,2) | — | sí | NULL |
| `monto_base_hasta` | DECIMAL(14,2) | — | sí | NULL |
| `valor_porcentual` | DECIMAL(7,4) | — | sí | NULL |
| `valor_fijo` | DECIMAL(12,2) | — | sí | NULL |
| `monto_minimo` | DECIMAL(12,2) | — | sí | NULL |
| `monto_maximo` | DECIMAL(12,2) | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `concepto_tarifa_id` | [[concepto_tarifa]] | 11 | no | [[regla_tarifa.concepto_tarifa_id → concepto_tarifa]] |

## Entidades vecinas

[[concepto_tarifa]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
