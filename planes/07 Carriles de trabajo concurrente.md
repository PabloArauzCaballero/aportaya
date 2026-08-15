---
tags:
  - moc
  - plan
  - carriles
titulo: "Carriles de trabajo concurrente — varias máquinas en paralelo"
fecha: 2026-08-13
---

# Carriles de trabajo concurrente

> **Para qué es este documento.** Para repartir el backend entre **varias máquinas
> trabajando a la vez**, cada una con su chat, su clon del repositorio, su rama y su
> base de datos, de modo que **dos carriles nunca editen el mismo archivo**. El
> conflicto de merge no se resuelve: se hace imposible por diseño.

---

## 1 · Por qué esto se puede paralelizar

Porque **el esquema ya está completo**. Las 274 tablas existen desde el primer día
(`sql/aplicar.sql`), con sus claves, índices, restricciones y RLS.

Eso cambia todo: un carril **no espera** a que otro implemente su caso de uso para
poder trabajar. Inserta sus propios fixtures directamente en las tablas que necesita
y desarrolla contra ellas. La dependencia entre carriles no es de *datos* — es de
**código compartido**, y ese se congela en la Ola 0.

| Dependencia | ¿Bloquea? |
| --- | --- |
| «Necesito la tabla `usuario`» | **No.** Existe. Se siembra un fixture |
| «Necesito `conTransaccion` y `Dinero`» | **Sí.** Son de la Ola 0 |
| «Necesito invocar `registrarAsiento` de otro módulo» | **Sí.** Punto de sincronización entre olas |
| «Necesito que otro carril termine su endpoint» | **No.** Se prueba contra su contrato Zod |

---

## 2 · La regla de oro

```
un carril = un módulo = un directorio = una rama = una máquina = un chat
```

Un carril **posee en exclusiva** su directorio de módulo y los archivos de contrato de
sus casos de uso. Todo lo demás es **de solo lectura** para él.

> **Si un carril necesita editar un archivo que no posee, no lo edita: abre un
> micro-PR al troncal** (§6). Sin excepciones — la excepción es exactamente el
> conflicto que este diseño evita.

---

## 3 · Mapa de olas

Seis olas. Dentro de una ola, **todos los carriles corren a la vez**. Entre olas hay
un punto de sincronización: todos fusionan a **`dev`** y rebasan antes de seguir.
`dev → main` solo cuando la ola cierra entera y en verde (`git-flujo`).

### Ola 0 · Troncal — **una sola máquina, nadie más trabaja**

| Carril | Fases | Módulo | Directorio propio |
| --- | --- | --- | --- |
| **T** | 0, 1, 2 | — | **todo el repositorio** |

Construye el monorepo, `packages/dominio`, `packages/datos`, `apps/api/src/comun`,
`apps/worker`, el lint, el CI y Docker. **Bloquea las 17 fases restantes.** No se
abre ningún otro carril hasta que su gate esté ejecutado.

### Ola 1 · 4 carriles

| Carril | Fase | Módulo | Directorio propio | CU |
| --- | :-: | --- | --- | --- |
| **A** | 3 | 01 identidad | `modulos/01_identidad_usuarios/` | 01, 04, 05, 08, 09 |
| **B** | 5 | 03 contable | `modulos/03_contabilidad/` | 24 |
| **C** | 4 | 12 parcial + límites | `modulos/12_habilitacion/` | 02, 03, 06, 40, 46 |
| **D** | 12 | 05 notificaciones | `modulos/05_notificaciones/` | 80, 81, 82, 83 |

> **D arranca ya**, aunque las notificaciones parezcan «para el final»: solo consume
> eventos del outbox, que la Ola 0 ya dejó funcionando. Terminarlo temprano elimina
> los *stubs* de aviso de todos los carriles siguientes.

### Ola 2 · 5 carriles — máxima concurrencia

| Carril | Fase | Módulo | Directorio propio | CU |
| --- | :-: | --- | --- | --- |
| **A** | 6 | 10 billetera | `modulos/10_billetera_custodia/` | 10–17, 50, 57 |
| **B** | 7 | 11 tarifas | `modulos/11_tarifas_comisiones/` | 30–36 |
| **C** | 8 | 02 grupos | `modulos/02_grupos_turnos/` | 20, 59, 60, 62–65, 68, 69 |
| **D** | 15 | 09 auditoría | `modulos/09_auditoria_reportes/` | 07, 54, 55, 58, 98 |
| **E** | 14 | 07 organizador | `modulos/07_organizador_automatizacion/` | 90–93, 95, 96 |

