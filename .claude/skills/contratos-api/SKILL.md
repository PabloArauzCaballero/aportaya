---
name: contratos-api
description: "Escribir el contrato de un caso de uso de AportaYa con Zod en packages/contratos, con sus códigos de error, idempotencia y OpenAPI derivado. Úsala antes de implementar cualquier endpoint, al cambiar una entrada o salida de la API, o cuando el cliente y el servidor no coinciden. El contrato se escribe antes que la implementación."
---

# Escribir el contrato de un caso de uso

Un contrato por caso de uso, en `packages/contratos/CU<NN>.ts`, consumido por la API,
la app y el backoffice ([[ADR-006 Contratos y validación]]). **Se escribe antes que la
implementación**: cierra preguntas que si no aparecen a mitad del código.

## Anatomía

```ts
// packages/contratos/CU21.ts — Cobrar el aporte del período
import { z } from 'zod'
import { MontoSchema, MonedaSchema } from './comun'

export const EntradaCU21 = z.object({
  claveIdempotencia: z.string().uuid(),
  obligacionId:      z.string().uuid(),
  monto:             MontoSchema,      // string "150.00"
  moneda:            MonedaSchema,     // 'BOB'
  medio:             z.enum(['qr', 'saldo']),
}).strict()                            // un campo de más es error, no algo que se ignora

export const SalidaCU21 = z.object({
  pagoId:      z.string().uuid(),
  estado:      z.enum(['confirmado', 'pendiente_conciliacion']),
  saldoDespues: MontoSchema,
}).strict()

export const ErroresCU21 = {
  OBLIGACION_NO_VIGENTE:  'AP-CU21-01',
  MONTO_NO_COINCIDE:      'AP-CU21-02',
  SALDO_INSUFICIENTE:     'AP-CU21-03',
  LIMITE_EXCEDIDO:        'AP-CU21-04',   // respaldado por R-LIM-02
} as const

export type EntradaCU21 = z.infer<typeof EntradaCU21>
export type SalidaCU21  = z.infer<typeof SalidaCU21>
```

## Reglas

| Regla | Por qué |
| --- | --- |
| **Un archivo por caso de uso**, con su código en el nombre | Trazabilidad especificación → contrato → código sin herramientas |
| **`.strict()` siempre** | Lo desconocido se rechaza; un campo de más suele ser un cliente desactualizado |
| **Los tipos se infieren** (`z.infer`) | Declararlos aparte crea dos verdades |
| **Toda operación con efecto lleva `claveIdempotencia`** | Se valida antes de escribir; el reintento devuelve la misma respuesta |
| **Los importes son *string*** con formato | `dinero-decimal`; jamás `z.number()` para dinero |
| **Errores con código, no solo texto** | `AP-CU<NN>-<nn>`, mapeados a los criterios del caso de uso |
| **Toda regla que proteja dinero cita su restricción** | Si no existe `R-XXX-nn`, la garantía está en el lugar equivocado |
| **Fechas en ISO-8601 con zona** | El modelo usa `TIMESTAMPTZ`; nada de fechas sin zona |

## Qué NO va en el contrato

- Reglas que solo el servidor puede evaluar con datos que el cliente no tiene
  (límites acumulados, estado de KYC, encaje). El cliente pregunta; no adivina.
- Umbrales regulatorios como constantes: vienen del catálogo, con vigencia.
- Lógica de presentación: el contrato define datos, no cómo se muestran.

## Errores: cómo se responden

| Situación | HTTP | Cuerpo |
| --- | --- | --- |
| Entrada inválida por esquema | `400` | Lista de campos con mensaje |
| Regla de negocio de aplicación | `422` | `{ codigo: 'AP-CU21-02', mensaje }` |
| Sin permiso o fuera de política de fila | `403` o resultado vacío | Sin detalles internos |
| Restricción de la base rechaza | `409` | `{ codigo: 'R-LIM-02', mensaje }` traducido |
| Clave de idempotencia repetida | `200` | La respuesta original, íntegra |
| Proveedor externo indisponible | `202` | Aceptado, se completa por la cola |

El mensaje al usuario **nunca** contiene SQL, nombres de tabla ni trazas.

## Versionado

- Ruta versionada: `/api/v1/...`.
- Los cambios **aditivos** (campo opcional nuevo) no rompen y no cambian versión.
- Un cambio incompatible se hace en dos pasos: la API acepta ambas formas, los
  clientes migran, después se retira la vieja. Nunca en un solo despliegue.
- El OpenAPI se **genera** desde los esquemas en el CI; si difiere del publicado, el
  build falla.

## Cómo lo consume cada lado

| Artefacto | Uso |
| --- | --- |
| `apps/api` | Valida en el controlador **antes** de tocar el caso de uso |
| `apps/movil` / `apps/backoffice` | Construye el formulario y valida para dar buen mensaje |
| Pruebas | Generan entradas válidas e inválidas desde el mismo esquema |

Recordá el límite: la validación del contrato **da buen mensaje**; la garantía real
está en [[Restricciones]]. Un contrato nunca reemplaza una restricción.

## Antes de dar por terminado

- [ ] Existe `CU<NN>.ts` con entrada, salida y errores.
- [ ] Todos los criterios de aceptación del caso de uso tienen su código de error.
- [ ] Toda regla del contrato que proteja dinero cita su `R-XXX-nn`.
- [ ] La operación con efecto exige clave de idempotencia.
- [ ] El OpenAPI generado está al día.

## Ver también

`errores-api` · `idempotencia-reintentos` · `caso-de-uso` · `back-nestjs` · `dinero-decimal` · `pruebas-cu` ·
`docs/Arquitectura/ADR-006 Contratos y validación.md`
