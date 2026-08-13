---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: descuadre_custodia
clase: DescuadreCustodia
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 0
append_only: false
---

# `descuadre_custodia`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `DescuadreCustodia`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `conciliacion_custodia_id` | UUID | FK IDX | no | FK, IDX |
| `incidente_operativo_id` | UUID | FK | sí | FK, NULL, M9 |
| `resuelto_por` | UUID | FK | sí | FK, NULL |
| `tipo` | VARCHAR(25) | — | no | CK |
| `monto_diferencia` | DECIMAL(18,2) | — | no | — |
| `severidad` | VARCHAR(10) | IDX | no | CK, IDX |
| `explicacion` | VARCHAR(500) | — | sí | NULL |
| `plan_accion` | VARCHAR(500) | — | sí | NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `detectado_en` | TIMESTAMPTZ | — | no | — |
| `resuelto_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `conciliacion_custodia_id` | [[conciliacion_custodia]] | 10 | no | [[descuadre_custodia.conciliacion_custodia_id → conciliacion_custodia]] |
| `incidente_operativo_id` | [[incidente_operativo]] | ↗ 09 | sí | [[descuadre_custodia.incidente_operativo_id → incidente_operativo]] |
| `resuelto_por` | [[usuario]] | ↗ 01 | sí | [[descuadre_custodia.resuelto_por → usuario]] |

## Entidades vecinas

[[conciliacion_custodia]] · [[incidente_operativo]] · [[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
