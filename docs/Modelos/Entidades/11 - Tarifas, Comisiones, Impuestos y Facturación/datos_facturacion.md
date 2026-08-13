---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: datos_facturacion
clase: DatosFacturacion
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `datos_facturacion`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `DatosFacturacion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK IDX | no | FK, IDX, M1 |
| `tipo_documento` | VARCHAR(5) | — | no | CK |
| `numero_documento` | VARCHAR(20) | UQ | no | UQ+usuario_id |
| `razon_social` | VARCHAR(150) | — | no | — |
| `email_envio` | VARCHAR(120) | — | no | — |
| `es_predeterminado` | BOOLEAN | — | no | — |
| `verificado` | BOOLEAN | — | no | — |
| `actualizado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[datos_facturacion.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[factura_electronica]] | `datos_facturacion_id` | 11 | [[factura_electronica.datos_facturacion_id → datos_facturacion]] |

## Entidades vecinas

[[factura_electronica]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
