---
tags:
  - moc
  - plan
  - recetario
titulo: "Recetario — implementar un caso de uso, paso a paso"
fecha: 2026-08-14
aplica_a: los 87 casos de uso, sin excepción
---

# Recetario — implementar un caso de uso

> **Para qué es este documento.** Para que implementar un caso de uso sea
> **mecánico**: mismo orden de lectura, mismo orden de construcción, mismos nombres
> de archivo, mismas firmas, mismas pruebas. Si dos carriles implementan dos CU
> distintos, los archivos tienen que parecerse tanto que se puedan revisar igual.
>
> **Nada de lo que hay acá es invención de este plan.** Todo sale de las skills
> `implementar-desde-boveda`, `back-nestjs`, `arquitectura-atomica`, `contratos-api`,
> `errores-api`, `idempotencia-reintentos`, `trabajos-outbox`, `dinero-decimal`,
> `seguridad-sesion-rls`, `entorno-monorepo`, `git-flujo` y `definicion-de-terminado`.

---

## 1 · Orden de lectura obligatorio

Antes de escribir una línea, se leen **estos seis, en este orden**
(`implementar-desde-boveda`):

```
1. docs/CasosDeUso/CU-NN …        ← el flujo, paso a paso
2. docs/Restricciones.md           ← qué garantiza la base (códigos R-XXX-nn)
3. docs/Modelos/Entidades/<tabla>  ← columnas, claves, FK entrantes y salientes
4. docs/entidades/NN_modulo.md     ← por qué la entidad existe
5. docs/Cumplimiento.md            ← qué norma obliga el flujo, si aplica
6. docs/Stack.md + los ADR         ← con qué se construye y por qué
```

> **Si alguno falta o se contradice con otro, eso es el primer bug**: se corrige la
> bóveda **antes** de escribir código.

El caso de uso **ya trae escritas** las cuatro decisiones que normalmente se
improvisan: el contrato, la descomposición atómica, los eventos/trabajos/permisos y
la interfaz. **No se rediseñan al programar: se implementan.** Si al implementar se
descubre que estaban mal, se corrige el caso de uso **en el mismo PR**.

---

## 2 · Declarar la descomposición, por escrito

Antes de crear el primer archivo, en el PR o en el mensaje, con **este formato exacto**
(`arquitectura-atomica`):

```
CU-21 Cobrar el aporte del período
  Organismo  CU21CobrarAporte.ts             abre la transacción
  Moléculas  ObligacionRepositorio.ts        lee y marca la obligación
             MovimientoRepositorio.ts        inserta la contrapartida
             PasarelaQrAdapter.ts            (borde, se invoca desde el worker)
  Átomos     CalculoDeAporte.ts              monto + recargo, puro
             Dinero.ts                       ya existe en packages/dominio
```

**Si no se puede escribir esa lista, todavía no se entendió el caso de uso.**

### Árbol de decisión del nivel

```
¿Necesita base, red o reloj?
├── No  → ÁTOMO        (dominio/, atomos/)
└── Sí  → ¿Depende de UN colaborador y hace UNA cosa?
         ├── Sí → MOLÉCULA     (infraestructura/, moleculas/)
         └── No → ¿Orquesta varias piezas hacia un objetivo completo?
                  ├── Sí → ORGANISMO  (aplicacion/, organismos/)
                  └── No → está haciendo de más: partila
```

### Las cinco preguntas de frontera transaccional

También por escrito, antes de implementar ([[Prompt de backend]] §2):

1. ¿Qué tiene que ocurrir **todo junto o nada**?
2. ¿Qué queda **fuera** del commit?
3. ¿Cuál es la **clave de idempotencia** y de dónde viene: cliente o proveedor?
4. ¿Qué se **bloquea** si dos usuarios hacen esto a la vez, y a qué granularidad?
5. ¿Qué pasa si el proceso **muere justo después del commit**?

---

## 3 · Orden de construcción — los ocho pasos

