---
tags:
  - arquitectura
titulo: "Entornos y despliegue"
fecha_revision: 2026-08-12
---

# Entornos y despliegue

> Cómo se aplica el esquema, cómo se opera y qué tiene que ser cierto antes de que
> un despliegue toque dinero real.

## Procesos

| Proceso | Qué corre | Rol de base | Escala |
| --- | --- | --- | --- |
| `api` | NestJS | `api` | Horizontal, sin estado |
| `worker` | Graphile Worker (outbox + cron) | `worker` | Horizontal; los trabajos con fecha se bloquean por identificador |
| `reportes` | Consultas pesadas, exportes | `reportes` (solo lectura) | Contra la réplica |
| `migrador` | Aplica `sql/` | `migrador` (DDL) | Una vez por despliegue |

Ningún proceso comparte rol con otro, y **ninguno es superusuario**. El rol `api` no
tiene `UPDATE`/`DELETE` sobre las tablas append-only: la barrera es de base, no de
código ([[ADR-007 Sesión, RLS y pooling]]).

## Entornos

| Entorno | Base | Datos | Quién entra |
| --- | --- | --- | --- |
| Local | Postgres 16 en Docker | Semillas de catálogo + `99_desarrollo.sql` | Cualquiera |
| Pruebas (CI) | Testcontainers, efímera | Semillas de catálogo | Nadie |
| Integración | Gestionada | Datos ficticios, proveedores en modo prueba | Equipo |
| Producción | Gestionada, réplica + PITR | Datos reales | **Nadie con `psql` de escritura** |

En producción no hay acceso interactivo de escritura a la base. Lo que haga falta se
hace por caso de uso, y queda en bitácora. Esa es la diferencia entre un sistema
auditable y uno que solo dice serlo.

## Despliegue del esquema

```bash
python3 scripts/generar_ddl.py                        # el DDL sale de la bóveda
psql -v ON_ERROR_STOP=1 -f sql/aplicar.sql            # tablas → claves → índices → sellos → reglas
psql -v ON_ERROR_STOP=1 -f sql/60_semillas/sembrar.sql
psql -f sql/50_verificacion/prueba_humo.sql           # 65 comprobaciones
pnpm datos:tipos                                      # introspección → tipos de Kysely
```

Reglas:

1. **El esquema se despliega antes que el código**, y solo con cambios compatibles
   hacia atrás (agregar columna anulable, agregar tabla). Un cambio incompatible se
   parte en dos despliegues: primero la base tolera ambos, después el código deja de
   usar lo viejo.
2. **Nunca se edita `sql/` a mano.** Si hace falta algo distinto, se cambia el
   `.puml` o el catálogo y se regenera (skills `boveda-modelo`, `restriccion`).
3. **Sin catálogo sembrado no se opera**, y es deliberado: *denegar por omisión*
   rechaza toda operación sin límite, tarifario o licencia vigente (`R-LIM-01`,
   `R-LIC-01`).

## Configuración

Variables de entorno **validadas con un esquema al arrancar**: si falta una, el
proceso no levanta. Nada de valores por defecto silenciosos para credenciales,
umbrales o URLs de proveedores. Los secretos viven en el gestor de secretos del
proveedor, nunca en el repositorio ni en la imagen.

Lo que **no** es configuración: umbrales regulatorios, límites operativos y tarifas.
Eso es catálogo en la base, con vigencia y evidencia de quién lo cambió.

## Puerta de calidad antes de producción

- [ ] `sql/aplicar.sql` aplica en limpio y la prueba de humo pasa.
- [ ] La suite completa pasa contra Postgres real ([[ADR-008 Pruebas]]).
- [ ] Los tipos introspectados están al día (diff vacío en CI).
- [ ] Ninguna regla de lint de dinero silenciada.
- [ ] Existe plan de reversión: el despliegue anterior levanta contra el esquema nuevo.

## Operación

| Qué | Cómo |
| --- | --- |
| Respaldo | Continuo con PITR; se prueba la restauración, no se asume |
| Continuidad | CU-56 exige ejercitar la prueba de continuidad, con evidencia |
| Monitoreo | Trabajos en cola, edad del trabajo más viejo, fallos por adaptador, descuadre de encaje |
| Alertas que despiertan a alguien | Encaje descuadrado, cierre diario no ejecutado, reporte con plazo legal por vencer |
| Trazas | OpenTelemetry; toda traza lleva `cu`, `usuario_id` y llega hasta el worker |
| Retención | Según [[Cumplimiento]]; los registros de auditoría no se purgan por conveniencia |

## Integraciones externas

Cada proveedor —pasarela QR, WhatsApp Business Cloud API, SIAT del SIN, KYC—
entra por una **interfaz de dominio** con su adaptador, su clave de idempotencia y
su modo de prueba. Sustituir un proveedor debe ser cambiar un adaptador, no tocar un
caso de uso. Las credenciales de cada uno viven en el gestor de secretos y rotan sin
desplegar código.

## Ver también

[[ADR-007 Sesión, RLS y pooling]] · [[ADR-008 Pruebas]] · [[Flujo de una transacción]] · [[Cumplimiento]]
