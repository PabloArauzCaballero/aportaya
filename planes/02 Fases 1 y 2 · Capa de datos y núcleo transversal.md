---
tags:
  - plan
  - fase
titulo: "Fases 1 y 2 — Capa de datos y núcleo transversal"
fases: [1, 2]
depende_de: [0]
habilita: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
---

# Fases 1 y 2 — Capa de datos y núcleo transversal

> **Por qué van juntas en un documento.** La Fase 1 construye las piezas que todos
> los módulos comparten (dinero, tiempo, entidades, transacción); la Fase 2 las
> ensambla en un pipeline HTTP y un worker que funcionan. Son dos gates distintos,
> pero un solo cuerpo de decisiones: si algo sale mal acá, sale mal en las 15 fases
> siguientes multiplicado por 87 casos de uso.

> **Se ejecuta en:** Ola 0 · carril T (troncal, máquina única). **Ningún otro carril trabaja hasta que su gate esté ejecutado.**
> Ver [[07 Carriles de trabajo concurrente]].

> [!important] Antes de escribir la primera línea
> [[00b Estándar de ejecución · código limpio, pruebas y calidad]] aplica en
> esta fase entera: regla cero de no inventar, composición atómica, KISS,
> nombres del dominio, las seis pruebas obligatorias por caso de uso y el
> checklist de PR. **Se declara cada pieza por nivel antes de crearla.**

> **Receta exacta:** [[00c Recetario · implementar un caso de uso]] fija el orden de
> lectura, el orden de construcción en ocho pasos, las firmas canónicas y los
> nombres de las piezas de `comun/`. **Se copian, no se reinventan.**

**Estas dos fases son las más importantes del plan.** Ningún módulo de negocio
compensa un `SET LOCAL` mal puesto o un `numeric` leído como `number`.

---

# FASE 1 — Capa de datos y dominio compartido

> **Objetivo.** Que exista `packages/dominio` con `Dinero` exacto y `packages/datos`
> con las 274 entidades **generadas** desde la base viva, tipadas de modo que un
> importe no pueda ser `number` ni una tabla append-only pueda actualizarse.

## Gate de entrada

- [ ] Fase 0 cerrada con su gate ejecutado
- [ ] Base con `sql/aplicar.sql` + semillas mínimas aplicadas

## Leer antes de empezar

| Archivo | Qué se saca |
| --- | --- |
| `docs/Arquitectura/ADR-005 Dinero y decimales.md` | Las tres reglas duras del decimal |
| `docs/Arquitectura/ADR-002 Acceso a datos.md` | Qué protegía Kysely — hay que protegerlo igual con MikroORM |
| `docs/Restricciones.md` § R-AUD y § "Roles de base de datos" | Qué es append-only y por qué |
| `sql/35_append_only/append_only.sql` | La **lista exacta** de tablas selladas |
| Skill `dinero-decimal` · skill `datos-kysely` | Las reglas de acceso, que se conservan aunque cambie la herramienta |

---

## 1.1 · `packages/dominio` — los átomos compartidos

Funciones puras. **Cero IO, cero base, cero reloj sin inyectar.** Cada una con su
`.spec.ts` unitario y cobertura 95 %.

| Átomo | Responsabilidad | Pruebas que exige |
| --- | --- | --- |
| `Dinero` | `Dinero.de('150.00','BOB')` · `.mas()` `.menos()` `.por(tasa)` `.compara()` · `.redondear(2, reglaDelTarifario)` · `.aCadena()` | Nunca acepta `number`; `0.1 + 0.2` da `0.30`; **`bob.mas(usd)` lanza**; el redondeo ocurre **una sola vez**, al cerrar el cálculo |
| `Moneda` | `BOB` \| `USD`, con sus decimales | Operar entre monedas distintas es error de tipo |
| `Porcentaje` | Tasa con precisión de cálculo, aplicada a `Dinero`. **Nunca dos decimales para un 7,25 %** | Aplicar 13 % de IVA a Bs 100 da exactamente Bs 13.00 |
| `Reloj` | Puerto: `ahora(): Date`. Inyectado siempre | `RelojFijo` para pruebas |
| `Periodo` | Rango de fechas del pasanaku, inclusivo/exclusivo explícito | Solapamientos, límites |
| `PlazoHabil` | Suma de días hábiles sobre un calendario **inyectado** (`dia_no_habil`) | 5 días hábiles desde un viernes con feriado el lunes; corrimiento **a favor del cliente** |
| `ClaveIdempotencia` | Objeto de valor validado (UUID v4 o derivado de un hecho) | Determinismo de la derivada |
| `Hash` | SHA-256 de contenido y de cadena de bloques | Vector de prueba conocido |
| `CodigoError` | `AP-CU<NN>-<nn>`, tipado | Formato |
| `ResultadoRestriccion` | `R-XXX-nn` + su mensaje | — |

