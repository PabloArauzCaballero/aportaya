---
tags:
  - plan
  - fase
titulo: "Fase 0 — Cimientos del repositorio"
fase: 0
depende_de: []
habilita: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
---

# Fase 0 — Cimientos del repositorio

> **Objetivo.** Que `git clone && yarn install && yarn bd:levantar && yarn dev`
> deje corriendo una API que responde `/salud`, contra una PostgreSQL 16 con las 274
> tablas aplicadas y los 20 catálogos mínimos sembrados. Sin un solo caso de uso
> todavía: esta fase construye el piso sobre el que se paran las otras 17.

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

**Nada de lógica de negocio en esta fase.** Si aparece un `if` sobre una regla del
pasanaku, está mal ubicado.

## Gate de entrada

- [ ] `psql -v ON_ERROR_STOP=1 -f sql/aplicar.sql` corre sin error sobre una base vacía
- [ ] `python3 scripts/verificar_boveda.py` en verde
- [ ] Node 22 LTS, yarn 4 (Berry) y Docker disponibles en la máquina

## Leer antes de empezar

| Archivo | Qué se saca de ahí |
| --- | --- |
| `docs/Arquitectura/Estructura del repositorio.md` | El árbol de carpetas, tal cual |
| `docs/Arquitectura/ADR-012 Empaquetado y despliegue.md` | Dockerfile, NGINX, redes |
| `docs/Arquitectura/Entornos y despliegue.md` | Entornos y aplicación de `sql/` |
| `docs/Stack.md` | Las siete exigencias que el stack tiene que sostener |
| `seeders/README.md` | Por qué los mínimos también van a producción |

---

## 0.1 · Monorepo con yarn workspaces

### Árbol a crear

```
Pasanaku/
├── package.json                 privado, workspaces, scripts raíz
├── .yarnrc.yml                  nodeLinker: node-modules
├── tsconfig.base.json           strict, composite, paths de @aportaya/*
├── eslint.config.js             flat config raíz
├── jest.config.ts               proyectos: unit | integracion | api
├── .editorconfig · .gitignore · .dockerignore · .nvmrc
├── .env.example                 versionado y COMPLETO; .env jamás se commitea
├── apps/
│   ├── api/                     NestJS
│   └── worker/                  Graphile Worker
├── packages/
│   ├── contratos/               Zod por CU + OpenAPI derivado
│   ├── dominio/                 Dinero, Periodo, PlazoHabil, cálculos puros
│   ├── datos/                   entidades generadas + config de MikroORM
│   └── eslint-config-aportaya/  las nueve reglas propias
├── docker/
│   ├── Dockerfile.api · Dockerfile.worker
│   ├── postgres/init.sql        extensiones antes de aplicar.sql
│   ├── pgbouncer/pgbouncer.ini  modo transaction
│   └── nginx/nginx.conf         única entrada pública
├── docker-compose.yml           local
├── docker-compose.test.yml      e2e
├── planes/                      este plan
│   └── informes/                un informe por carril, sin conflicto entre máquinas
├── sql/ · seeders/ · scripts/ · docs/     (ya existen — no se tocan)
└── .github/workflows/ci.yml
```

### `package.json` raíz — scripts obligatorios

| Script | Qué hace |
| --- | --- |
| `yarn dev` | api + worker en watch, contra el compose local |
| `yarn build` | `tsc -b` de todos los workspaces |
| `yarn lint` / `yarn lint:fix` | ESLint 9 sobre todo el repo |
| `yarn typecheck` | `tsc -b --noEmit` |
| `yarn bd:levantar` | `docker compose up -d postgres pgbouncer` |
| `yarn bd:aplicar` | `psql -v ON_ERROR_STOP=1 -f sql/aplicar.sql` |
| `yarn bd:semillas` | `python3 scripts/generar_semillas.py && psql -f sql/60_semillas/sembrar.sql` (**20 catálogos**) |
| `yarn bd:prueba` | `psql -f sql/61_prueba/sembrar_prueba.sql` (**14 archivos, nunca** en producción) |
| `yarn bd:reset` | volumen limpio → aplicar → semillas → prueba |
| `yarn datos:entidades` | genera `packages/datos/src/entidades/` desde la base viva |
| `yarn contratos:openapi` | deriva `packages/contratos/openapi.json` desde los Zod |
| `yarn test:unit` · `test:integracion` · `test:api` · `test:e2e` | los cuatro corredores. `test:unit` es el `test:atomos` de `entorno-monorepo` |
| `yarn errores:catalogo` | genera el catálogo `constraint_name → R-XXX-nn` desde `docs/Restricciones.md` |
| `yarn verificar` | lint + typecheck + los cuatro tests + diffs de generados |

