---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: gestion_cobranza
clase: GestionCobranza
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 12
fk_salientes: 3
fk_entrantes: 3
append_only: false
---

# `gestion_cobranza`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `GestionCobranza` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `registro_id` | UUID | FK UQ | no | FK, UQ |
| `estrategia_id` | UUID | FK | no | FK |
| `gestor_asignado_id` | UUID | FK IDX | sí | FK, NULL, IDX |
| `etapa_actual` | VARCHAR(20) | IDX | no | CK, IDX |
| `monto_en_gestion` | DECIMAL(14,2) | — | no | — |
| `intentos_contacto` | SMALLINT | — | no | — |
| `ultimo_contacto_en` | TIMESTAMPTZ | — | sí | NULL |
| `proxima_accion_en` | TIMESTAMPTZ | IDX | no | IDX |
| `estado` | VARCHAR(25) | IDX | no | CK, IDX |
| `abierta_en` | TIMESTAMPTZ | — | no | — |
| `cerrada_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `estrategia_id` | [[estrategia_cobranza]] | 08 | no | [[gestion_cobranza.estrategia_id → estrategia_cobranza]] |
| `gestor_asignado_id` | [[usuario]] | ↗ 01 | sí | [[gestion_cobranza.gestor_asignado_id → usuario]] |
| `registro_id` | [[registro_incumplimiento]] | 08 | no | [[gestion_cobranza.registro_id → registro_incumplimiento]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[accion_cobranza]] | `gestion_id` | 08 | [[accion_cobranza.gestion_id → gestion_cobranza]] |
| [[cuenta_por_cobrar_comision]] | `gestion_cobranza_id` | ↗ 11 | [[cuenta_por_cobrar_comision.gestion_cobranza_id → gestion_cobranza]] |
| [[promesa_pago]] | `gestion_id` | 08 | [[promesa_pago.gestion_id → gestion_cobranza]] |

## Entidades vecinas

[[accion_cobranza]] · [[cuenta_por_cobrar_comision]] · [[estrategia_cobranza]] · [[promesa_pago]] · [[registro_incumplimiento]] · [[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