> **`PlazoHabil` recibe el calendario, no lo consulta.** El átomo no toca la base
> (invariante de capa); la molécula `CalendarioRepositorio` se lo pasa. Y el plazo
> **se persiste al crear** (invariante 8): el átomo calcula una vez, quien guarda es
> el organismo.

**Entregable 1.1:** `packages/dominio` con los diez átomos, `yarn test:unit` en verde,
cobertura ≥ 95 %.

---

## 1.2 · `packages/datos` — entidades generadas

### Paso a paso, en este orden

```bash
yarn bd:reset                       # 1. base con el esquema de sql/ y semillas
yarn workspace @aportaya/datos entidades   # 2. genera desde la base VIVA
yarn workspace @aportaya/datos posproceso  # 3. aplica readonly + DineroType
yarn typecheck                      # 4. compila
git diff --exit-code                # 5. si hay diff, el modelo cambió y no se regeneró
```

### El post-proceso — donde se pagan los invariantes

Un script de `packages/datos/scripts/posproceso.ts` que corre **siempre** después del
generador y hace tres cosas mecánicas:

| Paso | Qué hace | Fuente de verdad |
| --- | --- | --- |
| **A** | A toda entidad cuya tabla esté sellada le agrega `@Entity({ readonly: true })` | `sql/35_append_only/append_only.sql`, parseado — no una lista copiada a mano |
| **B** | Toda columna `numeric(14,2)` **y `numeric(16,2)`** (acumulados) pasa a `type: DineroType` y su tipo TS a `Dinero` | El catálogo de columnas de la base |
| **C** | Cabecera `// GENERADO por yarn datos:entidades — NO EDITAR` en cada archivo | — |

Si el post-proceso encuentra una columna `numeric` que **no** es `(14,2)` ni `(16,2)`,
falla y pide decisión explícita: es probablemente una tasa o un porcentaje, y merece
su propio tipo. Y toda columna monetaria debe tener su `moneda CHAR(3)` al lado; si
no la tiene, también falla.

### Configuración de MikroORM

`packages/datos/src/mikro-orm.config.ts`, con lo de §4 del plan maestro. Lo crítico,
listado para que no se omita:

- **No** se instala `@mikro-orm/migrations` ni `@mikro-orm/seeder`. Si aparecen en
  `yarn.lock`, el CI falla.
- Parsers del driver registrados **antes** de crear el ORM: `1700` (numeric) y `20`
  (int8) como *string*.
- `forceUtcTimezone: true`; la zona horaria de negocio (`America/La_Paz`) vive en el
  dominio, no en el driver.
- `pool: { min, max }` desde el entorno; distinto para api y worker.
- `resultCache` **desactivado** para todo lo que toque dinero o RLS: una caché de
  resultados con contexto de sesión es una fuga de datos disfrazada de rendimiento.

### Fábrica de conexiones

| Conexión | Rol de base | Va por | Para qué |
| --- | --- | --- | --- |
| `escritura` | `rol_aplicacion` | PgBouncer | Todos los casos de uso |
| `lectura` | `rol_auditor` | réplica, directo | Extractos, listados pesados, reportes (ADR-011) |
| `worker` | `rol_aplicacion` | **directo**, sin pooler | Graphile Worker necesita `LISTEN/NOTIFY` |
| `cumplimiento` | `rol_cumplimiento` | PgBouncer | Backoffice de UIF/ASFI (Fase 16) |

**Entregable 1.2:** 274 entidades generadas y compilando; `yarn datos:entidades &&
git diff --exit-code` vacío; las selladas marcadas `readonly`; toda columna monetaria
tipada `Dinero`.

---

## 1.3 · Las tres pruebas que cierran la Fase 1