### Ola 3 · 4 carriles

| Carril | Fase | Módulo | Directorio propio | CU |
| --- | :-: | --- | --- | --- |
| **A** | 9 | 03 aportes | `modulos/03_aportes_pagos_qr/` | 19, 21, 51, 99 |
| **B** | 13 | 06 transparencia | `modulos/06_transparencia_reputacion/` | 61, 70–76, 97 |
| **C** | 16 | 12 cumplimiento | `modulos/12_cumplimiento_asfi/` | 41–45, 47–49, 52, 53, 56, 94 |
| **D** | 10a | 04 entregas (parcial) | `modulos/04_entregas_fondo/` | 18 |

### Ola 4 · 2 carriles

| Carril | Fase | Módulo | Directorio propio | CU |
| --- | :-: | --- | --- | --- |
| **A** | 10b | 04 entregas | `modulos/04_entregas_fondo/` | 22, 28 |
| **B** | 11 | 08 garantía | `modulos/08_garantia_incumplimiento/` | 23, 25–27, 29, 66, 67 |

### Ola 5 · 1 carril — convergencia

| Carril | Fase | Alcance |
| --- | :-: | --- |
| **T** | 17 | E2E, rendimiento, resiliencia, restauración, seguridad, despliegue |

### Resumen

```
Ola 0 ──────────► 1 máquina    (troncal, bloqueante)
Ola 1 ──────────► 4 máquinas
Ola 2 ──────────► 5 máquinas   ← pico
Ola 3 ──────────► 4 máquinas
Ola 4 ──────────► 2 máquinas
Ola 5 ──────────► 1 máquina
```

Con **5 máquinas** se cubre el pico. Con menos, se corren menos carriles por ola en el
orden en que están listados (A primero).

---

## 4 · Propiedad de archivos

### Lo que un carril posee en exclusiva

| Ruta | Nota |
| --- | --- |
| `apps/api/src/modulos/<su-módulo>/**` | Todo: dominio, infraestructura, aplicación, http, trabajos, pruebas |
| `apps/worker/src/trabajos/<su-módulo>/**` | Sus handlers |
| `packages/contratos/src/CU<NN>.ts` | **Solo los CU de su carril** |
| `planes/informes/carril-<id>.md` | Su informe de progreso |
| `pruebas/fixtures/<su-módulo>/**` | Sus datos de prueba |

### Lo que ningún carril toca (solo lectura)

| Ruta | Quién la cambia |
| --- | --- |
| `sql/**`, `docs/**`, `scripts/**` | Nadie durante los carriles. Cambio de modelo = para todo y se hace en troncal |
| `packages/datos/src/entidades/**` | **Generado y congelado** al cerrar la Fase 1 |
| `packages/dominio/**` | Ola 0. Un átomo nuevo compartido = micro-PR |
| `apps/api/src/comun/**` | Ola 0. Cambio = micro-PR |
| `packages/eslint-config-aportaya/**` | Ola 0 |
| `docker/**`, `docker-compose*.yml`, `.github/**` | Ola 0 y Ola 5 |
| `package.json`, `yarn.lock`, `tsconfig.base.json` | Micro-PR |
| `seeders/*/manifiesto.json` | Micro-PR |

---

## 5 · Los siete puntos de conflicto, y cómo se eliminan

Estos son cambios **concretos al plan** que existen solo para hacer posible la
concurrencia. Se implementan en la **Ola 0**.

