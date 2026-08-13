---
tags:
  - entidad
  - modulo/07-organizador-y-automatizacion
tabla: organizador
clase: Organizador
modulo: "07 — Organizador y Automatización"
estereotipo: Raíz de agregado
clave_primaria: [id]
columnas: 15
fk_salientes: 1
fk_entrantes: 5
append_only: false
---

# `organizador`

> Módulo [[07_organizador_automatizacion|07 — Organizador y Automatización]] · clase `Organizador` · Raíz de agregado

## Columnas

| Columna | Tipo | Clave | Nulo | Anotaciones |
| --- | --- | --- | :-: | --- |
| `id` | UUID | PK | no | PK |
| `usuario_id` | UUID | FK UQ | no | FK, UQ |
| `estado` | VARCHAR(25) | IDX | no | CK, IDX |
| `nivel` | VARCHAR(15) | — | no | CK |
| `limite_grupos_simultaneos` | SMALLINT | — | no | — |
| `limite_monto_administrado` | DECIMAL(16,2) | — | no | — |
| `grupos_activos` | SMALLINT | — | no | — |
| `grupos_historicos` | SMALLINT | — | no | — |
| `monto_administrado_actual` | DECIMAL(16,2) | — | no | — |
| `calificacion_promedio` | DECIMAL(3,2) | — | no | — |
| `indice_morosidad_cartera` | DECIMAL(5,2) | — | no | — |
| `fecha_postulacion` | TIMESTAMPTZ | — | no | — |
| `fecha_habilitacion` | TIMESTAMPTZ | — | sí | NULL |
| `fecha_suspension` | TIMESTAMPTZ | — | sí | NULL |
| `version` | INTEGER | — | no | — |

## Claves foráneas salientes

| Columna | Referencia a | Módulo | Opcional | Relación |
| --- | --- | :-: | :-: | --- |
| `usuario_id` | [[usuario]] | ↗ 01 | no | [[organizador.usuario_id → usuario]] |

## Referenciada por

| Entidad | Columna | Módulo | Relación |
| --- | --- | :-: | --- |
| [[capacitacion_organizador]] | `organizador_id` | 07 | [[capacitacion_organizador.organizador_id → organizador]] |
| [[contrato_organizador]] | `organizador_id` | 07 | [[contrato_organizador.organizador_id → organizador]] |
| [[evaluacion_desempeno]] | `organizador_id` | 07 | [[evaluacion_desempeno.organizador_id → organizador]] |
| [[grupo]] | `organizador_id` | ↗ 02 | [[grupo.organizador_id → organizador]] |
| [[sancion_organizador]] | `organizador_id` | 07 | [[sancion_organizador.organizador_id → organizador]] |

## Entidades vecinas

[[capacitacion_organizador]] · [[contrato_organizador]] · [[evaluacion_desempeno]] · [[grupo]] · [[sancion_organizador]] · [[usuario]]

## Notas del modelo

> **RN-18 como ausencia de esquema**
> No existen esquema_comision_organizador,
> liquidacion_comision_organizador ni
> pago_comision: lo que hace imposible el cobro
> es que no haya donde representarlo, no una
> validacion que alguien pueda desactivar.
> devengo_comision (M11) existe, pero su
> usuario_obligado_id es quien PAGA la comision
> del servicio, nunca quien la cobra: el unico
> beneficiario posible es la plataforma.

> usuario_id -> usuario.id (M1).
> Sin cuenta_cobro_id: no hay egreso hacia el
> organizador. Si ademas participa en el grupo,
> lo hace como participante normal (M2) con sus
> propias obligaciones (M3) y su turno (M4).

## Ver también

- Justificación de negocio: [[07_organizador_automatizacion]]
- Diagramas: `docs/entidades/07_organizador_automatizacion.puml`
- Índice: [[_Entidades]] · [[Index]]
