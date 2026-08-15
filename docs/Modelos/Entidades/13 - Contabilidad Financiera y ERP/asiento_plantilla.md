---
tags:
  - entidad
  - modulo/13-contabilidad-financiera-y-erp
tabla: asiento_plantilla
clase: AsientoPlantilla
modulo: "13 — Contabilidad Financiera y ERP"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `asiento_plantilla`

> Módulo [[13_contabilidad_erp|13 — Contabilidad Financiera y ERP]] · clase `AsientoPlantilla` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(30) | UQ | no | UQ |
| `nombre` | VARCHAR(100) | — | no | — |
| `glosa` | VARCHAR(200) | — | no | — |
| `periodicidad` | VARCHAR(15) | — | no | CK |
| `activa` | BOOLEAN | — | no | — |
| `creada_por` | UUID | FK | no | FK |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `creada_por` | [[usuario]] | ↗ 01 | no | [[asiento_plantilla.creada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[linea_plantilla_asiento]] | `plantilla_id` | 13 | [[linea_plantilla_asiento.plantilla_id → asiento_plantilla]] |

## Entidades vecinas

[[linea_plantilla_asiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[13_contabilidad_erp]]
- Diagramas: `docs/entidades/13_contabilidad_erp.puml`
- Índice: [[_Entidades]] · [[Index]]