Estas tres no son "una prueba más": son la evidencia de que los invariantes 1, 4 y 5
se sostienen con un ORM en el medio.

| Prueba | Qué hace | Qué demuestra |
| --- | --- | --- |
| `entidades-al-dia.spec.ts` | Regenera contra la base de Testcontainers y compara con lo versionado | Invariante 1: el esquema sigue siendo de `sql/` |
| `append-only.spec.ts` | Intenta `nativeUpdate` sobre `asiento_contable`, `movimiento_billetera`, `evento_dominio` y todas las selladas | Invariante 5: la base rechaza por `REVOKE`, **no** la aplicación |
| `dinero-cuadre.spec.ts` | Las **seis** pruebas de `dinero-decimal`: cuadre `0.00` · asiento equilibrado en SQL · propiedad con mil operaciones · prorrateo con residuo asignado · operar monedas distintas **lanza** · la API devuelve *string* de dos decimales | Invariante 4 |

**Entregable 1.3:** las tres en verde.

---

## Gate de salida de la Fase 1

```bash
yarn bd:reset && yarn datos:entidades && git diff --exit-code
yarn lint && yarn typecheck
yarn test:unit && yarn test:integracion
```

- [ ] Los nueve puntos del gate común
- [ ] `Dinero` no acepta `number` en ninguna firma pública (verificado por tipos, no por prueba)
- [ ] `@mikro-orm/migrations` y `@mikro-orm/seeder` **ausentes** de `yarn.lock`
- [ ] Las tres pruebas de 1.3 en verde
- [ ] Reglas de lint `sin-number-monetario`, `sin-schema-generator` y `sin-update-append-only` activadas y con `RuleTester`

---
---

# FASE 2 — Núcleo transversal de la API y el worker

> **Objetivo.** Que el pipeline de [[Flujo de una transacción]] exista completo, de
> punta a punta, con **un caso de uso de mentira** que lo ejercite. Cuando la Fase 3
> escriba CU-01, lo único que tiene que hacer es rellenar el organismo: el camino ya
> está.

## Gate de entrada

- [ ] Fase 1 cerrada con su gate ejecutado

## Leer antes de empezar

| Archivo | Qué se saca |
| --- | --- |
| `docs/Arquitectura/Flujo de una transacción.md` | **Los 12 pasos, en orden. Es el índice de esta fase** |
| `docs/Arquitectura/ADR-007 Sesión, RLS y pooling.md` | `SET LOCAL`, PgBouncer, roles |
| `docs/Arquitectura/ADR-003 Trabajos, outbox y planificador.md` | Outbox, Graphile Worker, cron con bloqueo |
| `docs/Arquitectura/ADR-006 Contratos y validación.md` | Zod, `.strict()`, OpenAPI derivado |
| `docs/Restricciones.md` completo | El catálogo `R-XXX-nn` que hay que traducir |
| Skill `idempotencia-reintentos` · `errores-api` · `observabilidad` | Reglas del borde |

---

## 2.1 · `apps/api/src/comun/` — los doce pasos hechos código

Cada archivo implementa un paso numerado de [[Flujo de una transacción]]. El número
va en el comentario de cabecera, para que la trazabilidad especificación→código no
requiera herramienta.

> **`app.module.ts` no lista módulos: los descubre por glob** (`modulos/**/*.module.ts`).
> Es lo que permite que siete carriles agreguen módulos sin editar nunca el mismo
> archivo ([[07 Carriles de trabajo concurrente]] §5).