De `implementar-desde-boveda`. **No se saltea ninguno y no se cambia el orden.**

| # | Paso | Por qué va acá |
| :-: | --- | --- |
| **1** | **Restricciones primero** — aplicar las del caso (`sql/40_reglas/restricciones.sql`) | Escribir la lógica antes que la barrera es la forma habitual de descubrir en producción que la barrera no existía |
| **2** | **Semillas de catálogo** — umbrales, límites, tarifario, impuestos, licencia | Sin catálogo, *denegar por omisión* bloquea todo. Y eso es correcto |
| **3** | **Contrato** en `packages/contratos/src/CU<NN>.ts` | Cierra preguntas que si no aparecen a mitad del código |
| **4** | **Átomos** puros, con pruebas en milisegundos | Son la parte que se puede probar rápido y mil veces |
| **5** | **Moléculas** — repositorios y adaptadores, uno por colaborador, sin abrir transacción | |
| **6** | **Organismo** — el caso de uso, única frontera transaccional | |
| **7** | **Página** — el controlador: traduce y delega, sin lógica | |
| **8** | **Pruebas** — los criterios de aceptación, traducidos uno a uno | |

### Estructura de archivos resultante

```
packages/contratos/src/CU31.ts                    ← entrada, salida, códigos de error
apps/api/src/modulos/11_tarifas_comisiones/
  aplicacion/CU31DevengarComision.ts              ← ORGANISMO: orquesta la transacción
  dominio/DevengoComision.ts                      ← ÁTOMO: invariantes, sin IO
  infraestructura/DevengoRepositorio.ts           ← MOLÉCULA: SQL, sin lógica
  infraestructura/PasarelaAdapter.ts              ← MOLÉCULA de borde, idempotente
  http/comisiones.controller.ts                   ← PÁGINA: traduce y delega
  pruebas/CU31.spec.ts                            ← criterios de aceptación
```

---

## 4 · Las firmas exactas

Estas son las formas canónicas. **Se copian, no se reinventan** (`back-nestjs`).

### El controlador no piensa

```ts
@Post('aportes')
async cobrar(@Body() body: unknown, @Ctx() ctx: Contexto) {
  const entrada = EntradaCU21.parse(body)          // contrato estricto
  return this.cu21.ejecutar(ctx, entrada)          // y nada más
}
```

Sin `if` de negocio, sin cálculos, sin SQL, sin transacción.

### El caso de uso es el único que abre transacción

```ts
export class CU21CobrarAporte {
  async ejecutar(ctx: Contexto, entrada: EntradaCU21): Promise<SalidaCU21> {
    return conTransaccion(ctx, async (tx) => {          // BEGIN + SET LOCAL
      await this.idempotencia.exigirNueva(tx, entrada.claveIdempotencia)

      const obligacion = await this.obligaciones.tomarParaActualizar(tx, entrada.obligacionId)
      const calculo    = calcularAporte(obligacion, entrada.monto)   // átomo puro

      await this.movimientos.insertarPar(tx, calculo)                 // molécula
      await this.eventos.registrarYEncolar(tx, 'aporte.confirmado', calculo)

      return calculo.aSalida()
    })
  }
}
```

| Regla | Dónde se ve |
| --- | --- |
| Idempotencia **antes** de escribir | `exigirNueva` es la primera línea |
| Contexto de RLS dentro de la transacción | `conTransaccion` hace el `SET LOCAL` |
| El cálculo es un átomo puro | `calcularAporte` no recibe la conexión |
| El saldo se deriva, no se actualiza | `insertarPar` inserta movimiento y contrapartida |
| El efecto externo va por outbox | `registrarYEncolar`, dentro del `COMMIT` |
| Nada de proveedores acá | Ningún `await pasarela.*` dentro de la transacción |

### Encolar un efecto

```ts
await this.eventos.registrarYEncolar(tx, {
  tipo: 'aporte.confirmado',
  agregadoId: pago.id,
  clave: `aporte:${pago.id}`,        // clave de idempotencia del efecto
  cargaUtil: { pagoId: pago.id },    // identificadores, NO datos derivados
})
```

