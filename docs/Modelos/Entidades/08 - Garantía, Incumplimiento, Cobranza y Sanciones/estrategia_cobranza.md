---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: estrategia_cobranza
clase: EstrategiaCobranza
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 12
fk_salientes: 0
fk_entrantes: 1
append_only: false
---

# `estrategia_cobranza`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `EstrategiaCobranza` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `etapa` | VARCHAR(20) | UQ | no | CK, UQ+dias_mora_desde |
| `dias_mora_desde` | SMALLINT | — | no | — |
| `dias_mora_hasta` | SMALLINT | — | no | — |
| `canales_permitidos` | VARCHAR(120) | — | no | — |
| `frecuencia_dias` | SMALLINT | — | no | — |
| `max_contactos_por_semana` | SMALLINT | — | no | — |
| `plantilla_notificacion_codigo` | VARCHAR(50) | — | sí | NULL, M5 |
| `requiere_gestor_humano` | BOOLEAN | — | no | — |
| `permite_quita` | BOOLEAN | — | no | — |
| `quita_maxima_porcentaje` | DECIMAL(5,2) | — | no | — |
| `siguiente_etapa` | VARCHAR(20) | — | sí | NULL |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[gestion_cobranza]] | `estrategia_id` | 08 | [[gestion_cobranza.estrategia_id → estrategia_cobranza]] |

## Entidades vecinas

[[gestion_cobranza]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