```
apps/api/src/comun/
├── configuracion/
│   ├── ConfigSchema.ts            esquema Zod del entorno (§10) ← nombre canónico
│   └── configuracion.module.ts
├── http/
│   ├── zod-validacion.pipe.ts     paso 1 · .strict(), error de esquema → 400
│   ├── respuesta.interceptor.ts   forma única { datos, trazaId }
│   ├── FiltroDeErrores.ts         forma única de error + mapeo HTTP de §5  ← nombre canónico
│   └── Traza.ts                   x-request-id → AsyncLocalStorage; llega al worker
├── autenticacion/
│   ├── jwt.strategy.ts            paso 2 · bearer o cookie
│   ├── sesion.guard.ts            GLOBAL, default-deny
│   ├── permiso.guard.ts           permiso concreto sobre el recurso concreto
│   └── contexto-sesion.ts         { usuarioId, rol, permisos, dispositivoId, traza }
├── idempotencia/
│   ├── Idempotencia.ts            paso 3 · exigirNueva(tx, clave) ANTES de escribir
│   └── IdempotenciaRepositorio.ts  guarda clave **y respuesta**, no solo la clave
├── transaccion.ts                 pasos 4 y 5 · conTransaccion() con SET LOCAL
├── errores/
│   ├── errores.ts                 ErrorDeNegocio(AP-CU<NN>-<nn>) · ErrorDeAutorizacion
│   └── catalogo-restricciones.ts  constraint_name → { codigo, mensaje, http }
├── outbox/
│   ├── EventoDominioRepositorio.ts  paso 7 · inserta evento
│   └── encolar.ts                   paso 7 · encola EN LA MISMA transacción
├── bitacora/
│   └── BitacoraRepositorio.ts     quién, qué, cuándo, desde dónde, resultado
├── archivos/
│   ├── AlmacenArchivos.ts         PUERTO (interfaz)
│   ├── AlmacenLocalAdapter.ts     Multer a disco + SHA-256
│   └── archivos.module.ts
├── lectura/
│   └── conLectura.ts              transacción de solo lectura contra la réplica
└── registro/
    └── pino.config.ts             redacción de PII, campos cu/usuario_id/traza
```

### Los cinco puntos donde se equivoca todo el mundo

| # | Trampa | Cómo se evita acá | Prueba que lo verifica |
| :-: | --- | --- | --- |
| 1 | Idempotencia validada *después* del `BEGIN` | El interceptor corre **antes** de que el controlador invoque el organismo | `idempotencia.spec.ts`: el segundo request no abre transacción |
| 2 | `SET LOCAL` en otra conexión | `tx.execute` con el contexto transaccional del `EntityManager`, nunca `getConnection().execute()` suelto | Dos requests seguidos sobre la **misma** conexión del pool no comparten contexto |
| 3 | Guard opcional: se olvida en un endpoint | `SesionGuard` **global** con `APP_GUARD`; lo público se marca `@Publico()` explícito | `guard-global.spec.ts`: un controlador nuevo sin decorador exige sesión |
| 4 | Encolar fuera de la transacción | `encolar()` recibe el `tx` y falla en tiempo de tipos si no lo recibe | Transacción revertida ⇒ el trabajo **no** existe en la cola |
| 5 | El error de Postgres llega crudo al cliente | `ExcepcionFilter` traduce y **loguea** el original; el cliente ve `R-XXX-nn` | `traductor.spec.ts` sobre las 124 restricciones del catálogo |

### `FiltroDeErrores` — detalle

```ts
const TRADUCCION: Record<string, { codigo: string; mensaje: string; http: number }> = {
  uq_transaccion_clave_idempotencia: { codigo: 'AP-CU21-00', mensaje: 'Operación ya registrada.', http: 200 },
  ck_movimiento_monto_positivo:      { codigo: 'R-BIL-03',   mensaje: 'El importe debe ser mayor a cero.', http: 409 },
  ex_puntaje_vigente:                { codigo: 'R-REP-02',   mensaje: 'Ya hay un puntaje vigente para ese período.', http: 409 },
}
```

La tabla se **genera** desde `docs/Restricciones.md` con `yarn errores:catalogo`, no
se escribe a mano. **Sin traducción ⇒ `500` y alerta**, nunca un `409` genérico: una
restricción que dispara y no está en el catálogo es un caso que nadie previó y se
registra como **incidente** (`errores-api`).

### Almacenamiento de archivos — Multer detrás de un puerto

```ts
export interface AlmacenArchivos {
  guardar(bytes: Buffer, meta: MetadatoArchivo): Promise<{ ruta: string; sha256: string; bytes: number }>
  leer(ruta: string): Promise<Buffer>
  existe(ruta: string): Promise<boolean>
}
```

Reglas desde el día 1, aunque el adaptador sea local:
- El **hash SHA-256 se guarda en la base**, junto a la ruta. La evidencia es el hash.
- Rutas particionadas por `AAAA/MM/<uuid>`, nunca por nombre del archivo del usuario.
- Tipo MIME y tamaño validados por Zod **antes** de escribir a disco.
- Los archivos **no** se borran: se marca la baja (retención regulatoria).
- El adaptador de *object lock* es una implementación futura del mismo puerto: ningún
  caso de uso conoce a Multer.