### Consumir un trabajo

```ts
export const enviarAvisoDeAporte = async ({ pagoId }, helpers) => {
  await conTransaccion(ctxSistema, async (tx) => {
    if (await yaEnviado(tx, pagoId)) return          // al menos una vez ⇒ idempotente
    const aviso = await construirAviso(tx, pagoId)
    const res   = await mensajeria.enviar(aviso)     // borde externo
    await registrarIntento(tx, pagoId, res)          // evidencia de cada intento
  })
}
```

### Contexto de sesión

```ts
await conTransaccion(ctx, async (tx) => {
  // dentro ya corrieron:
  //   SET LOCAL app.usuario_id
  //   SET LOCAL app.rol
  return organismo.ejecutar(tx, entrada)
})
```

`SET` sin `LOCAL` **persiste en la conexión del pool**: el siguiente request hereda la
identidad del anterior. Es la fuga de datos más silenciosa que puede tener este
sistema, y no deja rastro.

---

## 5 · Las piezas de `comun/` — nombres canónicos

De `back-nestjs`. **Estos son los nombres; no se inventan sinónimos.**

| Pieza | Qué hace |
| --- | --- |
| `conTransaccion(ctx, fn)` | Abre transacción, fija `app.usuario_id` y `app.rol` con `SET LOCAL`, revierte ante error |
| `Idempotencia` | Busca la clave; si existe, devuelve **la respuesta original** sin escribir |
| `FiltroDeErrores` | Traduce el rechazo de la base al código `R-XXX-nn`; nunca filtra SQL al cliente |
| `Traza` | Propaga el identificador hasta el worker; toda línea de log lleva `cu` y `usuario_id` |
| `ConfigSchema` | Valida las variables de entorno al arrancar; si falta una, el proceso no levanta |

Y las interfaces de dominio para los bordes: `PasarelaQr`, `ServicioFiscal`,
`Mensajeria`, `AlmacenArchivos`, `Reloj`, `Ids` — registradas por token, inyectadas
siempre.

> **`Reloj` e `Ids` se inyectan.** Son lo que vuelve determinista una prueba de
> plazos. Un `new Date()` dentro de un cálculo es una prueba no determinista esperando
> fecha.

---

## 6 · Dinero — las reglas exactas

De `dinero-decimal`.

### El driver, una sola vez, al crear el pool

```ts
import { types } from 'pg'
types.setTypeParser(1700, (v) => v)   // numeric  → string
types.setTypeParser(20,   (v) => v)   // int8     → string
```

**Si esto falta, todo lo demás es decorativo.**

### `Dinero`, con moneda

```ts
const cuota   = Dinero.de('150.00', 'BOB')
const recargo = Dinero.de('7.50', 'BOB')
const total   = cuota.mas(recargo)            // 157.50 BOB
cuota.mas(Dinero.de('10.00', 'USD'))          // ⇒ error, no conversión silenciosa
```

Nada de `+`, `-`, `*`, `/` sobre importes. Nunca `parseFloat`, nunca `Number()`.

### La lista exacta que prohíbe el lint

`number` queda prohibido en cualquier tipo, campo o parámetro cuyo nombre denote
dinero: **`monto`, `importe`, `saldo`, `comision`, `impuesto`, `total`, `deuda`,
`aporte`, `cuota`, `recargo`, `mora`**. Un `eslint-disable` sobre esta regla se
rechaza en revisión.

### Redondeo

- **Una sola vez**, al cerrar el cálculo, **nunca** en un paso intermedio.
- La regla la fija el tarifario (`concepto_tarifa`), no quien programa.
- Explícito: `.redondear(2, reglaDelTarifario)`.
- En un prorrateo, **el residuo se asigna deliberadamente**: se define a quién le toca
  el centavo y se prueba que la suma de las partes iguala el total.

### Serialización

