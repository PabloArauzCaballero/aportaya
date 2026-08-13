---
tags:
  - moc
  - stack
titulo: "Stack recomendado — backend y frontend"
fecha_revision: 2026-08-12
---

# Stack recomendado — backend y frontend

> **Qué es este documento.** Las opciones de tecnología para implementar el sistema
> que la bóveda ya especifica, evaluadas contra las exigencias que el propio modelo
> impone. No es una lista de tecnologías de moda: cada opción se juzga por si
> sostiene o no las reglas de [[Restricciones]], [[Cumplimiento]] y [[_CasosDeUso]].

## Lo que el modelo le exige al stack

Antes de elegir nada: la bóveda ya cerró siete decisiones. El stack no las discute,
las tiene que soportar.

| Exigencia | De dónde viene | Qué le pide al stack |
| --- | --- | --- |
| **La base es la fuente de verdad, y su DDL es generado** | `scripts/generar_ddl.py` → 274 tablas, 565 FK | Un ORM que *administre* el esquema está descartado. El acceso a datos se genera **desde** la base (introspección/codegen), nunca al revés. |
| **Una transacción por caso de uso** | `implementar-desde-boveda` | Control explícito de `BEGIN…COMMIT` en la capa de aplicación. Nada de repositorios con autocommit implícito por operación. |
| **Contexto de sesión para RLS** | `app.usuario_id`, `app.rol` | Poder ejecutar `SET LOCAL` en la **misma conexión** que la transacción. Esto elimina varios ORM y todo pooling mal configurado. |
| **Dinero exacto en `DECIMAL(14,2)`** | modelo relacional, partida doble | Tipo decimal real de punta a punta. Un `float` en cualquier capa es un defecto de cumplimiento, no de estilo. |
| **Append-only, corrección por reverso** | `35_append_only/`, [[asiento_contable]] | El driver no puede depender de `UPDATE` para nada del libro; el código ni debería intentarlo. |
| **Outbox, no llamadas dentro de la transacción** | `evento_dominio` | Un worker con cola **en la misma Postgres**, para que encolar sea parte del `COMMIT`. |
| **Plazos legales que vencen solos** | CU-43, CU-51, CU-52, CU-56 | Planificador confiable con ejecución exactamente-una-vez entre réplicas (cierre diario, reportes UIF, vencimiento de reclamos). |

Además: dos productos de frontend, no uno. La **app del participante** (billetera,
QR, aportes) y el **backoffice** (oficial de cumplimiento, soporte, contabilidad,
reportes ASFI/UIF) tienen usuarios, ritmos y requisitos distintos.

---

## La decisión

> **TypeScript de punta a punta: Node 22 + NestJS + Kysely + Graphile Worker sobre
> PostgreSQL 16; Expo para la app de AportaYa y React + Vite para el backoffice.**

Una sola apuesta, un solo lenguaje en los tres artefactos. El detalle y el motivo de
cada pieza está en [[_Arquitectura]], una decisión por documento.

| Capa | Elección | En una línea |
| --- | --- | --- |
| Runtime y API | Node 22 LTS · **NestJS** sobre Fastify | Módulos y transacción explícita por caso de uso · [[ADR-001 Lenguaje y runtime]] |
| Acceso a datos | **Kysely** con tipos introspectados de la base viva | Query builder, no ORM: el esquema lo sigue mandando `sql/` · [[ADR-002 Acceso a datos]] |
| Trabajos y outbox | **Graphile Worker** en la misma Postgres | Encolar es parte del `COMMIT` · [[ADR-003 Trabajos, outbox y planificador]] |
| App del participante | **Expo / React Native** | QR, biometría, dispositivo de confianza y correcciones OTA · [[ADR-004 Frontend]] |
| Backoffice | **React + Vite**, TanStack Query/Router | Pantallas densas de cumplimiento · [[ADR-004 Frontend]] |
| Dinero | `numeric` como *string* + `decimal.js` | Ningún importe pasa por `number` · [[ADR-005 Dinero y decimales]] |
| Contratos | **Zod** compartido, OpenAPI derivado | El contrato del caso de uso se escribe una vez · [[ADR-006 Contratos y validación]] |
| Sesión y RLS | `SET LOCAL` dentro de la transacción, PgBouncer *transaction* | Sin contexto no hay política de fila · [[ADR-007 Sesión, RLS y pooling]] |
| Pruebas | Vitest + Testcontainers con Postgres 16 real | Los criterios de aceptación, uno a uno · [[ADR-008 Pruebas]] |

