---
tags:
  - moc
  - arquitectura
titulo: "Arquitectura — decisiones y su motivo"
fecha_revision: 2026-08-12
---

# Arquitectura de AportaYa

> **Qué es esta carpeta.** Las decisiones técnicas del sistema, una por documento,
> cada una con **el motivo por el que se tomó** y lo que la revertiría. No describe
> cómo se ve el código: describe por qué el código es así y qué se rompe si alguien
> lo cambia sin leer esto.

La cadena completa del proyecto es:

```
Norma → Caso de uso → Restricción → Modelo → Esquema → Arquitectura → Código
```

[[Cumplimiento]] · [[_CasosDeUso]] · [[Restricciones]] · [[_Entidades]] · `sql/` ·
**esta carpeta** · el repositorio de aplicación.

Las seis primeras capas ya existen y mandan. La arquitectura **no puede
contradecirlas**: solo elige con qué herramientas se sostienen.

## La decisión en una línea

> **TypeScript de punta a punta: Node 22 + NestJS + Kysely + Graphile Worker sobre
> PostgreSQL 16; Expo para la app y React + Vite para el backoffice.**

El razonamiento completo —incluidas las alternativas evaluadas y por qué
perdieron— está en [[Stack]].

## Decisiones

| # | Decisión | Elección | Estado |
| --- | --- | --- | --- |
| [[ADR-001 Lenguaje y runtime\|001]] | Lenguaje, runtime y framework de la API | TypeScript · Node 22 · NestJS/Fastify | Aceptada |
| [[ADR-002 Acceso a datos\|002]] | Cómo habla el código con las 274 tablas | Kysely con tipos introspectados | Aceptada |
| [[ADR-003 Trabajos, outbox y planificador\|003]] | Efectos externos, cron y reintentos | Graphile Worker en la misma base | Aceptada |
| [[ADR-004 Frontend\|004]] | App del participante y backoffice | Expo + React/Vite | Aceptada |
| [[ADR-005 Dinero y decimales\|005]] | Cómo viaja un importe por el sistema | `numeric` string + `decimal.js` | Aceptada |
| [[ADR-006 Contratos y validación\|006]] | Contrato entre backend y clientes | Zod compartido, OpenAPI derivado | Aceptada |
| [[ADR-007 Sesión, RLS y pooling\|007]] | Identidad de la sesión hasta la base | `SET LOCAL` + PgBouncer *transaction* | Aceptada |
| [[ADR-008 Pruebas\|008]] | Qué se considera probado | Vitest + Testcontainers, criterio a criterio | Aceptada |
| [[ADR-009 Composición atómica\|009]] | Cómo se descompone el código, front y back | Átomos, moléculas y organismos | Aceptada |
| [[ADR-010 Autenticación y sesión\|010]] | Cómo se autentica y cómo llega la identidad a la base | Default-deny · bearer en la app, cookie en el backoffice | Aceptada |
| [[ADR-011 Lecturas y réplica\|011]] | Qué se lee de la réplica y cuándo vale una proyección | Separación por credencial; proyecciones generadas | Aceptada |
| [[ADR-012 Empaquetado y despliegue\|012]] | Cómo se empaqueta y se pone en producción | NGINX única puerta · migración como trabajo aparte | Aceptada |
| [[ADR-013 Respaldo y continuidad\|013]] | Qué se respalda y cómo se prueba que sirve | Punto en el tiempo + ensayo de restauración obligatorio | Aceptada |

## Documentos de referencia

| Documento | Responde |
| --- | --- |
| [[Método de arquitectura]] | **Cómo se diseña siempre**: los ocho pasos, dónde vive cada garantía, señales de mal diseño |
| [[Estructura del repositorio]] | Dónde vive cada archivo y por qué el nombre lleva `CU-NN` |
| [[Flujo de una transacción]] | Qué pasa, en orden, entre el request y el `COMMIT` |
| [[Entornos y despliegue]] | Cómo se aplica el esquema, se siembra y se opera |
| [[Prompts/_Prompts\|Prompts generalistas]] | Los tres prompts —general, backend, frontend— que imponen la composición atómica |
| [[Lineamientos adoptados y descartados]] | Qué se tomó de los lineamientos externos y qué se eliminó por contradecir la bóveda |

## Cómo se usa esta carpeta al programar

1. Lee el caso de uso y sus restricciones (skill `implementar-desde-boveda`).
2. Sigue el [[Método de arquitectura]], sin saltar pasos.
3. Lee el ADR de la capa que vas a tocar. Si tu diseño lo contradice, **el ADR gana**
   hasta que alguien escriba uno nuevo que lo supere.
4. Usa la skill de la tecnología correspondiente: `back-nestjs`, `datos-kysely`,
   `trabajos-outbox`, `movil-expo`, `web-backoffice`.
5. Las reglas que valen para todas: `arquitectura-atomica`, `codigo-limpio`,
   `contratos-api`, `dinero-decimal`, `pruebas-cu`, `entorno-monorepo`, y
   `revision-codigo` antes de fusionar.

## Cuándo se escribe un ADR nuevo

Cuando la decisión sea **cara de revertir**: cambia la forma del código en muchos
lugares, ata a un proveedor, o afecta cómo se garantiza una restricción. Un ADR no
se edita para cambiar de opinión: se escribe uno nuevo que **supera** al anterior y
el viejo queda marcado como superado, con la fecha. La historia de por qué se
decidió algo es evidencia, y en este proyecto la evidencia no se borra.

## Ver también

[[Stack]] · [[Index]] · [[Restricciones]] · [[_CasosDeUso]]
