---
tags:
  - entidad
  - modulo/11-tarifas-comisiones-impuestos-y-facturacion
tabla: exencion_comision
clase: ExencionComision
modulo: "11 — Tarifas, Comisiones, Impuestos y Facturación"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 14
fk_salientes: 5
fk_entrantes: 0
append_only: false
---

# `exencion_comision`

> Módulo [[11_tarifas_comisiones|11 — Tarifas, Comisiones, Impuestos y Facturación]] · clase `ExencionComision` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK | sí | FK, NULL, M1 |
| `grupo_id` | UUID | FK | sí | FK, NULL, M2 |
| `concepto_tarifa_id` | UUID | FK | sí | FK, NULL |
| `segmento_id` | UUID | FK | sí | FK, NULL |
| `autorizada_por` | UUID | FK | no | FK |
| `alcance` | VARCHAR(15) | IDX | no | CK, IDX |
| `motivo` | VARCHAR(25) | — | no | CK |
| `justificacion` | VARCHAR(300) | — | no | — |
| `porcentaje_exencion` | DECIMAL(5,2) | — | no | CK: 0-100 |
| `monto_tope` | DECIMAL(12,2) | — | sí | NULL |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `vigente_hasta` | TIMESTAMPTZ | — | sí | NULL |
| `activa` | BOOLEAN | IDX | no | IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `autorizada_por` | [[usuario]] | ↗ 01 | no | [[exencion_comision.autorizada_por → usuario]] |
| `concepto_tarifa_id` | [[concepto_tarifa]] | 11 | sí | [[exencion_comision.concepto_tarifa_id → concepto_tarifa]] |
| `grupo_id` | [[grupo]] | ↗ 02 | sí | [[exencion_comision.grupo_id → grupo]] |
| `segmento_id` | [[segmento_comercial]] | 11 | sí | [[exencion_comision.segmento_id → segmento_comercial]] |
| `usuario_id` | [[usuario]] | ↗ 01 | sí | [[exencion_comision.usuario_id → usuario]] |

## Entidades vecinas

[[concepto_tarifa]] · [[grupo]] · [[segmento_comercial]] · [[usuario]]

## Ver también

- Justificación de negocio: [[11_tarifas_comisiones]]
- Diagramas: `docs/entidades/11_tarifas_comisiones.puml`
- Índice: [[_Entidades]] · [[Index]]
