---
tags:
  - entidad
  - modulo/04-entregas-de-fondo
tabla: deduccion_entrega
clase: DeduccionEntrega
modulo: "04 — Entregas de Fondo"
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `deduccion_entrega`

> Módulo [[04_entregas_fondo|04 — Entregas de Fondo]] · clase `DeduccionEntrega`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `entrega_id` | UUID | FK IDX | no | FK, IDX |
| `tipo` | VARCHAR(35) | — | no | CK |
| `descripcion` | VARCHAR(200) | — | no | — |
| `monto` | DECIMAL(14,2) | — | no | CK: > 0 |
| `referencia_origen_id` | UUID | — | sí | NULL, polimorfica |
| `es_obligatoria` | BOOLEAN | — | no | — |
| `aplicada_en` | TIMESTAMPTZ | — | no | — |
| `revertida_en` | TIMESTAMPTZ | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `entrega_id` | [[entrega_fondo]] | 04 | no | [[deduccion_entrega.entrega_id → entrega_fondo]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[cargo_comision]] | `deduccion_entrega_id` | ↗ 11 | [[cargo_comision.deduccion_entrega_id → deduccion_entrega]] |

## Entidades vecinas

[[cargo_comision]] · [[entrega_fondo]]

## Notas del modelo

> referencia_origen_id es polimorfica segun tipo:
> DEUDA_VENCIDA_PROPIA -> obligacion_aporte.id (M3)
> REPOSICION_FONDO_GARANTIA -> cobertura_incumplimiento.id (M8)
> COMISION_PLATAFORMA -> cargo_comision.id (M11)
> La comision de plataforma es la unica deduccion que
> representa un ingreso de la empresa. Es siempre una
> linea visible, con su monto, su concepto tarifario y
> el tarifario version N que la calculo. El organizador
> no percibe nada de ella (RN-18).

## Ver también

- Justificación de negocio: [[04_entregas_fondo]]
- Diagramas: `docs/entidades/04_entregas_fondo.puml`
- Índice: [[_Entidades]] · [[Index]]