| # | Conflicto | Solución | Dónde |
| :-: | --- | --- | --- |
| 1 | `app.module.ts` lista cada módulo ⇒ **todos** los carriles lo editan | **Carga por glob**: `modulos/**/*.module.ts` se descubren solos. El archivo no vuelve a cambiar | Fase 2 |
| 2 | `packages/contratos/openapi.json` versionado ⇒ conflicto en **cada** PR | **No se versiona.** Se genera en CI, se publica como artefacto y se sirve en `/docs`. El gate deja de ser `git diff --exit-code` y pasa a ser «genera sin error y valida contra los ejemplos del CU» | Fase 2 |
| 3 | `contratos/src/index.ts` como barril | Sin barril: import directo `@aportaya/contratos/CU21` | Fase 2 |
| 4 | `planes/informe.md` lo escriben todos | **Uno por carril**: `planes/informes/carril-<id>.md`. El `informe.md` raíz solo agrega estado | ahora |
| 5 | `yarn.lock`: dos carriles agregan dependencias | **Todas las dependencias se instalan en la Ola 0.** Una nueva = micro-PR. Nunca `yarn add` en rama de carril | Fase 0 |
| 6 | `seeders/*/manifiesto.json` | Micro-PR. El archivo de semilla nuevo sí es propio del carril | — |
| 7 | Dos carriles necesitan el mismo átomo compartido | El que lo necesita primero abre micro-PR a `packages/dominio`; el segundo lo consume ya fusionado | §6 |

> **El punto 2 es el más importante.** Un `openapi.json` versionado con cinco carriles
> agregando contratos genera un conflicto por PR, siempre, y se «resuelve»
> regenerando — que es exactamente cómo se cuela una divergencia. Al derivarlo en CI,
> la divergencia deja de ser posible en vez de ser detectada.

---

## 6 · Micro-PR al troncal

Cuando un carril necesita algo compartido —un átomo en `packages/dominio`, una
utilidad en `comun/`, una dependencia, una línea en el manifiesto de semillas:

```
1  rama:  <usuario>/chore/troncal-<carril>-<que-agrega>
2  UN solo cambio, en archivos compartidos. Nada de su módulo
3  con su prueba unitaria
4  PR marcado [MICRO] hacia dev → revisión prioritaria, merge el mismo día
5  todos los carriles rebasan sobre dev
```

**Reglas del micro-PR**

- **No espera.** Mientras se revisa, el carril sigue con lo que no depende de eso.
- **Nunca** mezcla cambios de módulo con cambios compartidos: son dos PR.
- Si dos carriles piden el mismo átomo el mismo día, gana el primero y el segundo
  consume el suyo. **No se duplica el átomo** — un `calcularPlazoHabil` duplicado es
  la forma en que dos módulos empiezan a calcular plazos distintos.

---

## 7 · Puntos de sincronización entre olas

Al cerrar una ola, **antes** de abrir la siguiente:

- [ ] Todos los carriles de la ola fusionaron a **`dev`**
- [ ] `dev` pasa el CI completo (los 19 pasos)
- [ ] `dev` → `main` solo cuando la ola cierra entera y verde
- [ ] Cada carril ejecutó su gate de fase y lo registró en su informe
- [ ] Los micro-PR pendientes están fusionados
- [ ] Cada máquina hace `git pull` de `dev` y **no regenera nada**: entidades y esquema
      están congelados
- [ ] Se actualiza `planes/informe.md` con el estado consolidado

**Prueba de integración entre olas.** Al cerrar cada ola, una máquina corre la suite
completa contra `main` fusionado. Un carril verde en aislamiento y rojo integrado es
información valiosa: casi siempre es un átomo duplicado o un contrato mal asumido.

---

## 8 · Montar una máquina nueva

Cada máquina es **independiente**: su clon, su rama, su Docker, su Postgres. No hay
base compartida.

```bash
git clone <repo> && cd Pasanaku
git checkout -b <usuario>/feature/carril-<ola><id>-<modulo> origin/dev

yarn install --immutable          # sin yarn add: las deps ya están
docker compose up -d --wait       # su propio Postgres, en su propia máquina
yarn bd:reset                     # esquema + semillas mínimas + prueba

yarn lint && yarn typecheck && yarn test:unit && yarn test:integracion
```

Si algo de eso falla, **no es problema del carril**: es que `main` está roto y hay que
avisar antes de seguir.

Cada carril corre `test:unit`, `test:integracion` y `test:api`. **El `test:e2e`
completo corre solo en `main`** y en la Ola 5: levantar el compose entero en cada
máquina por cada commit no paga.

---

## 9 · Prompt de arranque de un carril

Para pegar en el chat de la máquina que toma el carril. Sustituir lo que está entre
`<>`:

