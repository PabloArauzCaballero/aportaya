---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: punto_atencion
clase: PuntoAtencion
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 12
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `punto_atencion`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `PuntoAtencion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(20) | UQ | no | UQ |
| `tipo` | VARCHAR(25) | — | no | CK |
| `razon_social` | VARCHAR(120) | — | no | — |
| `nit` | VARCHAR(20) | — | sí | NULL |
| `departamento` | VARCHAR(30) | — | no | — |
| `municipio` | VARCHAR(60) | — | no | — |
| `direccion` | VARCHAR(200) | — | no | — |
| `responsable_usuario_id` | UUID | FK | sí | FK, NULL |
| `limite_efectivo_diario` | DECIMAL(16,2) | — | no | — |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `habilitado_desde` | DATE | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `responsable_usuario_id` | [[usuario]] | ↗ 01 | sí | [[punto_atencion.responsable_usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[arqueo_punto_atencion]] | `punto_atencion_id` | 10 | [[arqueo_punto_atencion.punto_atencion_id → punto_atencion]] |
| [[orden_recarga]] | `punto_atencion_id` | 10 | [[orden_recarga.punto_atencion_id → punto_atencion]] |

## Entidades vecinas

[[arqueo_punto_atencion]] · [[orden_recarga]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
