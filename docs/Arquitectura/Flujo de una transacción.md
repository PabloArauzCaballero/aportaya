---
tags:
  - arquitectura
titulo: "Flujo de una transacción"
fecha_revision: 2026-08-12
---

# Flujo de una transacción

> Qué pasa, en orden, desde que llega un request hasta que el efecto externo sale.
> Este orden **no es negociable**: cada paso existe porque una restricción, un caso
> de uso o una norma lo exige.

## El camino completo

```
1  HTTP          controlador: valida con el esquema Zod del caso de uso (.strict())
2  Autenticación resuelve usuario, rol y dispositivo de confianza
3  Idempotencia  ¿ya existe esta clave? → devuelve la MISMA respuesta y termina
4  BEGIN         abre transacción
5  SET LOCAL     app.usuario_id, app.rol  → recién ahora las políticas RLS aplican
6  Caso de uso   organismo: lee, decide con átomos puros, escribe por moléculas
7  Evento        inserta en evento_dominio y ENCOLA el trabajo (misma transacción)
8  COMMIT        la base rechaza aquí lo que viole cualquier restricción
9  Respuesta     con la clave de idempotencia registrada
──────────────── frontera ────────────────
10 Worker        toma el trabajo, valida su propia idempotencia
11 Adaptador     llama al proveedor (QR, WhatsApp, SIAT, UIF) y registra el intento
12 Reintento     con retroceso exponencial; cada intento queda como evidencia
```

## Por qué cada paso está donde está

| Paso | Por qué antes y no después |
| --- | --- |
| **3 · Idempotencia antes del `BEGIN`** | La bóveda lo exige: *la clave se valida antes de cualquier escritura*. Un reintento del usuario en mala señal no puede duplicar un aporte. |
| **5 · `SET LOCAL` después del `BEGIN`** | Solo dentro de la transacción el contexto muere en el `COMMIT`, que es lo que impide que el siguiente request herede la identidad ([[ADR-007 Sesión, RLS y pooling]]). |
| **6 · Todo el caso de uso en una transacción** | *Una transacción por caso de uso*. Nada de "primero guardo y después ajusto el saldo": ese "después" es donde se pierde el dinero. |
| **7 · Encolar dentro de la transacción** | Si se revierte, el trabajo no existe. Si confirma, el trabajo existe. No hay tercer resultado ([[ADR-003 Trabajos, outbox y planificador]]). |
| **8 · La base rechaza al final** | La aplicación valida para dar buen mensaje; la garantía es la restricción. Si la base rechaza algo que la aplicación dejó pasar, el bug es de la aplicación, no de la base. |
| **11 · El proveedor, fuera** | Una llamada externa dentro del `COMMIT` ata el dinero a la latencia y a la disponibilidad de un tercero. |

## Reglas dentro del paso 6

| Regla | En una línea |
| --- | --- |
| **El saldo no se escribe: se deriva** | Se insertan movimientos con contrapartida; la caché de saldo se sincroniza en la misma transacción |
| **Nada se edita** | Corrección = movimiento inverso. Las tablas append-only rechazan el `UPDATE` a nivel de rol |
| **Los plazos se persisten al crear** | `vence_en`, `plazo_respuesta`, `fecha_limite` se calculan una vez, nunca en la consulta |
| **Denegar por omisión** | Sin límite, licencia, tarifario o política vigente ⇒ se rechaza |
| **Sin dinero en `number`** | Todo importe es `Dinero` ([[ADR-005 Dinero y decimales]]) |
| **El organismo orquesta, no consulta** | El SQL vive en moléculas; el cálculo, en átomos |

## Concurrencia

Dos participantes pagando al mismo tiempo la misma obligación, o un cierre diario
corriendo mientras entra un aporte, son el caso normal, no el raro.

- **Bloqueo por fila** sobre el agregado que se modifica (`SELECT … FOR UPDATE`
  sobre la obligación o la cuenta), no bloqueo optimista por reintento del usuario.
- **Bloqueo consultivo** para procesos globales: cierre diario, conciliación,
  remisión de reportes. Uno a la vez, por definición.
- **`version`** de bloqueo optimista para ediciones de configuración (tarifario,
  acuerdo, política), donde el conflicto debe avisarle a una persona.
- El nivel de aislamiento por defecto es `READ COMMITTED`; los flujos que leen para
  decidir y luego escriben usan bloqueo explícito, no `SERIALIZABLE` global.

## Errores y respuesta

| Situación | Qué devuelve | Qué queda registrado |
| --- | --- | --- |
| Entrada inválida | `400` con código `AP-CU<NN>-<nn>` | Nada escrito |
| Sin permiso / fuera de política RLS | `403` o cero filas | Intento en bitácora |
| Restricción de la base rechaza | `409` con el código `R-XXX-nn` traducido | El rechazo, con la restricción que actuó |
| Clave de idempotencia repetida | `200` con la respuesta original | Nada nuevo |
| Proveedor externo caído | `202`: aceptado, se completará | Trabajo en cola con sus intentos |

Un error nunca devuelve el mensaje crudo de PostgreSQL al cliente: se traduce al
código de la restricción, que es el que la bóveda documenta.

## Observabilidad

Cada request lleva un identificador de traza que se propaga hasta el trabajo del
worker, y toda línea de log incluye `cu`, `usuario_id` y `traza`. Así la pregunta de
soporte *"¿qué pasó con el aporte de Juan del martes?"* se responde con una consulta
por `CU-21` y una fecha, no leyendo logs de tres servicios.

## Ver también

[[ADR-007 Sesión, RLS y pooling]] · [[ADR-003 Trabajos, outbox y planificador]] · [[Estructura del repositorio]] · [[Restricciones]]