| Frontera | Forma |
| --- | --- |
| Base ⇄ backend | `numeric` ⇄ *string* |
| Backend ⇄ cliente | `{"monto": "150.00", "moneda": "BOB"}` |
| Contrato Zod | `z.string().regex(/^-?\d+\.\d{2}$/)` + `z.enum(['BOB','USD'])` |
| Vista | El átomo `Monto` formatea; **nunca** calcula |

En la base: `DECIMAL(14,2)`, o **`(16,2)` para acumulados**, siempre con
`moneda CHAR(3)`.

---

## 7 · Errores — la forma exacta

De `errores-api`.

```json
{
  "codigo": "AP-CU21-03",
  "mensaje": "No tenés saldo suficiente para este aporte.",
  "detalle": { "faltante": "45.00", "moneda": "BOB" },
  "trazaId": "01J8X…"
}
```

### Mapeo a HTTP

| Situación | HTTP | Cuerpo |
| --- | :-: | --- |
| Entrada inválida por esquema Zod | `400` | Lista de campos con mensaje |
| **Regla de negocio de la aplicación** | **`422`** | `{ codigo: 'AP-CU21-02', … }` |
| Sin permiso o fuera de política de fila | `403` o resultado vacío | Sin detalles internos |
| Restricción de la base rechaza | `409` | `{ codigo: 'R-LIM-02', … }` traducido |
| Clave de idempotencia repetida | `200` | **La respuesta original, íntegra** |
| Proveedor externo indisponible | `202` | Aceptado; se completa por la cola |
| Falla no prevista | `500` | **Solo `trazaId`. Nada más** |

> **`422`, no `400`, para las reglas de negocio.** El `400` es del esquema; el `422`
> es de la regla. Confundirlos hace que el cliente no pueda distinguir «mandaste mal
> el formulario» de «no tenés saldo».

### Traducir el rechazo de PostgreSQL

```ts
const TRADUCCION: Record<string, { codigo: string; mensaje: string; http: number }> = {
  uq_transaccion_clave_idempotencia: { codigo: 'AP-CU21-00', mensaje: 'Operación ya registrada.', http: 200 },
  ck_movimiento_monto_positivo:      { codigo: 'R-BIL-03',   mensaje: 'El importe debe ser mayor a cero.', http: 409 },
  ex_puntaje_vigente:                { codigo: 'R-REP-02',   mensaje: 'Ya hay un puntaje vigente para ese período.', http: 409 },
}
```

1. **Nunca dejar pasar el error crudo.**
2. **Sin traducción ⇒ `500` y alerta.** Una restricción que dispara y no está en el
   catálogo es un caso que nadie previó: **se registra como incidente**, no se
   improvisa un mensaje genérico.
3. **El código de la restricción viaja al cuerpo**, para rastrear hasta la norma.

### Cómo se escribe el mensaje

| En vez de | Escribir |
| --- | --- |
| «Error de validación» | «El monto debe ser igual al de la obligación: Bs 500,00.» |
| «Operación no permitida» | «Superaste el límite mensual de tu nivel. Podés ampliarlo verificando tu identidad.» |
| «Constraint violation» | «Ese pago ya fue registrado.» |
| «Usuario no autorizado» | «No tenés acceso a este grupo.» |

**Nunca** aparece: SQL, nombres de tabla o columna, trazas, rutas de archivo,
identificadores de otro usuario, ni el motivo real de un bloqueo por inteligencia
financiera (deber de reserva).

### Registro de códigos

- Un código por regla, junto al contrato del caso de uso.
- **Los códigos no se reutilizan.** Un código retirado queda retirado; reusarlo mezcla
  incidentes viejos con nuevos en el soporte.
- Un código sin prueba que lo dispare es **decorativo**.

---

## 8 · Idempotencia — las reglas exactas

De `idempotencia-reintentos`.

**La garantía vive en la base**, como restricción única. No en un `if` que consulta
antes de escribir: entre el `SELECT` y el `INSERT` cabe otra ejecución. El flujo
correcto es **intentar escribir y manejar el conflicto**.

