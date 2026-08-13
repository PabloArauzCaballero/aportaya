---
tags:
  - arquitectura
  - metodo
titulo: "Lineamientos adoptados y descartados"
fecha_revision: 2026-08-13
---

# Lineamientos adoptados y descartados

> Qué se incorporó del prompt de backend de producción v7.0.0 y del prompt general
> de programación, y **qué se descartó porque contradice una decisión ya tomada**
> en esta bóveda. La regla de resolución es una sola:

> **Ante conflicto gana la bóveda.** El caso de uso, la restricción, el modelo y el
> ADR vigente mandan sobre cualquier lineamiento externo. Lo que contradice se
> elimina, no se deja conviviendo: dos reglas opuestas en dos documentos producen
> código que cumple una y viola la otra.

## Adoptado — y dónde vive ahora

| Del prompt | Skill que lo implementa |
| --- | --- |
| Temperatura 0, cero adivinanzas, supuestos declarados | `codigo-limpio` (regla cero) · [[Prompt general de desarrollo]] |
| KISS, abstraer solo con repetición real, sin capas decorativas | `codigo-limpio` · [[Método de arquitectura]] |
| Nombres del dominio, prohibición de `Manager`/`Helper`/`Utils` | `codigo-limpio` · `glosario-dominio` |
| Límite de tamaño de archivo con umbrales y excepciones justificadas | `ci-calidad` |
| Tipado estricto, `unknown` antes que `any`, contratos explícitos entre capas | `codigo-limpio` · `contratos-api` |
| Matriz de librerías y ADR obligatorio para decisiones caras | `decisiones-adr` |
| No afirmar "listo para producción" sin evidencia | `definicion-de-terminado` |
| Auth default-deny, JWT, refresh rotado, Argon2id, rate limit | `autenticacion-jwt` |
| Validación de toda entrada externa (body, query, headers, webhooks, env) | `contratos-api` · `autenticacion-jwt` |
| Idempotencia con clave, fingerprint, claim atómico y replay | `idempotencia-reintentos` |
| Adapters de integración con timeout, retry, breaker, mocks | `trabajos-outbox` · `resiliencia-rendimiento` |
| Logger único, redacción de sensibles, correlation/trace ID | `observabilidad` |
| Métricas, health vs readiness, SLO y alertas accionables | `observabilidad` · `resiliencia-rendimiento` |
| Escalabilidad: pools, N+1, paginación, streaming, backpressure | `resiliencia-rendimiento` |
| Rendimiento medido, baseline, query plans, presupuesto | `resiliencia-rendimiento` |
| Reader/writer separados, réplicas, vistas y proyecciones | `lecturas-proyecciones` |
| NGINX como única entrada, Docker no root, redes internas, K8s separado | `despliegue-contenedores` |
| Backups configurables y **restore drill obligatorio** | `respaldos-restauracion` |
| Seeds boot/mock en JSON, idempotentes, mock bloqueado en producción | `semillas-catalogos` (ya lo hacía: `seeders/minimos` y `seeders/prueba`) |
| CI con gates que bloquean merge, cobertura como piso, supply chain | `ci-calidad` |
| OpenAPI sin drift, `endpoints.md`, README por carpeta con valor real | `documentacion-entregables` |
| Protocolo por fases con gate de entrada y salida, informe de progreso | `plan-por-fases` |
| Definición objetiva de calidad con matriz de evidencia | `definicion-de-terminado` |

## Descartado — y por qué

| Del prompt | Por qué se elimina |
| --- | --- |
| **Sequelize como ORM** (modelos, `sync`, Umzug, repository CRUD genérico, `QueryManager`) | [[ADR-002 Acceso a datos]]: el esquema es **generado** desde `docs/entidades/*.puml`; el acceso a datos se deriva de la base por introspección con **Kysely**. Un ORM que administre modelos crea una segunda copia de 274 tablas que diverge. |
| **Migraciones versionadas escritas a mano** (Umzug, `queryInterface`) | El DDL sale de `scripts/generar_ddl.py`. Se aplica `sql/aplicar.sql`; nunca se escribe una migración suelta ([[Entornos y despliegue]]). |
| **Express adapter como opción viva** | [[ADR-001 Lenguaje y runtime]] ya fijó NestJS sobre **Fastify**. La elección está hecha; reabrirla por proyecto solo genera dos estilos. |
| **BullMQ / Redis / colas externas para el outbox** | [[ADR-003 Trabajos, outbox y planificador]]: la cola vive en la **misma PostgreSQL** para que encolar sea parte del `COMMIT`. Una cola externa reintroduce el estado imposible: transacción revertida con efecto enviado. |
| **Jest + Supertest** | [[ADR-008 Pruebas]]: **Vitest + Testcontainers** contra PostgreSQL 16 real, porque la garantía vive en la base. |
| **`class-validator` / DTOs con decoradores** | [[ADR-006 Contratos y validación]]: Zod compartido con la app y el backoffice; los decoradores no cruzan al cliente. |
| **Prohibir objetos en `public` y exigir schemas por dominio** | El esquema generado hoy vive en el schema por defecto. Separarlo por dominio exigiría cambiar el generador y las 566 FK; el aislamiento se logra con **RLS + roles** ([[ADR-007 Sesión, RLS y pooling]]). Si algún día se hace, es un ADR nuevo, no una regla suelta. |
| **Roles `backend_migrator` / `backend_writer` / `backend_reader`** | El repositorio ya define `rol_aplicacion`, `rol_backoffice`, `rol_cumplimiento`, `rol_auditor` y `rol_migracion` en `sql/00_base/01_roles.sql`. Se usan **esos nombres**; la idea de separación de privilegios se conserva íntegra. |
| **Documentación LaTeX del modelo de datos** | La bóveda de Obsidian con una nota por tabla y una por FK **ya es** esa documentación, y está generada. Un `.tex` paralelo sería una tercera copia que envejece. |
| **Cobertura como umbral de calidad principal** | Se conserva como **piso** en `ci-calidad`, pero el criterio sigue siendo el de [[ADR-008 Pruebas]]: qué del dinero **no** está probado, no el porcentaje. |
| **"Nunca SQL puro como seeds"** — *no era conflicto* | Ya se cumple: la fuente son los JSON de `seeders/`; el SQL de `sql/60_semillas/` es un derivado generado. Se adopta tal cual. |

## Qué hacer cuando aparezca otro lineamiento externo

1. Buscar si contradice un caso de uso, una restricción o un ADR vigente.
2. Si contradice y el lineamiento externo es mejor → **se escribe un ADR nuevo** que
   supera al anterior, con su motivo. No se aplica en silencio.
3. Si contradice y no es mejor → se elimina del lineamiento externo y se anota acá.
4. Si no contradice → se incorpora a la skill que corresponda, no a un documento
   suelto que nadie va a leer al programar.

## Ver también

[[_Arquitectura]] · [[Método de arquitectura]] · [[Prompts/_Prompts|Prompts generalistas]] · [[Stack]]