### Por qué esta y no otra

Las tres alternativas evaluadas **empatan en lo que de verdad importa acá**:
convivir con un DDL generado, controlar la transacción y poner el contexto de RLS
en la conexión correcta. En las tres la solución es la misma —query builder o
codegen, nunca un ORM dueño del esquema—, así que ninguna gana por ahí.

Empatado eso, decide lo práctico: esta bóveda tiene **36 casos de uso con criterios
de aceptación y 565 relaciones**. El cuello de botella del proyecto es traducir esa
especificación, no el rendimiento del runtime. Con TypeScript el contrato de cada
caso de uso se escribe **una vez** en Zod y lo consumen la API, la app y el
backoffice; con un backend en otro lenguaje se escribe tres veces y se
desincroniza en la cuarta semana. Ese es todo el argumento, y es suficiente.

### El precio, y cómo se paga

JavaScript **no tiene decimal nativo**, y en un sistema de partida doble eso no es
un detalle de estilo. Se paga con tres reglas duras desde el primer commit:

1. `pg` devuelve `numeric` como *string* (parser explícito, nunca el de por defecto).
2. Todo importe vive como `Decimal` de `decimal.js` en el dominio.
3. Regla de lint que **prohíbe `number`** en cualquier tipo que represente dinero.

Con eso el riesgo queda al nivel de Java. Sin eso, esta opción no se elige.

### Lo único que revierte la decisión

Que el objetivo real a doce meses sea **operar con licencia ASFI e integrarse con
un core bancario**. Ahí se pasa a **Spring Boot + jOOQ** sin discutir: `BigDecimal`
nativo, y en una auditoría de sistemas o una integración con banco pesa el stack
que el auditor ya sabe leer. Python queda para lo que ya hace bien en el repo: los
generadores de la bóveda y del DDL (`scripts/*.py`).

---

## Las alternativas evaluadas

### Opción A — TypeScript (NestJS + Kysely/Drizzle)

| Pieza | Elección |
| --- | --- |
| Runtime / framework | Node 22 LTS + **NestJS** sobre adaptador Fastify |
| Acceso a datos | **Kysely** (o Drizzle) con tipos generados por introspección de la base viva |
| Driver | `pg` (node-postgres), `numeric` leído como *string* |
| Dinero | `decimal.js` en dominio; nunca `number` |
| Migraciones | **dbmate**/Flyway aplicando `sql/aplicar.sql` — el DDL sigue siendo generado |
| Cola / outbox / cron | **Graphile Worker** o pg-boss (cola en la misma Postgres) |
| Validación | Zod en el borde; el mismo esquema se comparte con el frontend |
| Pruebas | Vitest + **Testcontainers** con Postgres 16 real |
| Monorepo | pnpm + Turborepo (`api`, `app`, `backoffice`, `contratos`) |

**Por qué encaja.** Un solo lenguaje para backend, app móvil y backoffice: los
contratos y las validaciones se escriben una vez y se comparten como paquete. Es
además el lenguaje que ya asumen las skills del repo (`CU31DevengarComision.ts`).
Kysely/Drizzle son *query builders*, no ORM: no pretenden administrar el esquema,
así que conviven bien con 274 tablas generadas, y dejan el SQL a la vista —
importante cuando una consulta tiene que ser auditable.

**Riesgos.** Node no tiene decimal nativo: la disciplina de no tocar `number` para
importes hay que sostenerla con lint y revisión. Y hay que resistir la tentación de
meter Prisma, que quiere ser dueño del esquema y hace incómodo el `SET LOCAL` de RLS.

### Opción B — Kotlin/Java (Spring Boot + jOOQ)

