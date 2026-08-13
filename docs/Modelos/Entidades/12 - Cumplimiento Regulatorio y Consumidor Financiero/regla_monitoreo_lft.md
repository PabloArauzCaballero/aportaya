---
tags:
  - entidad
  - modulo/12-cumplimiento-regulatorio-y-consumidor-financiero
tabla: regla_monitoreo_lft
clase: ReglaMonitoreoLft
modulo: "12 — Cumplimiento Regulatorio y Consumidor Financiero"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 14
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `regla_monitoreo_lft`

> Módulo [[12_cumplimiento_asfi|12 — Cumplimiento Regulatorio y Consumidor Financiero]] · clase `ReglaMonitoreoLft` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `tipologia` | VARCHAR(80) | — | no | — |
| `descripcion` | VARCHAR(300) | — | no | — |
| `expresion` | JSONB | — | no | — |
| `ventana_evaluacion` | VARCHAR(20) | — | no | — |
| `umbral_monto` | DECIMAL(16,2) | — | sí | NULL |
| `umbral_cantidad` | INTEGER | — | sí | NULL |
| `severidad` | VARCHAR(10) | — | no | CK |
| `accion_automatica` | VARCHAR(30) | — | no | CK |
| `fuente_normativa` | VARCHAR(120) | — | no | — |
| `activa` | BOOLEAN | IDX | no | IDX |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `aprobada_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[regla_monitoreo_lft.aprobada_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[alerta_monitoreo_lft]] | `regla_monitoreo_id` | 12 | [[alerta_monitoreo_lft.regla_monitoreo_id → regla_monitoreo_lft]] |

## Entidades vecinas

[[alerta_monitoreo_lft]] · [[usuario]]

## Notas del modelo

> **Tipologias parametrizables**
> expresion JSONB describe el patron: fraccionamiento,
> pitufeo, circularidad entre cuentas, uso de un grupo
> como pantalla, entrada y salida inmediata.
> Cargar una tipologia nueva es un INSERT.
> accion_automatica puede ser SOLO_ALERTAR,
> RETENER_OPERACION o BLOQUEAR_CUENTA.

## Ver también

- Justificación de negocio: [[12_cumplimiento_asfi]]
- Diagramas: `docs/entidades/12_cumplimiento_asfi.puml`
- Índice: [[_Entidades]] · [[Index]]