> **Regla:** todo lo que el CI ejecuta tiene que poder ejecutarse igual en local con
> un solo `yarn <script>`. Un paso de CI que no existe como script es un paso que
> nadie puede reproducir.

> [!warning] Todas las dependencias del proyecto se instalan **acá**
> Los carriles concurrentes **no corren `yarn add`**: una dependencia nueva en una
> rama de carril produce conflicto de `yarn.lock` con las otras cuatro máquinas. Se
> instala ahora todo lo que las 18 fases van a necesitar (Nest, MikroORM, Zod, Pino,
> Graphile Worker, Multer, Jest, Supertest, Testcontainers, Playwright, decimal.js,
> Argon2, fast-check). Lo que falte después entra por micro-PR
> ([[07 Carriles de trabajo concurrente]] §6).

### `tsconfig.base.json` — no negociable

`strict: true`, `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`,
`noImplicitOverride`, `composite: true`, `incremental: true`,
`target: ES2023`, `module: NodeNext`. Alias: `@aportaya/contratos`,
`@aportaya/dominio`, `@aportaya/datos`.

**Entregable 0.1:** `yarn install` y `yarn typecheck` en verde con los cuatro
paquetes y las dos apps vacíos pero compilando.

---

## 0.2 · Docker: la base, el pooler y la entrada

### `docker-compose.yml` — servicios

| Servicio | Imagen | Puerto expuesto | Notas |
| --- | --- | :-: | --- |
| `postgres` | `postgres:16` | **ninguno** (red interna) | `init.sql` crea `btree_gist`, `pgcrypto`; volumen `datos_pg` |
| `pgbouncer` | `edoburu/pgbouncer` | ninguno | `pool_mode = transaction`, `max_client_conn`, `default_pool_size` |
| `api` | `docker/Dockerfile.api` | ninguno | se conecta a `pgbouncer:6432` |
| `worker` | `docker/Dockerfile.worker` | ninguno | se conecta a `postgres:5432` **directo** |
| `nginx` | `nginx:alpine` | `80`, `443` | **única entrada pública**; `api` nunca publica puerto |
| `archivos` | volumen `datos_archivos` | — | montado en `ARCHIVOS_RUTA` en api y worker |

`docker-compose.test.yml` sobreescribe con base efímera, `LOG_NIVEL=warn` y la semilla
de prueba cargada.

### Dockerfile multietapa (api y worker, mismo patrón)

```
FROM node:22-alpine AS deps      → yarn install --immutable
FROM node:22-alpine AS build     → yarn build
FROM node:22-alpine AS runtime   → USER node (no root), solo dist + node_modules de prod,
                                    HEALTHCHECK a /salud, dumb-init como PID 1
```

**Reglas de ADR-012:** sin root, sin `latest`, sin secretos en la imagen, capas de
dependencias separadas del código, `.dockerignore` que excluye `docs/`, `planes/`,
pruebas y `.git`.

**Entregable 0.2:** `docker compose up -d` levanta postgres + pgbouncer; `yarn
bd:aplicar && yarn bd:semillas && yarn bd:prueba` deja la base cargada;
`psql -f sql/50_verificacion/verificaciones.sql` y `prueba_humo.sql` en verde.

---

## 0.3 · Los cuatro ADR de desviación

