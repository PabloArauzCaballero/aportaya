---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: politica_mora
clase: PoliticaMora
modulo: "03 — Aportes, Pagos QR y Conciliación"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 2
append_only: false
---

# `politica_mora`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `PoliticaMora` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `grupo_id` | UUID | FK | sí | FK, NULL |
| `dias_gracia` | SMALLINT | — | no | — |
| `tipo_recargo` | VARCHAR(20) | — | no | CK |
| `valor_recargo` | DECIMAL(10,2) | — | no | — |
| `tope_recargo` | DECIMAL(14,2) | — | no | — |
| `dias_para_mora_grave` | SMALLINT | — | no | — |
| `dias_para_incumplimiento` | SMALLINT | — | no | — |
| `aplica_automatico` | BOOLEAN | — | no | — |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[politica_mora.grupo_id → grupo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[configuracion_grupo]] | `politica_mora_id` | ↗ 02 | [[configuracion_grupo.politica_mora_id → politica_mora]] |
| [[obligacion_aporte]] | `politica_mora_id` | 03 | [[obligacion_aporte.politica_mora_id → politica_mora]] |

## Entidades vecinas

[[configuracion_grupo]] · [[grupo]] · [[obligacion_aporte]]

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
