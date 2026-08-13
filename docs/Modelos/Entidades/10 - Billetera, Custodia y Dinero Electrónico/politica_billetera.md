---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: politica_billetera
clase: PoliticaBilletera
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 11
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `politica_billetera`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `PoliticaBilletera` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `moneda` | CHAR(3) | — | no | — |
| `dias_inactividad_para_limitar` | SMALLINT | — | no | — |
| `permite_transferencia_p2p` | BOOLEAN | — | no | — |
| `requiere_mfa_desde` | DECIMAL(16,2) | — | no | — |
| `ventana_enfriamiento_retiro_horas` | SMALLINT | — | no | — |
| `dias_vigencia_retencion` | SMALLINT | — | no | — |
| `permite_saldo_negativo` | BOOLEAN | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `aprobada_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[politica_billetera.aprobada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[cuenta_billetera]] | `politica_billetera_id` | 10 | [[cuenta_billetera.politica_billetera_id → politica_billetera]] |

## Entidades vecinas

[[cuenta_billetera]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
