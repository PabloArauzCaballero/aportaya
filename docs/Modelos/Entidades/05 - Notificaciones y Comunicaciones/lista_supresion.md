---
tags:
  - entidad
  - modulo/05-notificaciones-y-comunicaciones
tabla: lista_supresion
clase: ListaSupresion
modulo: "05 — Notificaciones y Comunicaciones"
clave_primaria: [id]
columnas: 6
fk_salientes: 0
fk_entrantes: 0
append_only: false
---

# `lista_supresion`

> Módulo [[05_notificaciones|05 — Notificaciones y Comunicaciones]] · clase `ListaSupresion`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `identificador` | VARCHAR(150) | UQ | no | UQ+canal |
| `canal` | VARCHAR(15) | — | no | CK |
| `motivo` | VARCHAR(25) | — | no | CK |
| `agregado_en` | TIMESTAMPTZ | — | no | — |
| `permanente` | BOOLEAN | — | no | — |

## Ver también

- Justificación de negocio: [[05_notificaciones]]
- Diagramas: `docs/entidades/05_notificaciones.puml`
- Índice: [[_Entidades]] · [[Index]]
