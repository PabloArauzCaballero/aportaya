---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
tabla: socio_comercial
clase: SocioComercial
modulo: "14 — Publicidad y Campañas"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 9
fk_salientes: 1
fk_entrantes: 1
append_only: false
---

# `socio_comercial`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `SocioComercial` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `razon_social` | VARCHAR(150) | — | no | — |
| `numero_documento` | VARCHAR(30) | UQ | no | UQ |
| `rubro` | VARCHAR(60) | — | sí | NULL |
| `email_contacto` | VARCHAR(120) | — | no | — |
| `telefono_contacto` | VARCHAR(20) | — | sí | NULL |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |
| `verificado_por` | UUID | FK | sí | FK, NULL |
| `creado_en` | TIMESTAMPTZ | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `verificado_por` | [[usuario]] | ↗ 01 | sí | [[socio_comercial.verificado_por → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[anunciante]] | `socio_comercial_id` | 14 | [[anunciante.socio_comercial_id → socio_comercial]] |

## Entidades vecinas

[[anunciante]] · [[usuario]]

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
