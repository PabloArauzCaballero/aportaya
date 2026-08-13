---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: solicitud_cierre_billetera
clase: SolicitudCierreBilletera
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `solicitud_cierre_billetera`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `SolicitudCierreBilletera`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `cuenta_billetera_id` | UUID | FK UQ | no | FK, UQ |
| `orden_retiro_id` | UUID | FK | sí | FK, NULL |
| `aprobada_por` | UUID | FK | sí | FK, NULL |
| `motivo` | VARCHAR(200) | — | no | — |
| `saldo_al_solicitar` | DECIMAL(16,2) | — | no | — |
| `destino_saldo` | VARCHAR(20) | — | no | CK |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `solicitada_en` | TIMESTAMPTZ | — | no | — |
| `ejecutada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[solicitud_cierre_billetera.aprobada_por → usuario]] |
| `cuenta_billetera_id` | [[cuenta_billetera]] | 10 | no | [[solicitud_cierre_billetera.cuenta_billetera_id → cuenta_billetera]] |
| `orden_retiro_id` | [[orden_retiro]] | 10 | sí | [[solicitud_cierre_billetera.orden_retiro_id → orden_retiro]] |

## Entidades vecinas

[[cuenta_billetera]] · [[orden_retiro]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
