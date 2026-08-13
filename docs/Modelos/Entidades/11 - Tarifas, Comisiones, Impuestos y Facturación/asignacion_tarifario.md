---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: asignacion_tarifario
clase: AsignacionTarifario
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
clave_primaria: [id]
columnas: 11
fk_salientes: 5
fk_entrantes: 0
append_only: false
---

# `asignacion_tarifario`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `AsignacionTarifario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `tarifario_id` | UUID | FK IDX | no | FK, IDX |
| `segmento_id` | UUID | FK | sí | FK, NULL |
| `grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `usuario_id` | UUID | FK | sí | FK, NULL, M1 |
| `autorizado_por` | UUID | FK | sí | FK, NULL |
| `ambito` | VARCHAR(15) | IDX | no | CK, IDX |
| `prioridad` | SMALLINT | — | no | — |
| `motivo` | VARCHAR(200) | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `autorizado_por` | [[usuario]] | ↗ 01 | sí | [[asignacion_tarifario.autorizado_por → usuario]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[asignacion_tarifario.grupo_id → grupo]] |
| `segmento_id` | [[segmento_comercial]] | 11 | sí | [[asignacion_tarifario.segmento_id → segmento_comercial]] |
| `tarifario_id` | [[tarifario]] | 11 | no | [[asignacion_tarifario.tarifario_id → tarifario]] |
| `usuario_id` | [[usuario]] | ↗ 01 | sí | [[asignacion_tarifario.usuario_id → usuario]] |

## Entidades vecinas

[[grupo]] · [[segmento_comercial]] · [[tarifario]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