| Origen | Clave |
| --- | --- |
| Cliente | UUID que el cliente genera y **reenvía igual** en el reintento |
| Webhook | Identificador del evento del proveedor + su tipo |
| Trabajo del worker | Identificador del evento de dominio |
| Proceso periódico | Clave natural del período (`grupo_id + periodo`) |

> **Una clave generada por el servidor en cada request no sirve para nada**: cada
> reintento traería una distinta.

**El reintento devuelve la respuesta original, íntegra, con `200`.** Eso implica
**guardar la respuesta** junto con la clave, no solo la clave.

### Las cuatro fallas de webhook

| Falla | Qué debe pasar |
| --- | --- |
| **Duplicado** | Sin efecto nuevo. Se responde `200` igual: con un error, el proveedor lo reenvía para siempre |
| **Fuera de orden** | Una confirmación posterior a un reverso **no revive** la operación |
| **Tardío** | Llega con la orden expirada: se registra y se resuelve por conciliación |
| **Desconocido** | Referencia inexistente: se guarda en `webhook_pasarela` **y se alerta** |

Y siempre: **verificar la firma antes de procesar.**

### Máquina de estados, no banderas

```
pendiente → confirmado → reversado
     ↓
  expirado
```

`confirmado → confirmado` no hace nada. `reversado → confirmado` se rechaza.

### Reintentos propios

| Situación | Política |
| --- | --- |
| Timeout o `5xx` del proveedor | Reintento con retroceso exponencial y tope |
| **`4xx` del proveedor** | **No se reintenta**: es un error nuestro. Se marca fallido con evidencia |
| Agotados los reintentos | `cola_muerta` con el motivo, **visible en el backoffice**. Nunca silencio |
| Operación de dinero | El reintento usa **la misma** clave; una nueva cobra dos veces |

### Antipatrones

| Antipatrón | Qué rompe |
| --- | --- |
| `SELECT` para ver si existe y después `INSERT` | Carrera: dos requests pasan los dos |
| Clave generada por el servidor | No hay idempotencia |
| Devolver `409` al reintento | El cliente cree que falló algo que sí pasó |
| Responder error a un webhook duplicado | El proveedor reenvía indefinidamente |
| `sleep` y reintentar en el mismo request | Ocupa la conexión y no sobrevive a un reinicio |

---

## 9 · Adaptadores de proveedores — los cinco obligatorios

De `trabajos-outbox`. Todo borde externo tiene:

| Elemento | Obligatorio |
| --- | --- |
| Clave de idempotencia propia | Sí, enviada al proveedor cuando lo soporta |
| **Timeout explícito** | Sí; sin timeout, un proveedor lento bloquea la cola |
| Modo de prueba | Sí, para integración |
| Registro de petición y respuesta | Sí, **sin datos sensibles en claro** |
| **Doble fiel para pruebas** | Timeout, duplicado, respuesta fuera de orden, error permanente |

### Trabajos con fecha

```
'0 1 * * *  cierre_diario   ?jobKey=cierre:diario&jobKeyMode=preserve_run_at'
```

- **Bloqueo por identificador**: con varias réplicas corre **una sola vez**.
- El trabajo **verifica su propia precondición**: si el día ya está sellado, termina
  sin hacer nada.
- Los plazos **ya están persistidos** (`vence_en`, `plazo_respuesta`): el trabajo los
  consulta, **no los recalcula**.
- Todo trabajo con consecuencia legal **alerta antes de vencer**, no al vencer.

---

## 10 · Roles de base — los nombres reales

`sql/00_base/01_roles.sql` es la fuente de verdad. Las skills usan nombres cortos;
**los reales son estos cinco**:

