---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: devolucion_fondo
clase: DevolucionFondo
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [id]
columnas: 9
fk_salientes: 2
fk_entrantes: 0
append_only: false
---

# `devolucion_fondo`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `DevolucionFondo`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `fondo_id` | UUID | FK IDX | no | FK, IDX |
| `participante_id` | UUID | FK | no | FK |
| `monto_aportado` | DECIMAL(14,2) | — | no | — |
| `monto_consumido` | DECIMAL(14,2) | — | no | — |
| `monto_a_devolver` | DECIMAL(14,2) | — | no | — |
| `estado` | VARCHAR(15) | — | no | CK |
| `motivo_retencion` | VARCHAR(200) | — | sí | NULL |
| `fecha` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `fondo_id` | [[fondo_garantia]] | 08 | no | [[devolucion_fondo.fondo_id → fondo_garantia]] |
| `participante_id` | [[participante]] | ↗ 02 | no | [[devolucion_fondo.participante_id → participante]] |

## Entidades vecinas

[[fondo_garantia]] · [[participante]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
