---
tags:
  - entidad
  - modulo/01-identidad-usuarios-y-seguridad
tabla: perfil_financiero
clase: PerfilFinanciero
modulo: "01 — Identidad, Usuarios y Seguridad"
clave_primaria: [id]
columnas: 8
fk_salientes: 1
fk_entrantes: 0
append_only: false
---

# `perfil_financiero`

> Módulo [[01_identidad_usuarios|01 — Identidad, Usuarios y Seguridad]] · clase `PerfilFinanciero`

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `ocupacion` | VARCHAR(80) | — | no | — |
| `ingreso_mensual_declarado` | DECIMAL(14,2) | — | no | — |
| `capacidad_aporte_declarada` | DECIMAL(14,2) | — | no | — |
| `fuente_ingresos` | VARCHAR(120) | — | no | — |
| `es_pep` | BOOLEAN | — | no | — |
| `actualizado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | 01 | no | [[perfil_financiero.usuario_id → usuario]] |

## Entidades vecinas

[[usuario]]

## Ver también

- Justificación de negocio: [[01_identidad_usuarios]]
- Diagramas: `docs/entidades/01_identidad_usuarios.puml`
- Índice: [[_Entidades]] · [[Index]]