| Rol real | Alias en las skills | Puede | No puede |
| --- | --- | --- | --- |
| `rol_aplicacion` | `api` | Leer y escribir según políticas | `UPDATE`/`DELETE` en append-only; editar catálogos regulatorios |
| `rol_backoffice` | — | Operación y soporte | Escribir el libro contable |
| `rol_cumplimiento` | — | UIF, ASFI, casos | Operar dinero |
| `rol_auditor` | `reportes` | **Solo lectura**, en la réplica | Escribir cualquier cosa |
| `rol_migracion` | `migrador` | DDL | Correr en horario de servicio sin ventana |

Ninguno es superusuario. **Si un proceso necesita más permisos de los que tiene, la
respuesta por defecto es que el diseño está mal, no que falta un `GRANT`.**

El worker corre con `rol_aplicacion` y **fija su propio contexto**: actúa como
sistema, con su identificador. Cuando el evento trae el actor original, se propaga.
**Un efecto sin actor identificable es un agujero de auditoría.**

---

## 11 · Comandos — el mapa exacto

`entorno-monorepo` define los comandos con Kysely; este proyecto usa MikroORM
(ADR-014). **La equivalencia es esta**, y es la que vale:

| Skill dice | En este proyecto | Qué hace |
| --- | --- | --- |
| `yarn datos:tipos` | **`yarn datos:entidades`** | Regenera desde la base viva |
| `yarn test:atomos` | **`yarn test:unit`** | Solo puras, sin contenedor |
| `yarn test` | `yarn test:integracion` + `test:api` | Con Testcontainers |
| `yarn contratos:openapi` | igual | Deriva el OpenAPI |
| `yarn lint` · `yarn typecheck` | igual | Ambos bloquean el PR |

### Arranque local, en orden

```bash
yarn install --immutable
docker compose up -d postgres pgbouncer
python3 scripts/generar_ddl.py
psql -d aportaya -v ON_ERROR_STOP=1 -f sql/aplicar.sql
psql -d aportaya -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql        # 20 catálogos
psql -d aportaya -f sql/61_prueba/sembrar_prueba.sql                       # 14, solo local
psql -d aportaya -f sql/50_verificacion/prueba_humo.sql                    # todo OK, cero FALLA
yarn datos:entidades
yarn dev
```

> **Si te salteás las semillas, nada funciona**, y es el comportamiento correcto:
> *denegar por omisión* rechaza toda operación sin límite, tarifario y licencia
> vigentes.

### Cuando cambia el modelo — procedimiento, no edición

```
1. skill boveda-modelo    → editar el .puml, regenerar las notas
2. skill restriccion      → si hay regla nueva que garantizar
3. python3 scripts/generar_ddl.py
4. aplicar sql/ en la base local
5. yarn datos:entidades   → el compilador señala cada lugar a revisar
6. actualizar contratos y pruebas
```

**Nunca** se edita `sql/` a mano ni se escribe una migración suelta.

---

## 12 · Git — ramas, commits y PR

De `git-flujo`.

```
main   ← lo estable
dev    ← integración; acá apuntan los PR
<usuario>/<tipo>/<tema>   ← el trabajo
```

Tipos: `feature`, `fix`, `docs`, `chore`, `modelo`.
**Nunca se commitea directo a `main` ni a `dev`.**

| Prefijo de commit | Para |
| --- | --- |
| `feat` | Funcionalidad nueva |
| `fix` | Corrección |
| `modelo` | Cambio en `docs/entidades/*.puml` y lo que se genera |
| `docs` | Bóveda, casos de uso, restricciones |
| `chore` | Herramientas, configuración, scripts |
| `test` | Pruebas solas |

En **español**, imperativo, citando el caso de uso: `feat: CU-21 cobrar aporte con QR`.
Un commit que dice `fix: arreglos varios` es un commit que nadie va a poder revertir
con confianza.

### Un PR trae el cambio **completo**

| Si el PR toca… | También trae |
| --- | --- |
| Un `.puml` | La bóveda y el SQL regenerados, y la ficha del módulo |
| Un caso de uso | Sus restricciones citadas, si son nuevas |
| Una restricción | Su prueba de rechazo y su consulta de verificación |
| Un catálogo | El JSON en `seeders/`, el manifiesto y el README |
| Código de un caso de uso | Su contrato en `packages/contratos/` y sus pruebas |

