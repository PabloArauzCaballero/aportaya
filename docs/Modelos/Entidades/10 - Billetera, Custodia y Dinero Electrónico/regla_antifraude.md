---
tags:
  - entidad
  - modulo/10-billetera-custodia-y-dinero-electronico
tabla: regla_antifraude
clase: ReglaAntifraude
modulo: "10 — Billetera, Custodia y Dinero Electrónico"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 10
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `regla_antifraude`

> Módulo [[10_billetera_custodia|10 — Billetera, Custodia y Dinero Electrónico]] · clase `ReglaAntifraude` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(300) | — | no | — |
| `expresion` | JSONB | — | no | — |
| `accion` | VARCHAR(20) | — | no | CK |
| `umbral_puntaje` | DECIMAL(5,2) | — | no | — |
| `prioridad` | SMALLINT | — | no | — |
| `activa` | BOOLEAN | IDX | no | IDX |
| `vigente_desde` | TIMESTAMPTZ | — | no | — |
| `aprobada_por` | UUID | FK | sí | FK, NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `aprobada_por` | [[usuario]] | ↗ 01 | sí | [[regla_antifraude.aprobada_por → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[10_billetera_custodia]]
- Diagramas: `docs/entidades/10_billetera_custodia.puml`
- Índice: [[_Entidades]] · [[Index]]