El código no puede contradecir a la bóveda en silencio. Se escriben en
`docs/Arquitectura/` con la plantilla de la skill `decisiones-adr`, y cada uno
**supera explícitamente** al ADR anterior (que pasa a `estado: superada por ADR-0NN`).

| ADR | Título | Supera a | Qué tiene que argumentar y qué mitigación fija |
| --- | --- | --- | --- |
| **ADR-014** | Acceso a datos: MikroORM con entidades generadas | ADR-002 | Que el esquema **sigue siendo de `sql/`**. Fija las seis reglas de §4 del plan maestro como condición de la decisión: entidades generadas, sin `SchemaGenerator`, `readonly` en append-only, `SET LOCAL` por `tx.execute`, `DineroType`, PgBouncer *transaction*. Sin las seis, la decisión no se sostiene |
| **ADR-015** | Pruebas con Jest | ADR-008 | Que se conserva lo que ADR-008 protegía: **PostgreSQL 16 real** vía Testcontainers, un `it()` por criterio de aceptación, prueba de rechazo por restricción. Cambia el corredor, no el rigor. Suma Supertest (API) y Playwright/Chromium (E2E) |
| **ADR-016** | yarn como gestor de paquetes | menciones de pnpm en `Stack.md` y ADR-002 | Workspaces, `--immutable` en CI, lockfile único versionado |
| **ADR-017** | Almacenamiento de archivos: Multer local tras un puerto | menciones de object storage en `Stack.md` | Que es **transitorio**. El puerto `AlmacenArchivos` y el hash SHA-256 en base existen desde el día 1; el *object lock* que exige la evidencia regulatoria (reportes UIF, respaldos de reclamo) queda como deuda declarada con fecha de revisión |

También se corrige la mención a Fastify de ADR-001 (nota de enmienda, no ADR nuevo:
cambia el adaptador, no el runtime ni el framework).

**Entregable 0.3:** cuatro ADR nuevos, `docs/Arquitectura/_Arquitectura.md`
actualizado, ADR-002 y ADR-008 marcados como superados, `python3
scripts/verificar_boveda.py` en verde.

---

## 0.4 · Lint, formato y las reglas propias

`packages/eslint-config-aportaya` exporta la flat config compartida:
`@typescript-eslint` (typed rules), `eslint-plugin-import` con
`no-restricted-paths` para las capas, y **las nueve reglas propias** de §6 del plan
maestro.

En esta fase se implementan **cuatro** (las que no dependen de código que aún no
existe); las cinco restantes se activan en la Fase 1 y 2, cuando existen
`conTransaccion`, `Dinero` y las entidades:

| Ahora (Fase 0) | Después |
| --- | --- |
| `aportaya/capas` | `aportaya/sin-number-monetario` → Fase 1 |
| `aportaya/tamano-archivo` | `aportaya/sin-schema-generator` → Fase 1 |
| `aportaya/sin-umbral-literal` | `aportaya/sin-update-append-only` → Fase 1 |
| Prettier vía `eslint-config-prettier` | `aportaya/consulta-en-transaccion` → Fase 2 |
| | `aportaya/transaccion-solo-en-organismo` → Fase 2 |
| | `aportaya/sin-red-en-transaccion` → Fase 2 |

Cada regla propia lleva su propia prueba unitaria con `RuleTester`: una regla de lint
sin prueba se desactiva sola en el primer refactor.

**Entregable 0.4:** `yarn lint` en verde; las cuatro reglas con `RuleTester` pasando.

---

## 0.5 · Los cuatro corredores de Jest

`jest.config.ts` raíz con `projects`, `ts-jest` (o `@swc/jest` por velocidad) y
`testTimeout` distinto por proyecto:

| Proyecto | `testMatch` | `globalSetup` | Timeout |
| --- | --- | --- | :-: |
| `unit` | `**/*.spec.ts` **excluyendo** `CU*` y `*Repositorio.spec.ts` | ninguno | 5 s |
| `integracion` | `**/CU*.spec.ts`, `**/*Repositorio.spec.ts` | Testcontainers: levanta Postgres 16, aplica `sql/aplicar.sql` + semillas mínimas, exporta `BD_URL` | 120 s |
| `api` | `**/CU*.http.spec.ts` | igual que `integracion` + arranca la app Nest | 120 s |
| `e2e` | `**/*.e2e.spec.ts` | `docker compose -f docker-compose.test.yml up -d --wait` | 300 s |

