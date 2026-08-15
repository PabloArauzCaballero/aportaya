---
tags:
  - entidad
  - modulo/14-publicidad-y-campanas
tabla: conjunto_anuncios
clase: ConjuntoAnuncios
modulo: "14 — Publicidad y Campañas"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 10
fk_salientes: 3
fk_entrantes: 1
append_only: false
---

# `conjunto_anuncios`

> Módulo [[14_publicidad_campanas|14 — Publicidad y Campañas]] · clase `ConjuntoAnuncios` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `campana_publicitaria_id` | UUID | FK IDX | no | FK, IDX |
| `segmento_audiencia_id` | UUID | FK IDX | no | FK, IDX |
| `espacio_publicitario_id` | UUID | FK IDX | no | FK, IDX |
| `nombre` | VARCHAR(120) | — | no | — |
| `presupuesto_diario` | DECIMAL(12,2) | — | no | CK: > 0 |
| `moneda` | CHAR(3) | — | no | — |
| `puja_maxima` | DECIMAL(10,2) | — | no | CK: > 0 |
| `modelo_puja` | VARCHAR(10) | — | no | CK |
| `estado` | VARCHAR(15) | IDX | no | CK, IDX |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `campana_publicitaria_id` | [[campana_publicitaria]] | 14 | no | [[conjunto_anuncios.campana_publicitaria_id → campana_publicitaria]] |
| `espacio_publicitario_id` | [[espacio_publicitario]] | 14 | no | [[conjunto_anuncios.espacio_publicitario_id → espacio_publicitario]] |
| `segmento_audiencia_id` | [[segmento_audiencia]] | 14 | no | [[conjunto_anuncios.segmento_audiencia_id → segmento_audiencia]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[anuncio]] | `conjunto_anuncios_id` | 14 | [[anuncio.conjunto_anuncios_id → conjunto_anuncios]] |

## Entidades vecinas

[[anuncio]] · [[campana_publicitaria]] · [[espacio_publicitario]] · [[segmento_audiencia]]

## Notas del modelo

> presupuesto_diario y puja_maxima acotan el gasto sin
> necesitar una tabla de subasta separada: la entrega
> se detiene sola cuando el conjunto alcanza
> presupuesto_diario (estado -> AGOTADO), evaluado por
> el worker de entrega (fase 9).

## Ver también

- Justificación de negocio: [[14_publicidad_campanas]]
- Diagramas: `docs/entidades/14_publicidad_campanas.puml`
- Índice: [[_Entidades]] · [[Index]]
