---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: catalogo_hecho_generador
clase: CatalogoHechoGenerador
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `catalogo_hecho_generador`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CatalogoHechoGenerador` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(200) | — | no | — |
| `entidad_evento` | VARCHAR(40) | — | no | — |
| `campo_monto_base` | VARCHAR(40) | — | sí | NULL |
| `unidad_conteo` | VARCHAR(20) | — | no | — |
| `modulo_origen` | CHAR(2) | — | no | — |
| `activo` | BOOLEAN | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[concepto_tarifa]] | `hecho_generador_id` | 11 | [[concepto_tarifa.hecho_generador_id → catalogo_hecho_generador]] |

## Entidades vecinas

[[concepto_tarifa]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
