---
tags:
  - moc
  - plan
titulo: "Plan maestro de desarrollo del backend — AportaYa"
fecha: 2026-08-13
alcance: apps/api · apps/worker · packages/*
---

# Plan maestro de desarrollo del backend

> **Para quién es este documento.** Para la IA (o la persona) que va a escribir el
> backend. Cada fase dice qué leer antes, qué archivos crear, en qué capa, con qué
> pruebas y qué comando tiene que pasar en verde para poder avanzar. Nada queda
> librado a criterio salvo lo que este plan marca explícitamente como decisión
> abierta.

> [!important] Los otros tres documentos que mandan
> [[00b Estándar de ejecución · código limpio, pruebas y calidad]] dice **cómo se
> escribe** · [[00c Recetario · implementar un caso de uso]] dice **el orden exacto,
> las firmas y los nombres canónicos** · [[07 Carriles de trabajo concurrente]] dice
> **quién hace qué, en qué máquina y qué archivos puede tocar**. Los cuatro se leen
> antes de empezar. **Si un documento de fase los contradice, gana el estándar.**

## Estado de partida (verificado el 2026-08-13)

| Artefacto | Estado |
| --- | --- |
| `docs/` — bóveda | **Completa**: 87 casos de uso, 274 entidades, 566 relaciones, 124 restricciones, 13 ADR |
| `sql/` — esquema | **Generado y aplicable**: `psql -v ON_ERROR_STOP=1 -f sql/aplicar.sql` |
| `seeders/` — catálogos | **Listos**: **20** catálogos mínimos (van a producción) + **14** de prueba |
| `scripts/` — generadores | **Listos**: DDL, bóveda, semillas, verificador |
| `apps/` · `packages/` | **No existen.** Este plan los crea |

El backend arranca de cero, pero **no de la nada**: la especificación ya está escrita
y es ejecutable. El trabajo es traducirla, no inventarla.

---

## 1 · Los diez invariantes

Ninguna fase, ningún módulo y ninguna urgencia los suspende. Si un requerimiento
choca con uno de estos, gana el invariante y se escribe un ADR explicando la
tensión.

| # | Invariante | De dónde sale | Cómo se verifica |
| :-: | --- | --- | --- |
| 1 | **El código no administra el esquema.** `sql/` es dueño; las entidades se *generan* desde la base viva | [[ADR-002 Acceso a datos]] | `yarn datos:entidades && git diff --exit-code` en CI |
| 2 | **Una transacción por caso de uso**, abierta y cerrada en el organismo | [[Flujo de una transacción]] | Lint: ningún `transactional(` fuera de `aplicacion/` |
| 3 | **`SET LOCAL` dentro de la transacción**, nunca fuera y nunca `SET` plano | [[ADR-007 Sesión, RLS y pooling]] | Prueba negativa: contexto ajeno ⇒ **cero filas**, no error |
| 4 | **Ningún importe pasa por `number`.** `numeric` se lee como *string* y vive como `Dinero` | [[ADR-005 Dinero y decimales]] | Regla de lint + prueba de cuadre al centavo |
| 5 | **Append-only: nada se edita.** Corrección = movimiento inverso | `sql/35_append_only/` | `REVOKE` en la base + prueba de rechazo del `UPDATE` |
| 6 | **Ninguna llamada de red dentro de la transacción.** Efectos por outbox | [[ADR-003 Trabajos, outbox y planificador]] | Lint: sin `await <adaptador>.*` dentro de `conTransaccion` |
| 7 | **La clave de idempotencia se valida antes de escribir**, no después | [[_CasosDeUso]] | Prueba: mismo request dos veces ⇒ misma respuesta, cero efectos nuevos |
| 8 | **Los plazos se persisten al crear**, jamás se recalculan al consultar | skill `plazos-habiles` | Prueba: cambiar el calendario no mueve un plazo ya emitido |
| 9 | **Denegar por omisión.** Sin límite, licencia, tarifario o política vigente ⇒ rechazo | `R-LIM-01`, `R-LIC-01` | Prueba: base sin semillas ⇒ toda operación de dinero falla |
| 10 | **Umbrales, límites y tarifas son catálogo, no constantes** | skill `norma-nueva` | Lint: sin literales numéricos monetarios fuera de `seeders/` |

---

## 2 · Stack fijado

La columna **Δ ADR** marca dónde este plan se aparta de una decisión ya aceptada de
la bóveda. Cada desviación se registra como ADR nuevo en la Fase 0 — no se deja el
ADR viejo contradiciendo al código.

| Capa | Elección | Δ ADR | Nota operativa |
| --- | --- | :-: | --- |
| Runtime | **Node 22 LTS** | — | |
| Framework | **NestJS 11**, adaptador **Express** | ⚠ ADR-001 (decía Fastify) | Express porque **Multer** es la elección de almacenamiento; `fastify-multer` agrega una dependencia de tercero sin ganancia real a este volumen |
| Gestor de paquetes | **yarn** (workspaces) | ⚠ ADR-002/Stack (decía pnpm) | ADR-016 |
| Acceso a datos | **MikroORM 6** + `@mikro-orm/postgresql`, entidades **generadas** por `EntityGenerator` | ⚠ **ADR-002** (decía Kysely, "ningún ORM") | ADR-014 · §4 de este documento fija las seis reglas que lo hacen compatible |
| Driver | `pg`, `numeric` (OID 1700) e `int8` (OID 20) leídos como *string* | — | |
| Dinero | `decimal.js` dentro de `Dinero`; `DineroType` de MikroORM | — | Invariante 4 |
| Contratos | **Zod** en `packages/contratos`, OpenAPI derivado | — | ADR-006 |
| Validación HTTP | `ZodValidationPipe` global, `.strict()` | — | Campo desconocido = error |
| Logs | **Pino** (`nestjs-pino`), estructurados, con `cu`, `usuario_id`, `traza` | — | Redacción de PII obligatoria |
| Trabajos y outbox | **Graphile Worker** en la misma PostgreSQL | — | ADR-003 · conexión **directa**, sin PgBouncer |
| Archivos | **Multer** a disco local detrás del puerto `AlmacenArchivos` | ⚠ Stack decía object storage con *object lock* | ADR-017 · el puerto existe desde el día 1 para que el cambio a S3 sea un adaptador |
| Pruebas unitarias | **Jest** | ⚠ ADR-008 (decía Vitest) | ADR-015 |
| Pruebas de integración | **Jest + Testcontainers** con PostgreSQL 16 real | parcial | El "Postgres real" de ADR-008 se conserva; cambia el corredor |
| Pruebas de API | **Jest + Supertest** contra la app Nest completa | — | |
| Pruebas E2E | **Jest + Playwright + Chromium** contra el stack en Docker | — | §7 |
| Lint | **ESLint 9** (flat config) + `@typescript-eslint` + reglas propias del proyecto | — | §6 |
| Base de datos | **PostgreSQL 16** + `btree_gist`, RLS, `EXCLUDE` | — | |
| Pooling | **PgBouncer** modo *transaction* (solo la API) | — | ADR-007 |
| Empaquetado | **Docker** multietapa, sin root; `docker compose` para local y pruebas | — | ADR-012 |

### Lo que sigue prohibido, aunque haya ORM

- `MikroORM.getSchemaGenerator()` y todo el paquete `@mikro-orm/migrations`.
- `em.nativeUpdate` / `em.nativeDelete` sobre cualquier tabla de `sql/35_append_only/`.
- `em.flush()` implícito dependiendo de *dirty checking* para escribir dinero.
- Punto flotante para importes, en cualquier capa.
- Colas fuera de PostgreSQL para el outbox.
- Migraciones escritas a mano fuera de `sql/`.

---

## 3 · Las cuatro capas, y qué puede hacer cada una

Es [[ADR-009 Composición atómica]] convertido en carpetas. **La dirección de
dependencia no se invierte nunca.**

```
http/            PÁGINA      traduce HTTP ⇄ caso de uso
  ↓
aplicacion/      ORGANISMO   un caso de uso = un archivo = una transacción
  ↓         ↘
dominio/     infraestructura/
ÁTOMO        MOLÉCULA        repositorios (SQL) y adaptadores (proveedores)
                 ↓
              dominio/
```

| Capa | Puede depender de | Nunca hace | Prueba que le corresponde |
| --- | --- | --- | --- |
| `dominio/` — **átomo** | Nada del sistema | IO, SQL, red, `Date.now()` o azar sin inyectar | Unitaria pura, sin base. `<Atomo>.spec.ts` |
| `infraestructura/` — **molécula** | `dominio/`, `packages/datos` | Abrir transacción, orquestar otro caso, contener un `if` de negocio | Integración contra Postgres real. `<Repo>.spec.ts` |
| `aplicacion/` — **organismo** | `dominio/`, `infraestructura/` | SQL directo, llamar a un proveedor externo | Criterios de aceptación del CU. `CU<NN>.spec.ts` |
| `http/` — **página** | `aplicacion/`, `packages/contratos` | Cualquier regla de negocio o cálculo | Supertest. `CU<NN>.http.spec.ts` |

### Anatomía obligatoria de un módulo

```
apps/api/src/modulos/<NN>_<nombre>/
├── <nombre>.module.ts
├── dominio/                    ← átomos: objetos de valor, cálculos, políticas puras
├── infraestructura/            ← moléculas: <Sustantivo>Repositorio.ts, <Proveedor>Adapter.ts
├── aplicacion/                 ← organismos: CU<NN><VerboObjeto>.ts
├── http/                       ← páginas: <nombre>.controller.ts
├── trabajos/                   ← handlers de Graphile Worker de este módulo
└── pruebas/                    ← CU<NN>.spec.ts, CU<NN>.http.spec.ts, <Atomo>.spec.ts
```

### Convención de nombres (de [[Estructura del repositorio]])

| Cosa | Forma | Ejemplo |
| --- | --- | --- |
| Caso de uso | `CU<NN><VerboObjeto>.ts` | `CU21CobrarAporte.ts` |
| Prueba del caso de uso | `CU<NN>.spec.ts` | `CU21.spec.ts` |
| Prueba de API | `CU<NN>.http.spec.ts` | `CU21.http.spec.ts` |
| Contrato | `packages/contratos/src/CU<NN>.ts` | `CU21.ts` |
| Repositorio | `<Sustantivo>Repositorio.ts` | `ObligacionRepositorio.ts` |
| Adaptador externo | `<Proveedor>Adapter.ts` | `PasarelaQrAdapter.ts` |
| Trabajo del worker | `<evento>.trabajo.ts` | `aporte-confirmado.trabajo.ts` |
| Tabla | `snake_case` tal cual el modelo | `obligacion_aporte` |
| Código de error | `AP-CU<NN>-<nn>` | `AP-CU21-03` |

---

## 4 · MikroORM sin romper la bóveda — las seis reglas

Esta sección existe porque el invariante 1 y el 5 son exactamente lo que un ORM
tiende a violar. **Se implementa completa en la Fase 1 y se verifica en CI desde
entonces.**

### R1 · Las entidades se generan, no se escriben

```bash
yarn workspace @aportaya/datos entidades   # mikro-orm generate-entities --save --path src/entidades
```

- Salida a `packages/datos/src/entidades/` con cabecera `// GENERADO — no editar`.
- El CI regenera y exige `git diff --exit-code`: si el modelo cambió y las entidades
  no, **el build falla**. Es el equivalente de `kysely-codegen` de ADR-002.
- Orden obligatorio del pipeline: `sql/aplicar.sql` → semillas mínimas → generar
  entidades → compilar.

### R2 · El generador de esquema está desconectado

- **No** se instala `@mikro-orm/migrations` ni `@mikro-orm/seeder`.
- `mikro-orm.config.ts` no expone `schemaGenerator`; el único subcomando permitido
  del CLI es `generate-entities`.
- Regla de lint propia: `aportaya/sin-schema-generator` prohíbe `getSchemaGenerator`,
  `refreshDatabase`, `createSchema`, `updateSchema`, `dropSchema`.

### R3 · Append-only sin *dirty checking*

- Toda entidad cuya tabla esté sellada en `sql/35_append_only/append_only.sql` se
  genera y luego se marca `@Entity({ readonly: true })` mediante un post-proceso del
  generador que lee la misma lista.
- Escritura de esas tablas: `em.insert(Entidad, datos)` o `em.execute('insert into …')`.
  Nunca `em.persist` + `flush` sobre una instancia leída.
- Regla de lint: `nativeUpdate`/`nativeDelete` con una entidad de la lista sellada
  es error. La base lo rechaza igual por `REVOKE`; el lint solo adelanta el fallo.

### R4 · Contexto de RLS en la misma conexión

```ts
// apps/api/src/comun/transaccion.ts
export async function conTransaccion<T>(
  em: EntityManager,
  ctx: ContextoSesion,
  fn: (tx: EntityManager) => Promise<T>,
): Promise<T> {
  if (!ctx.usuarioId || !ctx.rol) throw new SinContextoDeSesion()   // invariante 3
  const fork = em.fork({ clear: true })
  return fork.transactional(async (tx) => {
    await tx.execute("select set_config('app.usuario_id', ?, true)", [ctx.usuarioId])
    await tx.execute("select set_config('app.rol',       ?, true)", [ctx.rol])
    await tx.execute("select set_config('app.traza',     ?, true)", [ctx.traza])
    return fn(tx)
  })
}
```

- `set_config(…, true)` es `SET LOCAL`: muere en el `COMMIT`. **Nunca** `SET` plano.
- `tx.execute` usa el contexto transaccional del `EntityManager`; usar
  `getConnection().execute()` sin pasar el contexto abre otra conexión y el contexto
  se pierde en silencio — es el error más caro de esta sección.
- `em.fork({ clear: true })` por request: sin *identity map* compartido entre
  usuarios.
- **Ninguna** consulta a tabla con RLS fuera de `conTransaccion`. Regla de lint.

### R5 · Dinero como `numeric`/*string*

```ts
// packages/datos/src/tipos/DineroType.ts
export class DineroType extends Type<Dinero | null, string | null> {
  convertToDatabaseValue(v: Dinero | null) { return v?.aCadena() ?? null }   // '1234.50'
  convertToJSValue(v: string | null)       { return v == null ? null : Dinero.desde(v) }
  getColumnType() { return 'numeric(14,2)' }
}
```

Y en el arranque del proceso, antes de crear el `EntityManager`:

```ts
pg.types.setTypeParser(1700, (v) => v)   // numeric  → string
pg.types.setTypeParser(20,   (v) => v)   // int8     → string
```

El post-proceso del generador reemplaza cada columna `numeric(14,2)` por
`type: DineroType`. Una columna monetaria tipada como `number` es un fallo de CI.

### R6 · PgBouncer en modo transacción

- La API se conecta por PgBouncer; **sin sentencias preparadas con nombre** y sin
  `LISTEN/NOTIFY`.
- El worker (Graphile Worker) se conecta **directo** a PostgreSQL: necesita
  `LISTEN/NOTIFY`.
- Roles distintos por proceso, los que ya define `sql/00_base/01_roles.sql`:
  `rol_aplicacion` (API), `rol_backoffice`, `rol_cumplimiento`, `rol_auditor`
  (solo lectura, réplica), `rol_migracion` (solo el job de despliegue).

---

## 5 · Errores, respuestas y observabilidad

### Forma única de la respuesta

```jsonc
// éxito
{ "datos": { … }, "trazaId": "01J8X…" }
// error  ← la forma exacta de la skill `errores-api`
{ "codigo": "AP-CU21-03",
  "mensaje": "No tenés saldo suficiente para este aporte.",
  "detalle": { "faltante": "45.00", "moneda": "BOB" },
  "trazaId": "01J8X…" }
```

| Campo | Para quién | Regla |
| --- | --- | --- |
| `codigo` | Soporte y auditoría | `AP-CU<NN>-<nn>`, definido en `packages/contratos/src/CU<NN>.ts` |
| `mensaje` | Usuario | Español, sin jerga, **dice qué hacer** cuando hay algo que hacer |
| `detalle` | App | Datos para armar un mensaje mejor; opcional |
| `trazaId` | Soporte | Correlaciona con `bitacora_evento`. Es lo único que el usuario le dicta al soporte |

### Mapeo obligatorio a HTTP

| Situación | HTTP | Cuerpo | Qué queda registrado |
| --- | :-: | --- | --- |
| Entrada inválida por esquema Zod | `400` | Lista de campos con mensaje | Nada escrito |
| **Regla de negocio de la aplicación** | **`422`** | `{ codigo: 'AP-CU21-02', … }` | Intento en bitácora |
| Sin autenticar | `401` | `AP-SEG-01` | `intento_autenticacion` |
| Sin permiso / fuera de RLS | `403` **o resultado vacío** | Sin detalles internos | `bitacora_evento` |
| Restricción de la base rechaza | `409` | `{ codigo: 'R-XXX-nn', … }` traducido | El rechazo con la restricción que actuó |
| Clave de idempotencia repetida | `200` | **La respuesta original, íntegra** | Nada nuevo |
| Proveedor externo indisponible | `202` | Aceptado; se completa por la cola | El trabajo con sus intentos |
| Falla no prevista | `500` | **Solo `trazaId`. Nada más** | Log `error` con la traza |

> **`422`, no `400`, para las reglas de negocio.** El `400` es del esquema; el `422`
> es de la regla. Confundirlos deja al cliente sin poder distinguir «mandaste mal el
> formulario» de «no tenés saldo».

**Nunca** sale un mensaje crudo de PostgreSQL. `FiltroDeErrores` (Fase 2) mapea
`constraint_name` → `R-XXX-nn` → mensaje, desde un catálogo generado con
`yarn errores:catalogo`. **Una restricción que dispara y no está en el catálogo ⇒
`500` y alerta**: es un caso que nadie previó, se registra como incidente y no se
improvisa un mensaje genérico.

**Los códigos no se reutilizan.** Un código retirado queda retirado; reusarlo mezcla
incidentes viejos con nuevos en el soporte. Y un código sin prueba que lo dispare es
decorativo.

### Logs (Pino)

Toda línea lleva `{ cu, usuario_id, traza, modulo }`. Redacción obligatoria de:
`req.headers.authorization`, `req.headers.cookie`, `*.password`, `*.pin`,
`*.numero_documento`, `*.numero_cuenta`, `*.telefono`, `*.correo`, `*.token`,
`*.clave_*`. La traza se propaga **hasta el worker** por la carga del trabajo.

---

## 6 · Puertas de calidad

### Reglas de lint propias del proyecto (`packages/eslint-config-aportaya`)

| Regla | Qué prohíbe | Invariante |
| --- | --- | :-: |
| `aportaya/sin-number-monetario` | Tipo `number` en `monto`, `importe`, `saldo`, `comision`, `impuesto`, `total`, `deuda`, `aporte`, `cuota`, `recargo`, `mora` (**la lista exacta de `dinero-decimal`**) | 4 |
| `aportaya/sin-schema-generator` | `getSchemaGenerator`, `createSchema`, `updateSchema`, `dropSchema` | 1 |
| `aportaya/consulta-en-transaccion` | Uso de `em.*` fuera de un `conTransaccion` | 3 |
| `aportaya/transaccion-solo-en-organismo` | `transactional(` fuera de `aplicacion/` | 2 |
| `aportaya/sin-red-en-transaccion` | `await` sobre un `*Adapter` dentro de `conTransaccion` | 6 |
| `aportaya/sin-update-append-only` | `nativeUpdate`/`nativeDelete` sobre entidad sellada | 5 |
| `aportaya/sin-umbral-literal` | Literal numérico monetario fuera de `seeders/` y pruebas | 10 |
| `aportaya/capas` (`import/no-restricted-paths`) | `dominio/` importando de `infraestructura/`; `http/` importando de `infraestructura/` | — |
| `aportaya/tamano-archivo` | ≥ 220 líneas advierte · ≥ 260 exige revisión de diseño · ≥ 300 **bloquea** | skill `ci-calidad` |
| `aportaya/sin-console-log` | `console.*` en código de runtime (para eso está Pino) | — |
| `aportaya/sin-parsefloat-dinero` | `parseFloat` / `Number()` sobre importes | 4 |

### Orden del pipeline de CI (bloqueante en cada paso)

Es el pipeline de la skill `ci-calidad` **completo**, con los comandos de este stack.
Los pasos 5, 6, 12 y 13 son los que impiden que la bóveda, la base y el código se
desincronicen: si alguno produce diff, alguien editó un derivado a mano.

```
 1  yarn install --immutable
 2  yarn format:check                    Prettier
 3  yarn lint                            ESLint 9 + las 11 reglas propias
 4  yarn typecheck                       tsc estricto, sin warnOnly
 5  python3 scripts/generar_ddl.py       → diff vacío
 6  python3 scripts/verificar_boveda.py  → TODO OK (sale 1 si falla)
 7  base efímera: sql/aplicar.sql sobre base vacía + prueba de humo
 8  semillas mínimas DOS veces           → mismo estado, sin duplicados
 9  semillas de prueba DOS veces         → solo en entorno no productivo
10  rechazo: las semillas de prueba FALLAN si el entorno es producción
11  permisos: rol_auditor no escribe · rol_aplicacion no toca append-only
12  yarn datos:entidades && git diff --exit-code      ← invariante 1
13  yarn contratos:openapi               genera sin error + valida ejemplos del CU
14  yarn test:unit                       Jest, sin contenedor
15  yarn test:integracion                Jest + Testcontainers (Postgres real)
16  yarn test:api                        Jest + Supertest
17  yarn build && docker build           multietapa, sin root
18  yarn test:e2e                        Playwright + Chromium sobre compose
19  seguridad: dependencias, secretos, imagen
```

### Cobertura como piso, no como meta

El piso global es el de `ci-calidad`; los módulos de dinero y cumplimiento exigen más
porque ahí un hueco de cobertura cuesta plata o incumplimiento.

| Ámbito | Piso |
| --- | :-: |
| Global | 80 % líneas · 75 % funciones · 70 % ramas |
| `dominio/` de módulos de dinero y cumplimiento (03, 04, 08, 10, 11, 12) | 95 % líneas y ramas |
| `aplicacion/` de esos mismos módulos | 90 % líneas |
| Criterios de aceptación de cada CU | **100 %** — cada `gherkin` de la bóveda tiene su `it()` nombrado igual |
| Restricciones citadas en el CU | **100 %** — cada `R-XXX-nn` tiene una prueba de **rechazo** |

No se excluye código difícil para subir el número. La pregunta real de ADR-008 sigue
siendo: **¿qué del dinero no está probado?**

---

## 7 · Estrategia de pruebas — cinco niveles

| Nivel | Herramienta | Contra qué corre | Nombre del archivo | Cuánto tarda |
| --- | --- | --- | --- | --- |
| **Unitaria** | Jest | Nada. Funciones puras | `<Atomo>.spec.ts` | ms |
| **Integración** | Jest + `@testcontainers/postgresql` | PostgreSQL 16 real con `sql/aplicar.sql` + semillas mínimas | `<Repo>.spec.ts`, `CU<NN>.spec.ts` | s |
| **API** | Jest + Supertest | App Nest completa sobre la base de Testcontainers | `CU<NN>.http.spec.ts` | s |
| **Contrato** | Jest + Zod | El OpenAPI derivado contra los ejemplos del CU | `CU<NN>.contrato.spec.ts` | ms |
| **E2E** | Jest + Playwright + Chromium | Stack en `docker compose`: nginx → api → pgbouncer → postgres + worker | `<flujo>.e2e.spec.ts` | min |

**Qué cubre cada E2E** (Playwright): el flujo de dinero de punta a punta con el
worker corriendo de verdad — recarga → aporte → entrega → conciliación → cierre
diario. `request` (APIRequestContext) para lo que es API pura; Chromium para
`/docs` y, cuando exista `apps/backoffice`, para las pantallas de cumplimiento.

### Las cinco pruebas que todo CU con dinero debe tener

1. **Camino feliz** con el criterio de aceptación de la bóveda, nombrado igual.
2. **Rechazo de restricción**: una por cada `R-XXX-nn` que el CU cita.
3. **Reintento**: misma clave de idempotencia dos veces ⇒ misma respuesta, un efecto.
4. **Concurrencia**: dos transacciones simultáneas sobre el mismo agregado ⇒ una gana,
   la otra espera o falla limpio; nunca doble efecto.
5. **Cuadre**: la suma de débitos iguala la de créditos, al centavo, con `Decimal`.

Más, cuando aplique: **RLS negativa** (contexto ajeno ⇒ cero filas), **proveedor
caído** (`202` + trabajo con intentos), **plazo** (cambiar el calendario no mueve un
plazo ya emitido).

---

## 8 · Las 18 fases

El orden no es preferencia: cada fase **habilita** la siguiente. La columna
"Bloquea a" dice qué se cae si esta fase queda a medias.

| Fase | Nombre | Módulos de bóveda | CU | Bloquea a | Documento |
| :-: | --- | --- | --- | --- | --- |
| **0** | Cimientos del repositorio | — | — | todas | [[01 Fase 0 · Cimientos del repositorio]] |
| **1** | Capa de datos y dominio compartido | — | — | 2–17 | [[02 Fases 1 y 2 · Capa de datos y núcleo transversal]] |
| **2** | Núcleo transversal de la API y el worker | 09 (parcial) | — | 3–17 | [[02 Fases 1 y 2 · Capa de datos y núcleo transversal]] |
| **3** | Identidad, sesión y control de acceso | 01 | 01, 04, 05, 08, 09 | 4–17 | [[03 Fases 3 a 7 · Identidad, habilitación y núcleo de dinero]] |
| **4** | Habilitación: licencia, diligencia y límites | 12 (parcial), 09 (parcial) | 02, 03, 06, 40, 46 | 5–17 | ídem |
| **5** | Contabilidad de partida doble | 03 (contable) | 24 | 6–17 | ídem |
| **6** | Billetera, custodia y efectivo | 10 | 10–17, 50, 57 | 7–17 | ídem |
| **7** | Tarifas, comisiones, impuestos y facturación | 11 | 30–36 | 8–11 | ídem |
| **8** | Grupos, cupos, turnos y gobernanza | 02 | 20, 59, 60, 62–65, 68, 69 | 9–11 | [[04 Fases 8 a 11 · Circuito del pasanaku]] |
| **9** | Aportes, pagos QR, conciliación y cierre | 03 | 19, 21, 51, 99 | 10, 11 | ídem |
| **10** | Entregas de fondo y desembolsos | 04 | 18, 22, 28 | 11 | ídem |
| **11** | Garantía, incumplimiento, cobranza y sanciones | 08 | 23, 25–27, 29, 66, 67 | — | ídem |
| **12** | Notificaciones y comunicaciones | 05 | 80–83 | — | [[05 Fases 12 a 16 · Plataforma, reputación y cumplimiento]] |
| **13** | Transparencia y reputación | 06 | 61, 70–76, 97 | — | ídem |
| **14** | Organizador y automatización | 07 | 90–93, 95, 96 | — | ídem |
| **15** | Auditoría, reportes, datos personales e indicadores | 09 | 07, 54, 55, 58, 98 | — | ídem |
| **16** | Cumplimiento UIF/ASFI, reclamos y continuidad | 12 | 41–45, 47–49, 52, 53, 56, 94 | — | ídem |
| **17** | Endurecimiento, rendimiento, E2E y despliegue | — | — | — | [[06 Fase 17 · Endurecimiento, E2E y despliegue]] |

**Los 87 casos de uso están asignados. Ninguno queda huérfano.**

> **Para ejecutar esto en paralelo**, las 18 fases se agrupan en **seis olas de
> carriles** en [[07 Carriles de trabajo concurrente]]: hasta cinco máquinas a la vez,
> con propiedad exclusiva de archivos para que no haya conflicto de merge.

### Camino crítico

```
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 9
                              ↘ 8 ↗
```

Las fases **12 a 16** son paralelizables entre sí una vez cerrada la 11. La **17**
cierra todo.

### Hito de validación temprana

[[Stack]] fija la prueba de la elección: **implementar CU-31 de punta a punta** —
toca dinero, tarifario congelado, partida doble, outbox e impuestos. En este plan ese
hito cae al **cerrar la Fase 7**. Si el stack no sostiene CU-31 con sus criterios de
aceptación como pruebas, incluida la de rechazo de cada restricción citada, se
detiene el avance y se revisa ADR-014 antes de seguir.

---

## 9 · Gate de fase — el mismo para las 18

Ninguna fase se declara terminada sin las once casillas. **No se marca una casilla
sin haber ejecutado el comando**; "debería pasar" no es evidencia (skill
`definicion-de-terminado`, y §15 del estándar de ejecución: está prohibido afirmar
"listo", "compila", "pasa las pruebas" o "es seguro" sin haberlo corrido).

- [ ] `yarn lint` en verde, sin `eslint-disable` nuevos sin comentario que cite el porqué
- [ ] `yarn typecheck` en verde
- [ ] `yarn datos:entidades && git diff --exit-code` vacío
- [ ] `yarn contratos:openapi` genera sin error y valida contra los ejemplos del CU
- [ ] `yarn test:unit` · `test:integracion` · `test:api` en verde
- [ ] Cada criterio de aceptación de cada CU de la fase tiene un `it()` con su nombre
- [ ] Cada `R-XXX-nn` citado por esos CU tiene una prueba de **rechazo**
- [ ] Las piezas están declaradas por nivel y ninguna salta capas (lo verifica `aportaya/capas`)
- [ ] `docs/` actualizado si la fase cambió el modelo, y `python3 scripts/verificar_boveda.py` en verde
- [ ] **El checklist de PR de §12 del estándar de ejecución, ejecutado en cada PR de la fase**
- [ ] **Los supuestos declarados** durante la fase, escritos en `planes/informe.md` (regla cero: ninguno silencioso)

Además, por fase: **informe de progreso** en `planes/informe.md` con avance, riesgos
abiertos, decisiones tomadas y desviaciones respecto de este plan (skill
`plan-por-fases`).

---

## 10 · Variables de entorno

Validadas con Zod **al arrancar**: si falta una, el proceso no levanta. Sin valores
por defecto silenciosos para credenciales, umbrales ni direcciones de proveedores.

| Variable | Proceso | Ejemplo | Nota |
| --- | --- | --- | --- |
| `NODE_ENV` | api, worker | `production` | |
| `PUERTO` | api | `3000` | |
| `BD_URL` | api | `postgres://rol_aplicacion@pgbouncer:6432/aportaya` | **por PgBouncer** |
| `BD_URL_DIRECTA` | worker | `postgres://rol_aplicacion@postgres:5432/aportaya` | **sin** PgBouncer |
| `BD_URL_LECTURA` | api | `postgres://rol_auditor@replica:5432/aportaya` | solo lectura (ADR-011) |
| `BD_POOL_MAX` | api, worker | `10` | |
| `JWT_SECRETO` / `JWT_EMISOR` / `JWT_TTL` | api | — | ADR-010 |
| `REFRESH_TTL_DIAS` | api | `30` | |
| `ARGON2_MEMORIA` / `ARGON2_ITERACIONES` / `ARGON2_PARALELISMO` | api | — | |
| `ARCHIVOS_RUTA` | api, worker | `/var/lib/aportaya/archivos` | Multer, volumen persistente |
| `ARCHIVOS_TAMANO_MAX_MB` | api | `10` | |
| `LOG_NIVEL` | api, worker | `info` | |
| `WORKER_CONCURRENCIA` | worker | `5` | |
| `ZONA_HORARIA` | api, worker | `America/La_Paz` | plazos hábiles |
| `PASARELA_QR_URL` / `_CLAVE` | worker | — | sin valor por defecto |
| `SIAT_URL` / `_TOKEN` / `_NIT` | worker | — | facturación |
| `MENSAJERIA_URL` / `_TOKEN` | worker | — | WhatsApp Cloud API |

---

## 10b · Las cinco restricciones nuevas (cerradas el 2026-08-13)

`docs/Restricciones.md` ganó cinco restricciones y **los casos de uso ya las citan**:
`python3 scripts/verificar_boveda.py` da **TODO OK**. Quedan acá anotadas porque
cambian el gate de tres fases:

| Restricción | Qué exige | La cita | Fase |
| --- | --- | --- | :-: |
| `R-SEG-09` | El refresco **se rota**; reusarlo revoca la familia y sus sesiones | CU-04 | 3 |
| `R-AUD-09` | Los hashes de la bitácora **los calcula la base**, no la aplicación | CU-04, CU-73 | 3 y 13 |
| `R-AUD-10` | Las cadenas se verifican en el **control diario**, no solo al auditar | CU-10, CU-73 | 6 y 13 |
| `R-BIL-19` | El reintento **devuelve la primera respuesta**, no un error | CU-10 | 6 |
| `R-BIL-20` | La partida doble cuadra **también en moneda** | CU-10 | 6 |

Total vigente: **124 restricciones definidas**, todas citadas por al menos un caso.

---

## 11 · Riesgos del plan y su mitigación

| # | Riesgo | Impacto | Mitigación | Se detecta en |
| :-: | --- | --- | --- | --- |
| 1 | MikroORM termina siendo dueño del esquema por la puerta de atrás | Divergencia bóveda↔base, el repo pierde valor | §4 R1+R2 · gate de CI `git diff --exit-code` | Fase 1, y en cada CI |
| 2 | El *identity map* escribe una tabla append-only por *dirty checking* | `REVOKE` rechaza en producción, o peor: pasa por una tabla no sellada | §4 R3 · `readonly: true` + lint + prueba de rechazo | Fase 1 |
| 3 | `SET LOCAL` en otra conexión que la transacción | **Fuga de datos entre usuarios**. El riesgo más grave del proyecto | §4 R4 · `tx.execute` · prueba de dos requests sobre la misma conexión del pool | Fase 2 |
| 4 | Un importe pasa por `number` y se redondea mal | Descuadre contable, incumplimiento | Invariante 4 · lint · `DineroType` · prueba de cuadre | Fase 1 |
| 5 | 274 tablas generan entidades enormes y `tsc` se vuelve lento | Ciclo de desarrollo doloroso | Entidades en un workspace propio compilado con `incremental` + `composite` | Fase 1 |
| 6 | Los seeders `⚠ PROVISIONAL` (límites, impuestos, umbrales UIF) se toman por definitivos | Incumplimiento regulatorio real | El campo `estado` se propaga: el arranque **advierte** por cada catálogo provisional | Fase 4 |
| 7 | La licencia sembrada `EN_TRAMITE` hace fallar todo flujo de dinero en local | Se "arregla" desactivando la validación | Semilla de **prueba** habilita la licencia; producción no. Prueba explícita de que `EN_TRAMITE` rechaza | Fase 4 |
| 8 | Multer a disco local: se pierde la evidencia al recrear el contenedor | Pérdida de evidencia regulatoria | Volumen persistente + hash SHA-256 en base + puerto `AlmacenArchivos` para migrar a *object lock* | Fase 2 |
| 9 | El cierre diario corre dos veces con dos réplicas del worker | Asientos duplicados | Bloqueo por identificador de Graphile Worker + prueba con dos réplicas | Fase 9 |
| 10 | Los módulos 08 y 12 (33 y 47 tablas) desbordan su fase | Fases 11 y 16 se estiran sin control | Ambas se subdividen en sub-fases con gate propio (ver sus documentos) | Fases 11 y 16 |

---

## 12 · Cómo se usa este plan

0. **Se leen [[00b Estándar de ejecución · código limpio, pruebas y calidad]] y
   [[00c Recetario · implementar un caso de uso]] una vez, completos, antes de la Fase 0** — y se vuelve a él en cada PR. Es el cómo; este
   documento es el qué.
1. Se ejecuta **una fase a la vez**, en orden.
2. Antes de escribir la primera línea de una fase se leen **los archivos de la bóveda
   que la fase lista**. No se implementa de memoria ni de este resumen: este plan dice
   *qué* y *dónde*; el *cómo exacto* está en el caso de uso. **Regla cero: no se
   inventa nada** — si falta algo crítico se para y se pregunta; si no es crítico, se
   declara el supuesto por escrito.
3. Por cada caso de uso, **antes** de implementar, se declaran las piezas por nivel y
   se responden por escrito las cinco preguntas de frontera transaccional de
   [[Prompt de backend]]: qué va todo-junto-o-nada · qué queda fuera del commit ·
   cuál es la clave de idempotencia y de dónde viene · qué se bloquea y a qué
   granularidad · qué pasa si el proceso muere justo después del commit.
4. Cada PR pasa el checklist de §12 del estándar y la revisión por riesgo de §13.
5. Se cierra la fase con el gate de §9 **ejecutado**, y se actualiza
   `planes/informe.md` con avance, riesgos, decisiones, supuestos y desviaciones.

## Ver también

[[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[00c Recetario · implementar un caso de uso]] · [[07 Carriles de trabajo concurrente]] · [[Index]] · [[_Arquitectura]] · [[_CasosDeUso]] · [[Restricciones]] · [[Cumplimiento]] · [[Stack]] · [[Estructura del repositorio]] · [[Flujo de una transacción]] · [[Prompt general de desarrollo]] · [[Prompt de backend]]
