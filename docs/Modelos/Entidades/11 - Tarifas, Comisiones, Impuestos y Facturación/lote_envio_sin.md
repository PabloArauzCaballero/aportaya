---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: lote_envio_sin
clase: LoteEnvioSin
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 8
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `lote_envio_sin`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `LoteEnvioSin`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tipo_envio` | VARCHAR(25) | — | no | CK |
| `cantidad_documentos` | INTEGER | — | no | — |
| `fecha_envio` | TIMESTAMPTZ | IDX | no | IDX |
| `codigo_recepcion` | VARCHAR(60) | UQ | sí | UQ, NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `respuesta` | JSONB | — | sí | NULL |
| `reintentos` | SMALLINT | — | no | — |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[factura_electronica]] | `lote_envio_sin_id` | 11 | [[factura_electronica.lote_envio_sin_id → lote_envio_sin]] |

## Entidades vecinas

[[factura_electronica]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
