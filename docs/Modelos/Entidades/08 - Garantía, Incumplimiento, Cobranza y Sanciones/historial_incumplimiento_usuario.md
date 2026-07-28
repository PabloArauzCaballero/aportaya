---
tags:
  - entidad
  - modulo/08-garantia-incumplimiento-cobranza-y-sanciones
tabla: historial_incumplimiento_usuario
clase: HistorialIncumplimientoUsuario
modulo: "08 — Garantía, Incumplimiento, Cobranza y Sanciones"
clave_primaria: [usuario_id]
columnas: 14
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `historial_incumplimiento_usuario`

> Módulo [[08_garantia_incumplimiento|08 — Garantía, Incumplimiento, Cobranza y Sanciones]] · clase `HistorialIncumplimientoUsuario`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `usuario_id` | UUID | PK FK | no | PK, FK |
| `total_incumplimientos` | SMALLINT | — | no | — |
| `incumplimientos_leves` | SMALLINT | — | no | — |
| `incumplimientos_graves` | SMALLINT | — | no | — |
| `incumplimientos_abiertos` | SMALLINT | IDX | no | IDX |
| `monto_total_incumplido` | DECIMAL(16,2) | — | no | — |
| `monto_total_recuperado` | DECIMAL(16,2) | — | no | — |
| `monto_castigado_historico` | DECIMAL(16,2) | — | no | — |
| `grupos_abandonados` | SMALLINT | — | no | — |
| `ultimo_incumplimiento_en` | TIMESTAMPTZ | — | sí | NULL |
| `dias_mora_promedio` | DECIMAL(6,2) | — | no | — |
| `tasa_regularizacion` | DECIMAL(5,2) | — | no | — |
| `esta_en_lista_restriccion` | BOOLEAN | — | no | — |
| `actualizado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[historial_incumplimiento_usuario.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[08_garantia_incumplimiento]]
- Diagramas: `docs/entidades/08_garantia_incumplimiento.puml`
- Índice: [[_Entidades]] · [[Index]]
