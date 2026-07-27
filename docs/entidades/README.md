# Diccionario razonado de entidades — Pasanaku Digital v2.0 + Parche A

Este directorio documenta **qué hace cada entidad del modelo y por qué debería
existir**. No es un diccionario de datos (los tipos y las claves ya están en los
`.puml`); es la justificación de negocio de cada pieza: qué problema real del
pasanaku resuelve, qué se rompería si se elimina, y qué papel cumple en el
sistema.

## Cómo leer cada ficha

Cada entidad se documenta con cuatro preguntas:

| Sección | Responde |
| --- | --- |
| **Qué es** | Definición en una línea, en lenguaje del negocio. |
| **Para qué sirve (negocio)** | Qué necesidad real del pasanaku cubre, qué decisión habilita, quién la usa. |
| **Por qué debe existir** | Qué pasa si se fusiona con otra tabla o se elimina. El costo concreto de no tenerla. |
| **A nivel de sistema** | Invariantes, claves, índices, transaccionalidad, integraciones. |

## Índice de módulos

Cada módulo tiene dos archivos en este directorio: el `.puml` con los diagramas
(modelo de clases + modelo relacional) y el `.md` con la justificación de negocio
de cada entidad.

| Documento | Diagramas | Foco de negocio |
| --- | --- | --- |
| [01 — Identidad, Usuarios y Seguridad](01_identidad_usuarios.md) | [`.puml`](01_identidad_usuarios.puml) | Saber con certeza a quién le estás confiando plata ajena |
| [02 — Grupos, Cupos, Turnos y Gobernanza](02_grupos_turnos.md) | [`.puml`](02_grupos_turnos.puml) | Reglas del juego, orden de cobro y decisiones colectivas |
| [03 — Aportes, Pagos QR y Conciliación](03_aportes_pagos_qr.md) | [`.puml`](03_aportes_pagos_qr.puml) | Que "pagué" signifique "el banco lo confirmó" |
| [04 — Entregas de Fondo](04_entregas_fondo.md) | [`.puml`](04_entregas_fondo.puml) | Que la bolsa llegue completa, a la persona correcta, una sola vez |
| [05 — Notificaciones y Comunicaciones](05_notificaciones.md) | [`.puml`](05_notificaciones.puml) | WhatsApp como canal real de cobro, sin spam ni doble aviso |
| [06 — Transparencia y Reputación](06_transparencia_reputacion.md) | [`.puml`](06_transparencia_reputacion.puml) | Que nadie tenga que "creerle" al organizador |
| [07 — Organizador, Comisión y Automatización](07_organizador_comision.md) | [`.puml`](07_organizador_comision.puml) | Profesionalizar al organizador sin que toque la plata |
| [08 — Garantía, Incumplimiento, Cobranza y Sanciones](08_garantia_incumplimiento.md) | [`.puml`](08_garantia_incumplimiento.puml) | El grupo no se detiene, pero la deuda no se perdona sola |
| [09 — Auditoría, Reportes y Cumplimiento](09_auditoria_reportes.md) | [`.puml`](09_auditoria_reportes.puml) | Poder demostrar todo lo anterior ante un reclamo o un regulador |

## Tres tesis que explican el 80% del modelo

Antes de entrar a las fichas, conviene tener claras las tres ideas que hacen que
este modelo tenga tantas entidades. Casi toda entidad "de más" existe por una de
estas tres razones:

**1. El pasanaku falla por desconfianza, no por falta de plata.**
La gente no abandona un pasanaku porque no pueda pagar: lo abandona porque
sospecha que el orden de cobro fue arreglado, que el organizador se quedó con
algo, o que el moroso no va a tener consecuencias. Por eso hay entidades que un
sistema "normal" no tendría: `SorteoTurnos` con commit-reveal, `Acuerdo` con
votación ponderada, `BloqueTransparencia` con cadena de hashes, `Sancion` con
derecho a descargo. Todas existen para convertir una promesa verbal en una prueba
verificable.

**2. Se custodia dinero de terceros, no dinero propio.**
Eso obliga a que el dinero nunca se represente con un solo campo `monto_pagado`.
El circuito es `ObligacionAporte → OrdenCobro → IntentoPago → Pago →
Conciliacion → AsientoContable`, cada paso idempotente y auditable por separado.
Parece exagerado hasta el día en que la pasarela reenvía un webhook y acredita
dos veces el mismo aporte, o hasta que alguien pide el detalle de por qué recibió
Bs 200 menos de lo que esperaba.

**3. El incumplimiento es un expediente, no una bandera.**
Un booleano `es_moroso` no responde: cuánto debe, desde cuándo, qué se hizo para
cobrarle, quién autorizó cubrirlo con el fondo, qué dijo él en su descargo, qué
sanción se le aplicó y si la apeló. Todo el módulo 8 existe para responder eso.
La reputación (módulo 6) es *una consecuencia* de ese expediente, no el registro
mismo.

## Convenciones

- Se usa `NombreClase` para el modelo orientado a objetos y `nombre_tabla` para
  el relacional. Cuando ambos existen, la ficha los cita juntos.
- Las entidades marcadas **append-only** no admiten `UPDATE` ni `DELETE`: se
  corrigen registrando el movimiento inverso. A esas se les revoca el privilegio
  a nivel de rol de base de datos, no solo por convención de código.
- "M1"…"M9" refieren a los módulos de la tabla de arriba.
- Los montos van siempre acompañados de `moneda` ISO-4217: un pasanaku en dólares
  y uno en bolivianos conviven en la misma tabla.
