---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: cambio_tarifario
clase: CambioTarifario
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `cambio_tarifario`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `CambioTarifario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tarifario_anterior_id` | UUID | FK | no | FK |
| `tarifario_nuevo_id` | UUID | FK UQ | no | FK, UQ |
| `aprobado_por` | UUID | FK | no | FK |
| `tipo_cambio` | VARCHAR(20) | — | no | CK |
| `requiere_preaviso` | BOOLEAN | — | no | — |
| `dias_preaviso` | SMALLINT | — | no | — |
| `fecha_aviso` | TIMESTAMPTZ | — | sí | NULL |
| `canal_aviso` | VARCHAR(40) | — | sí | NULL |
| `usuarios_notificados` | INTEGER | — | no | — |
| `permite_rescision_sin_costo` | BOOLEAN | — | no | — |
| `publicado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobado_por` | [[usuario]] | ↗ 01 | no | [[cambio_tarifario.aprobado_por → usuario]] |
| `tarifario_anterior_id` | [[tarifario]] | 11 | no | [[cambio_tarifario.tarifario_anterior_id → tarifario]] |
| `tarifario_nuevo_id` | [[tarifario]] | 11 | no | [[cambio_tarifario.tarifario_nuevo_id → tarifario]] |

## Entidades vecinas

[[tarifario]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