| Pieza | Elección |
| --- | --- |
| Runtime / framework | JDK 21 + **Spring Boot 3** (MVC con virtual threads) |
| Acceso a datos | **jOOQ**, generado desde la base viva. Nada de JPA/Hibernate |
| Dinero | `BigDecimal` nativo |
| Migraciones | **Flyway** aplicando los artefactos de `sql/` |
| Cola / outbox / cron | Postgres + `SELECT … FOR UPDATE SKIP LOCKED`, o Quartz con ShedLock |
| Pruebas | JUnit 5 + Testcontainers |

**Por qué encaja.** Es el stack que un supervisor financiero, un auditor externo y
un banco corresponsal esperan encontrar, y el que domina la banca boliviana: si el
proyecto va a integrarse con core bancario o pasar una auditoría de sistemas, esto
reduce fricción. `BigDecimal`, `@Transactional` con propagación explícita y jOOQ
generado desde el DDL son exactamente lo que pide el modelo. Es la opción más
sólida a diez años.

**Riesgos.** Más ceremonia y arranque más lento; equipo más caro; el frontend queda
en otro lenguaje sí o sí. Y hay que ser tajante: **JPA no**, porque el modelo
append-only con partida doble se pelea con el *dirty checking* de Hibernate.

### Opción C — Python (FastAPI + SQLAlchemy Core)

| Pieza | Elección |
| --- | --- |
| Runtime / framework | Python 3.12 + **FastAPI** |
| Acceso a datos | **SQLAlchemy Core** con tablas reflejadas (no el ORM declarativo) |
| Driver | psycopg 3 (`Decimal` nativo) |
| Cola / outbox / cron | **arq** o Celery, con Postgres/Redis |
| Validación | Pydantic v2 |
| Pruebas | pytest + Testcontainers |

**Por qué encaja.** Es el lenguaje en el que ya están los generadores del repo
(`scripts/*.py`): un solo entorno para generar la bóveda, el DDL y correr la API.
`Decimal` es nativo y la reflexión de SQLAlchemy Core lee las 274 tablas sin pedir
que las declares. Es el camino más corto a un primer flujo funcionando.

**Riesgos.** El tipado es opcional y aquí el tipado es control interno: sin `mypy`
estricto la exactitud depende de la revisión humana. Menor rendimiento por
conexión y ecosistema de colas más frágil que las alternativas.

> **Mención aparte — Go (sqlc + pgx + River).** Conceptualmente es la mejor
> pareja del repo: `sqlc` genera código *desde SQL escrito a mano*, que es
> literalmente cómo está organizado `sql/`. Binario único, costo de infraestructura
> mínimo. Se queda fuera del podio solo por mercado laboral local y porque los
> decimales requieren biblioteca externa (`shopspring/decimal`).

### Comparación

| Criterio | A · TypeScript | B · Kotlin/Spring | C · Python |
| --- | :-: | :-: | :-: |
| Convivencia con DDL generado | Alta | Alta | Alta |
| Exactitud de dinero por diseño | Media | **Alta** | Alta |
| Control de transacción y RLS | Alta | **Alta** | Alta |
| Compartir tipos con el frontend | **Alta** | Baja | Baja |
| Credibilidad ante auditoría/banca | Media | **Alta** | Media |
| Velocidad al primer caso de uso | Alta | Media | **Alta** |
| Costo y disponibilidad de equipo | **Alta** | Media | Alta |

**Elegida: la Opción A**, por lo dicho arriba. Las otras dos no quedaron fuera por
malas: la **B** es la mejor a diez años y vuelve a la mesa el día que haya licencia
ASFI o integración con core bancario; la **C** habría sido la correcta si el
objetivo fuera solo demostrar los flujos de la bóveda funcionando, sin producto.

---

## Frontend — dos productos, tres opciones

### Opción 1 — Expo (React Native) + React web

| Producto | Elección |
| --- | --- |
| App del participante | **Expo / React Native**, `expo-camera` (QR), `expo-secure-store`, biometría y registro de dispositivo (CU-04), push vía FCM/APNs |
| Backoffice | **Vite + React**, TanStack Router + TanStack Query, shadcn/ui, tablas densas y exportables |
| Estado servidor | TanStack Query en ambos; cliente generado desde OpenAPI |