**Entregable 2.1:** los doce pasos implementados, cada archivo con su prueba.

---

## 2.2 · `packages/contratos` — el andamio

- Un archivo por CU: `src/CU<NN>.ts` con `Entrada`, `Salida` y `Errores`, en
  `.strict()`. **El contrato se escribe antes que la implementación** (skill
  `contratos-api`).
- **Sin barril `index.ts`**: se importa directo, `@aportaya/contratos/CU21`. Un barril
  que lista 87 contratos lo editan los siete carriles a la vez
  ([[07 Carriles de trabajo concurrente]] §5).
- `MontoSchema` compartido: `z.string().regex(/^-?\d+\.\d{2}$/)` **más**
  `MonedaSchema = z.enum(['BOB','USD'])`. El importe **viaja con su moneda**:
  `{"monto": "150.00", "moneda": "BOB"}`. Nunca `z.number()`.
- `ClaveIdempotenciaSchema`, `PaginacionSchema` (con **lista blanca** de campos de
  orden), `RespuestaSchema<T>`.
- `yarn contratos:openapi` deriva el OpenAPI con `@asteasolutions/zod-to-openapi` y
  lo sirve en `/docs`. **No se versiona**: se genera en CI y se publica como
  artefacto. Con varios carriles agregando contratos, un `openapi.json` versionado
  produce un conflicto por PR y se «resuelve» regenerando — que es justo como se cuela
  una divergencia. Al derivarlo siempre, la divergencia **deja de ser posible** en vez
  de ser detectada. El gate pasa a ser: *genera sin error y valida contra los ejemplos
  del CU* ([[07 Carriles de trabajo concurrente]] §5).
- Versión en la ruta: **`/api/v1/…`**. Los cambios **aditivos** (campo opcional nuevo)
  no rompen y no cambian versión. Un cambio incompatible se hace **en dos pasos**: la
  API acepta ambas formas, los clientes migran, después se retira la vieja. **Nunca en
  un solo despliegue** (`contratos-api`).

**Entregable 2.2:** el paquete con los esquemas base y **CU-01 ya escrito** (aunque
la Fase 3 lo implemente); `/docs` renderiza.

---

## 2.3 · `apps/worker` — outbox y planificador

```
apps/worker/src/
├── main.ts                     arranque, conexión DIRECTA, apagado controlado
├── comun/
│   ├── trabajo.ts              contrato de un handler: idempotente por construcción
│   ├── reintento.ts            retroceso exponencial con jitter y tope
│   └── intento.ts              registra cada intento como evidencia
├── despachador/
│   └── evento-dominio.trabajo.ts   lee evento_dominio → despacha al handler del módulo
└── cron/
    └── registro.ts             trabajos con fecha, con bloqueo por identificador
```

Reglas de ADR-003, hechas mecanismo:

| Regla | Implementación |
| --- | --- |
| Un trabajo = un efecto | El contrato `Trabajo<E>` recibe un evento y produce un efecto. Un handler con dos efectos no compila el patrón |
| Clave de idempotencia derivada del evento, no generada en el worker | `claveDe(evento) = hash(evento.tipo + evento.id)` |
| Entrega al menos una vez ⇒ consumidor idempotente | Todo handler valida su clave antes de producir efecto |
| Cada intento es evidencia | Fila por intento con resultado, latencia y error clasificado |
| Cron sin doble ejecución | `job_key` de Graphile Worker + bloqueo consultivo para los globales (cierre diario, conciliación, remisión) |
| La traza se propaga | El `traza` del request viaja en la carga del trabajo y aparece en el log del worker |

Los **trabajos con fecha** se registran acá pero se implementan en su fase: cierre
diario (F9), conciliación de custodia (F6), remisión UIF (F16), vencimiento de
reclamos (F16), recordatorios (F12), recálculo de reputación (F13).

**Entregable 2.3:** el worker consume `evento_dominio`, reintenta con retroceso y
registra intentos; un cron de prueba demuestra el bloqueo entre réplicas.

---

## 2.4 · El caso de uso de prueba (`CU-00`)

