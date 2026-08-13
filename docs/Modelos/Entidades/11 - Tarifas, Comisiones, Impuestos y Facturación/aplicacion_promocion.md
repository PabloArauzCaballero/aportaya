---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: aplicacion_promocion
clase: AplicacionPromocion
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 5
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `aplicacion_promocion`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `AplicacionPromocion` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `campana_id` | UUID | FK IDX | no | FK, IDX |
| `devengo_id` | UUID | FK IDX | no | FK, IDX |
| `monto_descontado` | DECIMAL(12,2) | — | no | — |
| `aplicada_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `campana_id` | [[campana_promocional]] | 11 | no | [[aplicacion_promocion.campana_id → campana_promocional]] |
| `devengo_id` | [[devengo_comision]] | 11 | no | [[aplicacion_promocion.devengo_id → devengo_comision]] |

## Entidades vecinas

[[campana_promocional]] · [[devengo_comision]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
