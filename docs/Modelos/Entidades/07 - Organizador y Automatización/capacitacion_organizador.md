---
tags:
  - entidad
  - modulo/07-organizador-y-automatizacion
tabla: capacitacion_organizador
clase: CapacitacionOrganizador
modulo: "07 — Organizador y Automatización"
clave_primaria: [id]
columnas: 7
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `capacitacion_organizador`

> Módulo [[07_organizador_automatizacion|07 — Organizador y Automatización]] · clase `CapacitacionOrganizador`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `organizador_id` | UUID | FK IDX | no | FK, IDX |
| `modulo` | VARCHAR(80) | — | no | — |
| `completada_en` | TIMESTAMPTZ | — | no | — |
| `puntaje_evaluacion` | DECIMAL(5,2) | — | no | — |
| `aprobada` | BOOLEAN | — | no | — |
| `vigente_hasta` | DATE | — | sí | NULL |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `organizador_id` | [[organizador]] | 07 | no | [[capacitacion_organizador.organizador_id → organizador]] |

## Entidades vecinas

[[organizador]]

## Ver también

- Justificación de negocio: [[07_organizador_automatizacion]]
- Diagramas: `docs/entidades/07_organizador_automatizacion.puml`
- Índice: [[_Entidades]] · [[Index]]
