---
tags:
  - arquitectura
titulo: "Estructura del repositorio"
fecha_revision: 2026-08-12
---

# Estructura del repositorio

> Dónde vive cada archivo, y por qué ahí. La estructura no es gusto: es la
> [[ADR-009 Composición atómica|composición atómica]] hecha carpetas, para que el
> lugar de un archivo nuevo sea obvio y su nivel, verificable.

## Monorepo

```
aportaya/
├── apps/
│   ├── api/            NestJS · el backend
│   ├── worker/          Graphile Worker · outbox y trabajos con fecha
│   ├── movil/           Expo · app del participante
│   └── backoffice/      React + Vite · cumplimiento, soporte, contabilidad
├── packages/
│   ├── contratos/       Zod por caso de uso + OpenAPI derivado
│   ├── dominio/         átomos compartidos: Dinero, Periodo, cálculos puros
│   ├── ui/              sistema de diseño: tokens, átomos y moléculas visuales
│   └── datos/           tipos introspectados de la base + fábrica de conexiones
├── sql/                 esquema generado (no se edita a mano)
├── docs/                la bóveda: especificación y arquitectura
└── scripts/             generadores en Python
```

Un solo repositorio porque el desempate que eligió el stack fue **compartir
contratos**: separarlos en repos distintos devuelve el problema que se quiso evitar.

## Dentro de `apps/api` — un módulo por módulo de la bóveda

```
apps/api/src/
├── comun/
│   ├── transaccion.ts          conTransaccion(): abre tx y fija SET LOCAL
│   ├── idempotencia.ts         valida la clave antes de escribir
│   └── errores.ts              códigos AP-CU<NN>-<nn>
└── modulos/
    └── 11_tarifas_comisiones/
        ├── tarifas.module.ts
        ├── aplicacion/                    ← ORGANISMOS
        │   ├── CU30CotizarComision.ts
        │   ├── CU31DevengarComision.ts
        │   └── CU33DevolverComision.ts
        ├── dominio/                       ← ÁTOMOS
        │   ├── CalculoDeComision.ts
        │   └── TarifarioCongelado.ts
        ├── infraestructura/               ← MOLÉCULAS
        │   ├── DevengoRepositorio.ts
        │   ├── TarifarioRepositorio.ts
        │   └── ServicioFiscalAdapter.ts
        ├── http/
        │   └── tarifas.controller.ts      ← PÁGINA: traduce HTTP ⇄ caso de uso
        └── pruebas/
            ├── CU31.spec.ts
            └── CalculoDeComision.spec.ts
```

| Carpeta | Nivel | Puede depender de | Nunca hace |
| --- | --- | --- | --- |
| `dominio/` | Átomo | Nada del sistema | IO, SQL, `Date.now()` sin inyectar |
| `infraestructura/` | Molécula | `dominio/`, `packages/datos` | Abrir transacción, orquestar otro caso |
| `aplicacion/` | Organismo | `dominio/`, `infraestructura/` | SQL directo, llamar proveedores externos |
| `http/` | Página | `aplicacion/`, `packages/contratos` | Contener reglas de negocio |

## Dentro de `apps/movil` y `apps/backoffice`

```
src/
├── atomos/          Boton, Campo, Monto, Etiqueta, Chip
├── moleculas/       CampoMonto, FilaAporte, SelectorDeGrupo, useAporte
├── organismos/      FormularioDeAporte, TablaDeAportes, ResumenDeBilletera
├── pantallas/       composición de organismos + ruta (sin lógica)
├── dominio/         cliente de API por caso de uso, tipado desde `contratos`
└── tokens/          único lugar con valores de color, espacio y tipografía
```

Los átomos y moléculas **visuales** que sirven a los dos productos suben a
`packages/ui`; los que dependen de una API nativa (cámara, biometría) se quedan en
`apps/movil`.

## Convención de nombres

| Cosa | Forma | Ejemplo |
| --- | --- | --- |
| Caso de uso | `CU<NN><VerboObjeto>.ts` | `CU21CobrarAporte.ts` |
| Prueba de caso de uso | `CU<NN>.spec.ts` | `CU21.spec.ts` |
| Contrato | `contratos/CU<NN>.ts` | `contratos/CU21.ts` |
| Repositorio | `<Sustantivo>Repositorio.ts` | `ObligacionRepositorio.ts` |
| Adaptador externo | `<Proveedor>Adapter.ts` | `PasarelaQrAdapter.ts` |
| Componente | `PascalCase.tsx`, uno por archivo | `FilaAporte.tsx` |
| Tabla de la bóveda | `snake_case` tal cual está en el modelo | `obligacion_aporte` |

El código `CU-NN` en el nombre no es decoración: es lo que hace que ir de la
especificación al código —y de una traza de producción al caso de uso— no requiera
ninguna herramienta.

## Qué no va en este repositorio

- **Migraciones escritas a mano.** El esquema sale de `scripts/generar_ddl.py`.
- **Secretos.** Variables de entorno con esquema validado al arrancar; el proceso no
  levanta si falta una.
- **Reglas regulatorias como constantes.** Umbrales, límites y tarifas son
  **catálogo sembrado** ([[Restricciones]], skill `norma-nueva`).
- **Utilidades genéricas sin dueño.** Un archivo `utils.ts` es un síntoma: cada
  función pertenece a un átomo con nombre.

## Ver también

[[ADR-009 Composición atómica]] · [[Flujo de una transacción]] · [[Método de arquitectura]] · [[_Arquitectura]]