Un caso de uso ficticio, **que no va a producción**, que ejercita los doce pasos:
recibe una clave de idempotencia, abre transacción, fija contexto, escribe una fila en
una tabla de prueba, emite un evento, encola un trabajo, confirma y responde.

Sirve para escribir de una vez las **pruebas del pipeline**, que después ningún CU
tiene que repetir:

- [ ] Entrada con campo desconocido ⇒ `400` (`.strict()`)
- [ ] Sin token ⇒ `401`; con token sin permiso ⇒ `403`
- [ ] Misma clave de idempotencia dos veces ⇒ `200` con la respuesta original y **cero** escrituras nuevas
- [ ] Contexto de otro usuario ⇒ **cero filas**, no error de aplicación
- [ ] Dos requests seguidos sobre la misma conexión del pool ⇒ contextos independientes
- [ ] `rol_auditor` intentando escribir ⇒ falla
- [ ] Excepción a mitad de transacción ⇒ `ROLLBACK` y **el trabajo no existe en la cola**
- [ ] Commit ⇒ el trabajo existe, el worker lo toma y produce **un** efecto aunque se procese dos veces
- [ ] Proveedor caído (adaptador que lanza) ⇒ `202`, trabajo con intentos, reintento con retroceso
- [ ] `SIGTERM` ⇒ termina el request en curso y cierra el pool sin cortar

**Entregable 2.4:** `CU00.spec.ts` y `CU00.http.spec.ts` con esas diez pruebas.
`CU-00` se borra al cerrar la Fase 3, pero **las pruebas se conservan** apuntando a
CU-01.

---

## 2.5 · Módulo 09 parcial — la infraestructura de auditoría

De las 19 tablas del módulo 09, esta fase implementa solo las tres transversales, que
todas las demás fases usan:

| Tabla | Quién escribe | Regla |
| --- | --- | --- |
| `evento_dominio` | Todo organismo, dentro de su transacción | Append-only. Es el outbox |
| `bitacora_evento` | El interceptor, en toda operación que cambia estado | Quién, qué, cuándo, desde dónde, con qué resultado |
| `registro_acceso_datos` | Toda lectura de datos personales | Necesario para CU-07 y CU-58 (Fase 15) |

El resto del módulo 09 (reportes, KPI, incidentes, tickets, listas restrictivas) es
**Fase 15**.

**Entregable 2.5:** las tres tablas escritas correctamente desde el pipeline, con
prueba de que un caso de uso sin evento de dominio es detectable.

---

## Gate de salida de la Fase 2

```bash
yarn lint && yarn typecheck
yarn datos:entidades && git diff --exit-code
yarn contratos:openapi && git diff --exit-code
yarn test:unit && yarn test:integracion && yarn test:api
docker compose up -d --wait && yarn test:e2e
```

- [ ] Los nueve puntos del gate común
- [ ] **Las diez pruebas de 2.4 en verde.** Son el contrato del pipeline
- [ ] Las seis reglas de lint restantes activadas (`consulta-en-transaccion`, `transaccion-solo-en-organismo`, `sin-red-en-transaccion`, y las tres de Fase 1)
- [ ] `/docs` sirve el OpenAPI derivado; se genera sin error y valida contra los ejemplos del CU
- [ ] Un módulo nuevo se descubre por glob **sin editar `app.module.ts`** (probado con un módulo vacío)
- [ ] El worker corre en dos réplicas y el cron de prueba se ejecuta **una** vez
- [ ] Ninguna consulta a tabla con RLS ocurre fuera de `conTransaccion` (lint + revisión)
- [ ] Un log de ejemplo muestra `cu`, `usuario_id`, `traza` y **ningún** dato personal

> **Si esta fase cierra bien, las 15 siguientes son repetición disciplinada de un
> patrón. Si cierra mal, cada módulo va a re-descubrir el mismo error.**

## Ver también

[[00c Recetario · implementar un caso de uso]] · [[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[00 Plan maestro]] · [[01 Fase 0 · Cimientos del repositorio]] · [[03 Fases 3 a 7 · Identidad, habilitación y núcleo de dinero]] · [[Flujo de una transacción]] · [[ADR-007 Sesión, RLS y pooling]] · [[ADR-003 Trabajos, outbox y planificador]]
