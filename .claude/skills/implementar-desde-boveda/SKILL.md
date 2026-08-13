---
name: implementar-desde-boveda
description: "Programar una funcionalidad de Pasanaku usando la bóveda de Obsidian como especificación: en qué orden leer, qué garantizar en la base antes de escribir código de aplicación, cómo estructurar el servicio y qué pruebas exigir. Úsala al empezar a implementar cualquier flujo con dinero, cumplimiento o plazos legales, o cuando alguien pregunte por dónde empezar a codificar."
---

# Implementar a partir de la bóveda

La bóveda `docs/` **es la especificación**. No se programa contra la memoria de una
reunión: se programa contra el caso de uso, y lo que el caso de uso no diga se
resuelve **agregándolo al caso de uso primero**.

## Orden de lectura obligatorio

```
1. docs/CasosDeUso/CU-NN …        ← el flujo, paso a paso
2. docs/Restricciones.md           ← qué garantiza la base (códigos R-XXX-nn)
3. docs/Modelos/Entidades/<tabla>  ← columnas, claves, FK entrantes y salientes
4. docs/entidades/NN_modulo.md     ← por qué la entidad existe (evita rediseñarla mal)
5. docs/Cumplimiento.md            ← qué norma obliga el flujo, si aplica
```

Si algo de esos cinco falta o se contradice, **eso es el primer bug**: se corrige
la bóveda antes de escribir código.

## Orden de construcción

1. **Migración con restricciones primero.** Antes que cualquier servicio, aplicar
   las restricciones del caso (`scripts/sql/restricciones.sql`). Escribir la lógica
   antes que la barrera es la forma habitual de descubrir en producción que la
   barrera no existía.
2. **Semillas de catálogo.** Umbrales, límites, tarifario, impuestos, catálogo de
   reportes y licencia. Sin catálogo sembrado, la regla de *denegar por omisión*
   bloquea todo, y eso es correcto.
3. **Servicio de dominio**, en una transacción por caso de uso.
4. **Adaptadores** (pasarela, mensajería, servicio fiscal) detrás de una interfaz,
   con idempotencia en el borde.
5. **Pruebas**: los criterios de aceptación del caso de uso, traducidos uno a uno.

## Reglas no negociables al codificar

| Regla | Cómo se ve en el código |
| --- | --- |
| **Una transacción por caso de uso** | Todo lo que el caso marca como "en la misma transacción" va en un único `BEGIN…COMMIT`. Nada de "primero guardo y después ajusto el saldo". |
| **Idempotencia en el borde** | La clave llega del cliente o del proveedor y se valida **antes** de cualquier escritura. Reintento = misma respuesta, cero efectos. |
| **El saldo no se escribe: se deriva** | Nunca `UPDATE cuenta SET saldo = saldo - x`. Se insertan movimientos con contrapartida y la caché de saldo se sincroniza dentro de la misma transacción. |
| **Nada se edita** | Corrección = movimiento inverso. Si aparece un `UPDATE` sobre una tabla *append-only*, la base lo rechaza; el código no debería ni intentarlo. |
| **Los plazos se calculan al crear** | `plazo_respuesta`, `fecha_limite`, `plazo_reporte`, `vence_en` se persisten. Prohibido calcularlos en la consulta. |
| **Denegar por omisión** | Falta límite, licencia, tarifario o política vigente → se rechaza. Nunca se asume permitido. |
| **Outbox, no llamadas dentro de la transacción** | Notificaciones, webhooks y reportes se disparan desde `evento_dominio`, no invocando el servicio externo dentro del `COMMIT`. |
| **Contexto de sesión para RLS** | Cada request setea `app.usuario_id` y `app.rol`; sin eso, las políticas de fila no protegen nada. |

## Estructura sugerida por caso de uso

```
<modulo>/
  aplicacion/CU31DevengarComision.ts      ← orquesta la transacción
  dominio/DevengoComision.ts              ← invariantes de negocio
  infraestructura/DevengoRepositorio.ts   ← SQL, sin lógica
  infraestructura/PasarelaAdapter.ts      ← borde externo, idempotente
  pruebas/CU31.spec.ts                    ← criterios de aceptación del caso
```

Un archivo de aplicación por caso de uso, con el código `CU-NN` en el nombre: hace
que la trazabilidad especificación → código sea obvia sin herramientas.

## Definición de terminado

- [ ] Todos los criterios de aceptación del caso de uso pasan como pruebas.
- [ ] Existe al menos una prueba que **verifica el rechazo** de cada restricción
      citada en el caso (no basta el camino feliz).
- [ ] Prueba de reintento: la misma operación con la misma clave no duplica nada.
- [ ] Las consultas de verificación de `docs/Restricciones.md` devuelven cero filas
      después de correr la suite.
- [ ] Si el flujo tiene plazo legal, hay una prueba de vencimiento.
- [ ] Si el flujo mueve dinero, hay una prueba de que la suma de movimientos de la
      transacción es cero y que el asiento cuadra.
- [ ] La bóveda quedó al día: si algo cambió, se actualizó el caso de uso, la
      restricción o el modelo — no solo el código.

## Señales de que hay que volver a la bóveda

- El código necesita una columna que no existe → skill `boveda-modelo`.
- Aparece un `if` con un número regulatorio adentro → va a catálogo, skill `norma-nueva`.
- Hay una regla que "el backend valida" y protege dinero → skill `restriccion`.
- El flujo real difiere del caso de uso → se actualiza el caso, no se deja
  divergir en silencio.

## Ver también

`docs/CasosDeUso/_CasosDeUso.md` · `docs/Restricciones.md` · `docs/Cumplimiento.md`