**Detalle que ahorra horas:** el contenedor de Postgres se levanta **una vez** por
corrida (`globalSetup`), no por archivo. Cada archivo de prueba corre dentro de una
transacción que se revierte al terminar, salvo las pruebas de concurrencia y de
worker, que necesitan commits reales y usan un esquema propio.

**Entregable 0.5:** los cuatro proyectos configurados; una prueba de humo por
proyecto pasando (`suma.spec.ts`, `conexion.spec.ts`, `salud.http.spec.ts`,
`salud.e2e.spec.ts`).

---

## 0.6 · Esqueleto de `apps/api` y `apps/worker`

Solo el arranque. Sin módulos de negocio.

```
apps/api/src/
├── main.ts                  bootstrap, Pino, apagado controlado, puerto
├── app.module.ts            importa ConfiguracionModule, DatosModule, SaludModule
└── comun/
    ├── configuracion/       esquema Zod del entorno, validado al arrancar
    └── salud/               GET /salud (proceso) · GET /salud/listo (base + cola)
```

- `/salud` responde sin tocar la base (*liveness*).
- `/salud/listo` verifica base y cola (*readiness*). Si la base no responde, `503`.
- **Apagado controlado**: `SIGTERM` → deja de aceptar conexiones → termina el request
  en curso → cierra el pool. El worker termina el trabajo en curso antes de morir.
- Si falta una variable de entorno, el proceso **no levanta** y lo dice con el nombre
  de la variable.

**Entregable 0.6:** `curl localhost/salud` responde `200` a través de NGINX, con el
contenedor de la API sin puerto publicado.

---

## 0.7 · CI

`.github/workflows/ci.yml` con los 12 pasos de §6 del plan maestro, en ese orden y
todos bloqueantes. En la Fase 0 los pasos 5–11 corren sobre lo que existe (poco) pero
**tienen que existir en el archivo desde ahora**: un paso que se agrega "después"
nunca se agrega.

Además: escaneo de secretos en cada push, y `yarn install --immutable` (falla si el
lockfile no está al día).

**Entregable 0.7:** CI en verde sobre la rama de la fase.

---

## Gate de salida de la Fase 0

Ejecutar, no suponer:

```bash
yarn install --immutable
yarn lint && yarn typecheck
yarn bd:reset                          # aplicar + semillas mínimas + prueba
psql -d aportaya -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql
psql -d aportaya -f sql/61_prueba/sembrar_prueba.sql
psql -f sql/50_verificacion/verificaciones.sql
psql -f sql/50_verificacion/prueba_humo.sql        # todo OK, cero FALLA
yarn test:unit && yarn test:integracion && yarn test:api
docker compose up -d --wait && curl -f http://localhost/salud
yarn test:e2e
python3 scripts/verificar_boveda.py
```

- [ ] Los nueve puntos del gate común (§9 del plan maestro)
- [ ] Las 274 tablas existen en la base y las 12 verificaciones de `sql/50_verificacion/` pasan
- [ ] Los **20** catálogos mínimos están sembrados y la licencia figura `EN_TRAMITE`
- [ ] `prueba_humo.sql` da **todo OK, cero FALLA** sobre base recién creada
- [ ] `.env.example` completo y versionado; el proceso no levanta sin una variable
- [ ] Los cuatro ADR nuevos están escritos y los superados, marcados
- [ ] La API no publica puerto: solo NGINX
- [ ] El proceso no levanta si falta una variable de entorno (probado a propósito)

## Ver también

[[00c Recetario · implementar un caso de uso]] · [[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[00 Plan maestro]] · [[02 Fases 1 y 2 · Capa de datos y núcleo transversal]] · [[Estructura del repositorio]] · [[ADR-012 Empaquetado y despliegue]]