```text
Sos el carril <ID> de la ola <N> del backend de AportaYa.

ANTES DE ESCRIBIR NADA, leé en este orden:
  planes/00b Estándar de ejecución · código limpio, pruebas y calidad.md   ← cómo se escribe
  planes/00 Plan maestro.md                                                 ← invariantes y stack
  planes/00c Recetario · implementar un caso de uso.md                      ← orden, firmas, nombres
  planes/07 Carriles de trabajo concurrente.md                              ← qué archivos podés tocar
  planes/<documento de tu fase>.md                                          ← tu alcance
  docs/CasosDeUso/CU-<NN> *.md  (todos los de tu carril, completos)

TU ALCANCE
  Fase:        <N>
  Módulo:      <NN_nombre>
  Casos de uso: <lista>
  Rama:        <usuario>/feature/carril-<ola><id>-<modulo>   (PR hacia dev)

POSEÉS EN EXCLUSIVA
  apps/api/src/modulos/<NN_nombre>/**
  apps/worker/src/trabajos/<NN_nombre>/**
  packages/contratos/src/CU<NN>.ts   (solo los tuyos)
  planes/informes/carril-<id>.md

NO TOCÁS (solo lectura)
  sql/  docs/  scripts/  packages/datos/  packages/dominio/  apps/api/src/comun/
  package.json  yarn.lock  docker/  .github/
  Si necesitás cambiar algo de ahí: micro-PR al troncal (§6). NO lo edites en tu rama.

REGLAS QUE NO SE NEGOCIAN
  - Regla cero: no inventar. La respuesta está en el CU, en Restricciones o en
    Cumplimiento. Si falta algo crítico, PARÁS Y PREGUNTÁS. Si no es crítico,
    declarás el supuesto en tu informe.
  - Antes de cada CU: declarar las piezas por nivel y responder por escrito las cinco
    preguntas de frontera transaccional.
  - Los diez invariantes del plan maestro.
  - Las seis pruebas obligatorias por caso de uso.
  - No declarás nada terminado sin haber ejecutado el comando.
  - Commits en español con prefijo (feat/fix/docs/chore/test/modelo), citando el CU:
      feat: CU-21 cobrar aporte con QR
    Nunca "fix: arreglos varios". Nunca commit directo a main ni a dev.
  - Tu PR trae el cambio COMPLETO: código + contrato + pruebas. Si tocás la bóveda,
    trae también lo regenerado. Un PR que deja la bóveda vieja crea dos verdades.

TERMINÁS CUANDO
  El gate de salida de tu fase está ejecutado, con evidencia en
  planes/informes/carril-<id>.md, y tu PR pasa el CI.

Empezá listando las piezas que vas a crear, por nivel, con el formato exacto de
  planes/00c Recetario · implementar un caso de uso.md §2 — y esperá mi visto bueno.
```

---

## 10 · Cuando dos carriles se pisan igual

Va a pasar. Qué hacer:

| Síntoma | Causa habitual | Qué se hace |
| --- | --- | --- |
| Conflicto en un archivo compartido | Alguien editó fuera de su propiedad | Se revierte, se abre micro-PR |
| Dos átomos con el mismo cálculo y nombres distintos | Ningún carril abrió micro-PR y ambos improvisaron | Se unifica en `packages/dominio` y se borran los dos; **prioridad alta**: dos implementaciones del mismo cálculo divergen |
| Un carril necesita un endpoint de otro que no existe | Dependencia no prevista | Se programa contra el **contrato Zod** del otro y se prueba con un doble. El contrato existe antes que la implementación |
| `dev` rojo tras fusionar una ola | Integración, no aislamiento | Se para la ola siguiente hasta arreglarlo |
| Un carril termina mucho antes | Estimación desigual | Toma un carril de la ola siguiente **solo si sus dependencias ya están en `dev`** |

---

## 11 · Lo que **no** se paraleliza, nunca

- **Un cambio de modelo** (`docs/entidades/*.puml`, `docs/Restricciones.md`, `sql/`).
  Para todo, se hace en troncal, se regenera, se verifica la bóveda, se fusiona, y
  recién ahí los carriles rebasan. Un cambio de esquema con cinco carriles activos
  desincroniza las entidades de las cinco máquinas a la vez.
- **La Ola 0.** Es el piso; si se parte, cada carril inventa su propio piso.
- **La Ola 5.** Rendimiento, resiliencia y despliegue se miden sobre el sistema
  entero, no por partes.

## Ver también

[[00 Plan maestro]] · [[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[00c Recetario · implementar un caso de uso]] · [[01 Fase 0 · Cimientos del repositorio]] · [[informe]]
