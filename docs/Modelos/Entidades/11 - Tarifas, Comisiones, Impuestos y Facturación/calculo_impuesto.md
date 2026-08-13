---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: calculo_impuesto
clase: CalculoImpuesto
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 8
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `calculo_impuesto`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CalculoImpuesto` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `devengo_id` | UUID | FK IDX | no | FK, IDX |
| `impuesto_id` | UUID | FK | no | FK |
| `base_imponible` | DECIMAL(14,2) | — | no | — |
| `alicuota_aplicada` | DECIMAL(6,4) | — | no | — |
| `monto_impuesto` | DECIMAL(12,2) | — | no | — |
| `incluido_en_precio` | BOOLEAN | — | no | — |
| `periodo_fiscal` | CHAR(7) | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `devengo_id` | [[devengo_comision]] | 11 | no | [[calculo_impuesto.devengo_id → devengo_comision]] |
| `impuesto_id` | [[impuesto]] | 11 | no | [[calculo_impuesto.impuesto_id → impuesto]] |

## Entidades vecinas

[[devengo_comision]] · [[impuesto]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
