# Skills de AportaYa

Cada carpeta es una skill: instrucciones de **cómo se hace el trabajo acá**, no
documentación del producto. Se invocan solas cuando la tarea coincide con su
descripción, o a mano con `/<nombre>`.

La bóveda (`docs/`) dice **qué** hay que construir. Las skills dicen **cómo**.

## Método y arquitectura

| Skill | Cuándo |
| --- | --- |
| `arquitectura-atomica` | Antes del primer archivo de cualquier funcionalidad |
| `implementar-desde-boveda` | Al empezar a programar un caso de uso |
| `codigo-limpio` | Al escribir o revisar cualquier código |
| `revision-codigo` | Al revisar un PR |
| `entorno-monorepo` | Al mover paquetes, dependencias o scripts |
| `git-flujo` | Antes de commitear y al abrir el PR |
| `glosario-dominio` | Al nombrar cualquier cosa |

## Especificación: la bóveda

| Skill | Cuándo |
| --- | --- |
| `boveda-modelo` | Al tocar `docs/entidades/*.puml` o regenerar la bóveda |
| `caso-de-uso` | Al escribir o cambiar un caso de uso |
| `restriccion` | Cuando una regla deba ser imposible de violar |
| `norma-nueva` | Cuando aparezca una resolución, circular o umbral nuevo |
| `semillas-catalogos` | Al cambiar un valor de catálogo en `seeders/` |

## Construcción

| Skill | Cuándo |
| --- | --- |
| `contratos-api` | Antes de implementar cualquier endpoint |
| `back-nestjs` | Al escribir el backend |
| `datos-kysely` | Al escribir consultas y repositorios |
| `dinero-decimal` | Cada vez que aparezca un importe |
| `trabajos-outbox` | Al disparar efectos fuera de la transacción |
| `errores-api` | Al devolver o traducir un error |
| `idempotencia-reintentos` | En todo endpoint con efecto y todo webhook |
| `seguridad-sesion-rls` | En toda consulta con políticas de fila |
| `pruebas-cu` | Al implementar cualquier caso de uso |

## Interfaz

| Skill | Cuándo |
| --- | --- |
| `disenar-frontend` | Al crear o modificar cualquier pantalla |
| `movil-expo` | Al trabajar en la app |
| `web-backoffice` | Al trabajar en el backoffice |

## Dominio

| Skill | Cuándo |
| --- | --- |
| `kyc-onboarding` | Alta, verificación, niveles, contrato de adhesión |
| `contabilidad-partida-doble` | Cualquier flujo que mueva dinero |
| `qr-pagos` | Cobro con QR, pasarelas y conciliación bancaria |
| `facturacion-sin` | Comisiones, tarifario, impuestos y factura |
| `gobernanza-grupo` | Ciclo del grupo, cupos, turnos y acuerdos |
| `sorteo-transparencia` | Sorteo verificable, cadena de bloques y reputación |
| `garantia-mora-cobranza` | Mora, fondo de garantía, sanciones y cobranza |
| `notificaciones-consentimiento` | Cualquier aviso al usuario |

## Cumplimiento y control

| Skill | Cuándo |
| --- | --- |
| `cumplimiento-uif` | Umbrales, debida diligencia, monitoreo y reportes de sospecha |
| `reportes-regulatorios` | Cualquier remisión periódica con plazo y acuse |
| `reclamos-consumidor` | Circuito de reclamos y transparencia de información |
| `observabilidad` | Rastro, indicadores, incidentes y eventos de riesgo |

## Reglas comunes a todas

1. **La bóveda manda.** Si el código y la especificación divergen, se corrige el
   código —o se corrige la bóveda primero, y en el mismo PR.
2. **Ninguna cifra regulatoria ni comercial en el código.** Van a catálogo, con
   vigencia y cita.
3. **Denegar por omisión.** Falta el límite, la licencia o la política: se rechaza.
4. **Nada se edita.** La corrección es un registro nuevo que compensa al anterior.
5. **La garantía vive en la base.** La aplicación valida para dar buen mensaje.
