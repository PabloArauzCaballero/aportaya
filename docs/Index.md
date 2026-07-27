---
tags:
  - moc
  - indice
titulo: "Pasanaku Digital — modelo de datos"
entidades: 174
relaciones_fk: 334
modulos: 9
---

# Pasanaku Digital — Índice

> [!abstract] Qué es esta bóveda
> El modelo de datos completo del sistema, navegable como grafo. Cada tabla y
> cada clave foránea es una nota, enlazada con las demás, para poder recorrer
> el modelo por relaciones en vez de leer nueve diagramas sueltos.

## Cómo está organizada

```
docs/
├── Index.md                 ← estás acá
├── Modelos/
│   ├── Entidades/           ← una nota por tabla (174)
│   └── Relaciones/          ← una nota por clave foránea (334)
└── entidades/               ← justificación de negocio + diagramas .puml
```

| Carpeta | Qué contiene | Índice |
| --- | --- | --- |
| **Entidades** | Una nota por tabla: columnas, claves, FK salientes y entrantes, entidades vecinas y las notas del diagrama. | [[_Entidades]] |
| **Relaciones** | Una nota por FK: origen, destino, cardinalidad, si es opcional y si cruza módulos. | [[_Relaciones]] |
| **entidades/** | Por qué existe cada entidad, a nivel de negocio y de sistema. Un documento por módulo. | [[docs/entidades/README\|Fichas de negocio]] |

## Los tres registros que conviene entender primero

Casi todo el modelo se explica con tres ideas. Si vas a leer solo tres notas, que sean estas:

1. **[[obligacion_aporte]]** — el eje del dinero. La cubre el fondo, la deduce la entrega y la puntúa la reputación.
2. **[[registro_incumplimiento]]** — el incumplimiento como expediente, no como bandera.
3. **[[asiento_contable]]** — doble partida: nada se edita, todo se reversa.

## Módulos

| # | Módulo | Foco de negocio | Tablas | FK | Fichas |
| :-: | --- | --- | --: | --: | --- |
| 01 | Identidad, Usuarios y Seguridad | Saber con certeza a quién le estás confiando plata ajena | 25 | 32 | [[01_identidad_usuarios\|negocio]] |
| 02 | Grupos, Cupos, Turnos y Gobernanza | Reglas del juego, orden de cobro y decisiones colectivas | 22 | 48 | [[02_grupos_turnos\|negocio]] |
| 03 | Aportes, Pagos QR y Conciliación | Que "pagué" signifique "el banco lo confirmó" | 22 | 45 | [[03_aportes_pagos_qr\|negocio]] |
| 04 | Entregas de Fondo | Que la bolsa llegue completa, a la persona correcta, una sola vez | 10 | 24 | [[04_entregas_fondo\|negocio]] |
| 05 | Notificaciones y Comunicaciones | WhatsApp como canal real de cobro, sin spam ni doble aviso | 15 | 21 | [[05_notificaciones\|negocio]] |
| 06 | Transparencia y Reputación | Que nadie tenga que "creerle" al organizador | 16 | 22 | [[06_transparencia_reputacion\|negocio]] |
| 07 | Organizador y Automatización | Administrar es un rol, no un negocio: sin comisión y sin custodia | 12 | 17 | [[07_organizador_automatizacion\|negocio]] |
| 08 | Garantía, Incumplimiento, Cobranza y Sanciones | El grupo no se detiene, pero la deuda no se perdona sola | 33 | 99 | [[08_garantia_incumplimiento\|negocio]] |
| 09 | Auditoría, Reportes y Cumplimiento | Poder demostrar todo lo anterior ante un reclamo o un regulador | 19 | 26 | [[09_auditoria_reportes\|negocio]] |

## Entidades más conectadas

El grado (FK entrantes + salientes) es un buen proxy de importancia estructural:

| Entidad | Módulo | FK salientes | FK entrantes | Grado |
| --- | :-: | --: | --: | --: |
| [[usuario]] | 01 | 0 | 107 | **107** |
| [[grupo]] | 02 | 1 | 38 | **39** |
| [[participante]] | 02 | 3 | 24 | **27** |
| [[registro_incumplimiento]] | 08 | 9 | 11 | **20** |
| [[entrega_fondo]] | 04 | 8 | 8 | **16** |
| [[token_verificacion]] | 01 | 4 | 9 | **13** |
| [[obligacion_aporte]] | 03 | 7 | 5 | **12** |
| [[pago]] | 03 | 3 | 8 | **11** |
| [[acuerdo]] | 02 | 2 | 7 | **9** |
| [[cobertura_incumplimiento]] | 08 | 7 | 2 | **9** |
| [[deuda_participante]] | 08 | 5 | 4 | **9** |
| [[cupo]] | 02 | 2 | 6 | **8** |

## Acoplamiento entre módulos

De las 334 claves foráneas, **164 cruzan módulos**. La matriz muestra
cuántas FK van de un módulo (fila) a otro (columna):

| desde \ hacia | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 |
| :-: | --: | --: | --: | --: | --: | --: | --: | --: | --: |
| **01** | · | · | · | · | · | · | · | 1 | · |
| **02** | 11 | · | 1 | · | · | · | 1 | 1 | · |
| **03** | 12 | 9 | · | · | · | · | · | · | · |
| **04** | 8 | 5 | 1 | · | · | · | · | · | · |
| **05** | 4 | 1 | 1 | · | · | · | · | · | · |
| **06** | 7 | 7 | · | · | · | · | · | · | · |
| **07** | 7 | 1 | · | · | · | · | · | · | · |
| **08** | 27 | 29 | 8 | 2 | 1 | · | · | · | · |
| **09** | 16 | 3 | · | · | · | · | · | · | · |

> [!tip] Cómo leerla
> La columna **01** llena de números confirma que identidad es el cimiento: casi
> todo cuelga de `usuario`. La fila **08** muestra lo contrario: el incumplimiento
> consume de todos lados porque necesita el contexto completo para armar el expediente.

## Convenciones de la bóveda

- **Tags**: `#entidad`, `#relacion`, `#fk`, `#cross-modulo`, `#append-only`, `#modulo/0X-...`
- **Propiedades**: cada nota lleva frontmatter con módulo, tabla, clase, claves y conteos, para filtrar con búsqueda o Dataview.
- **`↗`** en una tabla marca que la referencia cruza a otro módulo.
- Las notas **append-only** no admiten `UPDATE` ni `DELETE`: se corrigen registrando el movimiento inverso.
- Los nombres de nota son los **nombres de tabla** (`snake_case`), así que `[[pago]]` autocompleta desde cualquier nota.

## Búsquedas útiles

```
tag:#append-only              → tablas que no se editan nunca
tag:#cross-modulo             → FK que acoplan módulos
tag:#entidad "clave_idempotencia"  → dónde se protege contra duplicados
```

> [!note] Cómo se generó
> Las notas de `Modelos/` se derivan de los `.puml` de `docs/entidades/`: si cambia
> un diagrama, hay que regenerarlas para que no se desincronicen. Las fichas de
> negocio de `docs/entidades/*.md` sí están escritas a mano.

