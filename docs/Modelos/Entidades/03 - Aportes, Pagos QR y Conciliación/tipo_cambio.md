---
tags:
  - entidad
  - modulo/03-aportes-pagos-qr-y-conciliacion
tabla: tipo_cambio
clase: TipoCambio
modulo: "03 — Aportes, Pagos QR y Conciliación"
estereotipo: Objeto de valor
clave_primaria: [id]
columnas: 7
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `tipo_cambio`

> Módulo [[03_aportes_pagos_qr|03 — Aportes, Pagos QR y Conciliación]] · clase `TipoCambio` · Objeto de valor

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `moneda_origen` | CHAR(3) | UQ | no | UQ+moneda_destino+fecha |
| `moneda_destino` | CHAR(3) | — | no | — |
| `fecha` | DATE | IDX | no | IDX |
| `tipo_cambio` | DECIMAL(12,6) | — | no | CK: > 0 |
| `fuente` | VARCHAR(15) | — | no | CK |
| `cargado_en` | TIMESTAMPTZ | — | no | — |

## Notas del modelo

> UNIQUE (moneda_origen, moneda_destino, fecha).
> Lo consume fn_fx_a_usd() del motor de umbrales de la UIF
> (M12): el tipo de cambio aplicado se copia al registro de
> la operacion para que el calculo sea reproducible.

## Ver también

- Justificación de negocio: [[03_aportes_pagos_qr]]
- Diagramas: `docs/entidades/03_aportes_pagos_qr.puml`
- Índice: [[_Entidades]] · [[Index]]