Un solo lenguaje con el backend si se eligió A, componentes de dominio compartidos
y despliegue de correcciones sin pasar por revisión de tienda (EAS Update) — que
importa cuando cambia un tarifario o un umbral regulatorio.

### Opción 2 — Flutter + React web

App en Flutter (rendimiento y consistencia visual excelentes en Android de gama
baja, que es el parque real en Bolivia) y backoffice igualmente en React, porque
Flutter Web no es buena idea para pantallas densas de cumplimiento. Costo: un
tercer lenguaje en el proyecto y contratos duplicados.

### Opción 3 — PWA única (Next.js)

Una sola base para todo. Más barata, pero paga caro donde el modelo es exigente:
biometría y dispositivo de confianza limitados, push en iOS frágil, lector de QR
peor en gama baja y ninguna presencia en tienda. **Sirve para el backoffice, no
para una billetera.**

**Elegida: la Opción 1.** Expo para la app, React para el backoffice, tipos y
validaciones compartidos con el backend — que es justamente lo que desempató la
elección del backend. La identidad visual y el sistema atómico de ambos productos
están en la skill `disenar-frontend-aportaya`; este documento solo decide la
tecnología, no el diseño.

---

## Piezas transversales (van igual, se elija lo que se elija)

| Área | Elección | Por qué |
| --- | --- | --- |
| Base de datos | **PostgreSQL 16** gestionada, con réplica y PITR | Ya verificado; el modelo usa `btree_gist`, `EXCLUDE`, RLS |
| Pooling | PgBouncer en modo *transaction*, y **solo `SET LOCAL`** | `SET` plano filtra el contexto RLS entre requests |
| Migraciones | Aplicar los artefactos de `sql/`, nunca migraciones de ORM | La fuente de verdad son los `.puml` + el catálogo |
| Colas y cron | Postgres (`SKIP LOCKED`) para outbox y trabajos | Encolar dentro del `COMMIT`; sin sistema externo que se desincronice |
| Idempotencia | Clave del cliente/proveedor validada antes de escribir | Regla del borde, no del framework |
| Evidencia y archivos | Object storage con *object lock* + hash en base | Reportes UIF, respaldos de reclamo, extractos |
| Observabilidad | OpenTelemetry + logs estructurados con `usuario_id` y `CU-NN` | La trazabilidad especificación→código llega hasta la traza |
| Integraciones | WhatsApp Business Cloud API · pasarela QR bancaria · SIAT del SIN para factura electrónica · proveedor KYC | Cada una detrás de una interfaz, con idempotencia en el borde |
| Entornos | Contenedores (Docker) sobre servicio gestionado; despliegue con réplicas para el planificador | El cierre diario no puede correr dos veces |

## Qué no usar, y por qué

- **ORM que administre el esquema** (Prisma Migrate, JPA/Hibernate, Django ORM,
  Alembic autogenerado): compiten con `scripts/generar_ddl.py` por la propiedad del
  esquema, y ese conflicto termina en divergencia silenciosa entre bóveda y base.
- **Punto flotante para importes**, en cualquier capa, incluida la de presentación.
- **Serverless con conexiones efímeras** para los flujos de dinero: RLS por sesión y
  transacciones largas no conviven bien con pools sin estado.
- **Una base documental** para el libro contable: la partida doble y las
  restricciones de exclusión son la razón de ser del modelo.
- **Colas externas** (SQS, Rabbit) para el outbox: rompen la garantía de que el
  evento se encola exactamente cuando la transacción confirma.

## Cómo validar la elección en una semana

Implementa **CU-31 (devengar y cobrar la comisión)** de punta a punta en la opción
candidata: toca dinero, tarifario congelado, partida doble, outbox e impuestos. Si
el stack sostiene ese caso con sus criterios de aceptación como pruebas —incluida
la de rechazo de cada restricción citada— sostiene el resto del sistema.

## Ver también

[[Index]] · [[Restricciones]] · [[Cumplimiento]] · [[_CasosDeUso]]