> **Un PR que cambia el código y deja la bóveda vieja crea dos verdades. Si divergen,
> gana la bóveda y el código está mal.**

### Antes de abrir el PR

```bash
python3 scripts/generar_boveda.py     # "sin_resolver": []
python3 scripts/generar_ddl.py        # "Sin pendientes a nivel de datos."
psql -d aportaya -v ON_ERROR_STOP=1 -f sql/aplicar.sql
psql -d aportaya -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql
psql -d aportaya -f sql/50_verificacion/prueba_humo.sql    # todo OK, cero FALLA
```

**Los números que se ponen en la descripción son los que salieron, no los que se
esperaban.**

---

## 13 · Cómo se reporta que está terminado

De `definicion-de-terminado`. **Se reporta con esta matriz, no en prosa:**

| Área | Gate | Evidencia | Estado |
| --- | --- | --- | --- |
| Especificación | Criterios de aceptación cubiertos | `CU21.spec.ts`, 14/14 | Pass |
| Datos | Restricciones citadas con prueba de rechazo | 6/6 rechazos verificados | Pass |
| Seguridad | Prueba negativa de RLS | contexto ajeno ⇒ 0 filas | Pass |
| Plazos | Vencimiento y aviso previo | `CU52.spec.ts` 3/3 | Pass |
| Arquitectura | Piezas por nivel, sin saltos | `aportaya/capas` en verde | Pass |
| Operación | Health, readiness, trazas | `curl /salud/listo` → 200 | Pass |
| Entrega | Lint, tipos, pruebas, build | salida citada | Pass |
| Continuidad | Restauración probada | — | **Fail** |

### Frases prohibidas sin evidencia detrás

| No decir | Decir |
| --- | --- |
| «Está listo para producción» | «Pasan 7 de los 8 gates; el de restauración quedó pendiente» |
| «Debería funcionar» | «No lo pude ejecutar porque falta X; queda sin verificar» |
| «Ya está probado» | «14 criterios como pruebas, 6 rechazos de restricción, `yarn test` en verde» |
| «Es seguro» | «Prueba negativa de RLS y de permisos en verde; sin escaneo de imagen todavía» |

---

## 14 · Señales de que hay que volver a la bóveda

| Señal | Qué hacer |
| --- | --- |
| El código necesita una columna que no existe | skill `boveda-modelo` |
| Aparece un `if` con un número regulatorio adentro | Va a catálogo: skill `norma-nueva` |
| Hay una regla que «el backend valida» y protege dinero | skill `restriccion` |
| El flujo real difiere del caso de uso | Se actualiza el caso, **no se deja divergir** |
| Un archivo pasa de ~200 líneas (backend) o ~150 (componente) | Varios niveles mezclados |
| Hay que leer tres archivos para entender uno | Las dependencias no van en una dirección |
| Aparece `utils.ts`, `helpers.ts`, `common.ts` | Átomos sin nombre |
| El mismo cálculo aparece en la app y en la API | Falta un átomo en `packages/dominio` |
| Un componente hace `fetch` | Falta la capa de dominio del cliente |

---

## 15 · Antipatrones que se rechazan en revisión

De `back-nestjs`, sin discusión:

- Lógica de negocio en el controlador o en el repositorio.
- Transacción abierta dentro de una molécula.
- `await` a un proveedor externo dentro de `conTransaccion`.
- Servicio que atiende cuatro casos de uso «porque se parecen».
- Consulta fuera de `conTransaccion` sobre tablas con RLS.
- `any` para esquivar el tipo generado de una tabla.

## Ver también

[[00 Plan maestro]] · [[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[07 Carriles de trabajo concurrente]] · [[Prompt de backend]] · [[Flujo de una transacción]] · [[Restricciones]]
