---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: arqueo_punto_atencion
clase: ArqueoPuntoAtencion
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 13
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `arqueo_punto_atencion`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `ArqueoPuntoAtencion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `punto_atencion_id` | UUID | FK IDX | no | FK, IDX |
| `arqueado_por` | UUID | FK | no | FK |
| `fecha` | DATE | UQ | no | UQ+punto_atencion_id |
| `saldo_inicial` | DECIMAL(16,2) | — | no | — |
| `total_recargas` | DECIMAL(16,2) | — | no | — |
| `total_retiros` | DECIMAL(16,2) | — | no | — |
| `saldo_teorico` | DECIMAL(16,2) | — | no | — |
| `saldo_contado` | DECIMAL(16,2) | — | no | — |
| `diferencia` | DECIMAL(16,2) | — | no | GENERATED |
| `estado` | VARCHAR(15) | — | no | CK |
| `observaciones` | VARCHAR(300) | — | sí | NULL |
| `cerrado_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `arqueado_por` | [[usuario]] | ↗ 01 | no | [[arqueo_punto_atencion.arqueado_por → usuario]] |
| `punto_atencion_id` | [[punto_atencion]] | 10 | no | [[arqueo_punto_atencion.punto_atencion_id → punto_atencion]] |

## Entidades vecinas

[[punto_atencion]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
