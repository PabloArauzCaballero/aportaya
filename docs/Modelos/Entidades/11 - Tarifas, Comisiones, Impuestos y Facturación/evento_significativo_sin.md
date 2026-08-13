---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: evento_significativo_sin
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 14
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `evento_significativo_sin`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]]

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registrado_por` | UUID | FK | sí | FK, NULL |
| `codigo_evento` | VARCHAR(10) | IDX | no | CK, IDX |
| `descripcion` | VARCHAR(200) | — | no | — |
| `sucursal` | SMALLINT | — | no | — |
| `punto_venta` | SMALLINT | — | no | — |
| `cufd_evento` | VARCHAR(120) | — | no | — |
| `fecha_inicio` | TIMESTAMPTZ | IDX | no | IDX |
| `fecha_fin` | TIMESTAMPTZ | — | sí | NULL |
| `cantidad_documentos_offline` | INTEGER | — | no | — |
| `plazo_registro` | TIMESTAMPTZ | IDX | no | IDX |
| `registrado_en_sin` | TIMESTAMPTZ | — | sí | NULL |
| `codigo_recepcion_evento` | VARCHAR(60) | UQ | sí | UQ, NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `registrado_por` | [[usuario]] | ↗ 01 | sí | [[evento_significativo_sin.registrado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[factura_electronica]] | `evento_significativo_id` | 11 | [[factura_electronica.evento_significativo_id → evento_significativo_sin]] |

## Entidades vecinas

[[factura_electronica]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
