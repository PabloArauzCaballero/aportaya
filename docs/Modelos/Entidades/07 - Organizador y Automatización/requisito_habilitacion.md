---
tags:
  - entidad
  - modulo/07-organizador-y-automatizacion
tabla: requisito_habilitacion
clase: RequisitoHabilitacion
modulo: "07 — Organizador y Automatización"
estereotipo: Política configurable
clave_primaria: [id]
columnas: 8
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `requisito_habilitacion`

> Módulo [[07_organizador_automatizacion|07 — Organizador y Automatización]] · clase `RequisitoHabilitacion` · Política configurable

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `codigo` | VARCHAR(40) | UQ | no | UQ |
| `descripcion` | VARCHAR(200) | — | no | — |
| `tipo` | VARCHAR(25) | — | no | CK |
| `valor_minimo` | DECIMAL(12,2) | — | no | — |
| `es_obligatorio` | BOOLEAN | — | no | — |
| `nivel_requerido` | VARCHAR(15) | — | no | CK |
| `activo` | BOOLEAN | — | no | — |

## Ver también

- Justificación de negocio: [[07_organizador_automatizacion]]
- Diagramas: `docs/entidades/07_organizador_automatizacion.puml`
- Índice: [[_Entidades]] · [[Index]]
