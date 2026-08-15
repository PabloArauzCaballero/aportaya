---
tags:
  - plan
  - informe
titulo: "Informe consolidado — AportaYa"
actualizado: 2026-08-13
---

# Informe consolidado — backend y frontend

> **Este archivo solo agrega estado.** El detalle de cada carril vive en
> `planes/informes/carril-<id>.md`, uno por máquina, para que cinco carriles
> concurrentes no se pisen ([[07 Carriles de trabajo concurrente]] §5).
> Se actualiza **al cerrar cada ola**, no en cada commit.

## Avance del backend

| Ola | Carriles | Fases | Estado | Cerrada el |
| :-: | :-: | --- | :-: | --- |
| **0** | T (troncal) | 0, 1, 2 | ⬜ pendiente | — |
| **1** | A · B · C · D | 3, 5, 4, 12 | ⬜ pendiente | — |
| **2** | A · B · C · D · E | 6, 7, 8, 15, 14 | ⬜ pendiente | — |
| **3** | A · B · C · D | 9, 13, 16, 10a | ⬜ pendiente | — |
| **4** | A · B | 10b, 11 | ⬜ pendiente | — |
| **5** | T | 17 | ⬜ pendiente | — |

Estados: ⬜ pendiente · 🟡 en curso · ✅ cerrada con gate ejecutado · 🔴 bloqueada

## Carriles

| Carril | Ola | Fase | Módulo | Máquina | Informe | Estado |
| :-: | :-: | :-: | --- | --- | --- | :-: |
| T | 0 | 0–2 | troncal | — | `informes/carril-T0.md` | ⬜ |
| A | 1 | 3 | 01 identidad | — | `informes/carril-1A.md` | ⬜ |
| B | 1 | 5 | 03 contable | — | `informes/carril-1B.md` | ⬜ |
| C | 1 | 4 | 12 habilitación | — | `informes/carril-1C.md` | ⬜ |
| D | 1 | 12 | 05 notificaciones | — | `informes/carril-1D.md` | ⬜ |
| A | 2 | 6 | 10 billetera | — | `informes/carril-2A.md` | ⬜ |
| B | 2 | 7 | 11 tarifas | — | `informes/carril-2B.md` | ⬜ |
| C | 2 | 8 | 02 grupos | — | `informes/carril-2C.md` | ⬜ |
| D | 2 | 15 | 09 auditoría | — | `informes/carril-2D.md` | ⬜ |
| E | 2 | 14 | 07 organizador | — | `informes/carril-2E.md` | ⬜ |
| A | 3 | 9 | 03 aportes | — | `informes/carril-3A.md` | ⬜ |
| B | 3 | 13 | 06 transparencia | — | `informes/carril-3B.md` | ⬜ |
| C | 3 | 16 | 12 cumplimiento | — | `informes/carril-3C.md` | ⬜ |
| D | 3 | 10a | 04 entregas (CU-18) | — | `informes/carril-3D.md` | ⬜ |
| A | 4 | 10b | 04 entregas | — | `informes/carril-4A.md` | ⬜ |
| B | 4 | 11 | 08 garantía | — | `informes/carril-4B.md` | ⬜ |
| T | 5 | 17 | convergencia | — | `informes/carril-T5.md` | ⬜ |

Cada carril arranca copiando `informes/_plantilla.md`.

## Avance del frontend

| Ola | Carriles | Fases | Estado | Cerrada el |
| :-: | :-: | --- | :-: | --- |
| **F0** | T (troncal) | F0, F1 | ⬜ pendiente | — |
| **F1** | M · B · W | F2, F6, F9 | ⬜ pendiente | — |
| **F2** | M1 · M2 · B1 · W1 · W2 | F3, F4, F7, F10, F11 | ⬜ pendiente | — |
| **F3** | M3 · B2 | F5, F8 | ⬜ pendiente | — |
| **F4** | T | F12 | ⬜ pendiente | — |

| Carril | Ola | Fase | Producto | Máquina | Informe | Estado |
| :-: | :-: | :-: | --- | --- | --- | :-: |
| T | F0 | F0–F1 | sistema de diseño | — | `informes/carril-TF0.md` | ⬜ |
| M | F1 | F2 | shell móvil | — | `informes/carril-F1M.md` | ⬜ |
| B | F1 | F6 | shell backoffice | — | `informes/carril-F1B.md` | ⬜ |
| W | F1 | F9 | sitio público | — | `informes/carril-F1W.md` | ⬜ |
| M1 | F2 | F3 | móvil · identidad | — | `informes/carril-F2M1.md` | ⬜ |
| M2 | F2 | F4 | móvil · billetera | — | `informes/carril-F2M2.md` | ⬜ |
| B1 | F2 | F7 | backoffice · operación | — | `informes/carril-F2B1.md` | ⬜ |
| W1 | F2 | F10 | **SEO** | — | `informes/carril-F2W1.md` | ⬜ |
| W2 | F2 | F11 | **GEO** | — | `informes/carril-F2W2.md` | ⬜ |
| M3 | F3 | F5 | móvil · pasanaku | — | `informes/carril-F3M3.md` | ⬜ |
| B2 | F3 | F8 | backoffice · cumplimiento | — | `informes/carril-F3B2.md` | ⬜ |
| T | F4 | F12 | publicación | — | `informes/carril-TF4.md` | ⬜ |

Las olas de frontend van **una detrás** de las de backend: consumen el **contrato**
Zod, no la implementación ([[16 Carriles de frontend]] §3).

## Casos de uso

**0 de 87 implementados.** Un CU cuenta como implementado cuando todos sus criterios
de aceptación tienen su `it()` con el mismo nombre y todas sus restricciones citadas
tienen prueba de rechazo.

## Hitos

| Hito | Ola | Estado |
| --- | :-: | :-: |
| El pipeline transversal funciona (las diez pruebas de `CU-00`) | 0 | ⬜ |
| **Validación del stack: CU-31 de punta a punta** | 2 | ⬜ |
| El pasanaku funciona (`pasanaku-completo.e2e.spec.ts`) | 4 | ⬜ |
| Los 87 casos de uso implementados | 4 | ⬜ |
| Autorizado a desplegar (backend) | 5 | ⬜ |
| Sistema de diseño congelado | F0 | ⬜ |
| **Primera medición GEO en los cuatro motores** | F2 | ⬜ |
| App aprobada en ambas tiendas | F4 | ⬜ |
| Sitio público en línea, indexado y citable | F4 | ⬜ |

## Sincronización entre olas

Se registra acá el cierre de cada ola: quién fusionó, si `main` quedó verde y qué
apareció al integrar (§7 de [[07 Carriles de trabajo concurrente]]).

| Ola | `main` verde | Integración | Notas |
| :-: | :-: | --- | --- |

## Micro-PR al troncal

| Rama | Carril | Qué agrega | Estado |
| --- | :-: | --- | :-: |

## Riesgos abiertos

Los diez del §11 del [[00 Plan maestro]] siguen abiertos: ninguna ola se ejecutó
todavía. Se actualiza al cerrar cada ola, con el riesgo que se cerró y el que apareció.

## Decisiones tomadas durante la ejecución

Vacío. Toda decisión cara de revertir se registra como ADR en `docs/Arquitectura/` y
se enlaza acá con una línea.

## Desviaciones respecto del plan

Vacío. Qué se hizo distinto, por qué, y si el plan se corrige o la desviación es
puntual.

## Ver también

[[00 Plan maestro]] · [[00b Estándar de ejecución · código limpio, pruebas y calidad]] · [[07 Carriles de trabajo concurrente]] · [[01 Fase 0 · Cimientos del repositorio]] · [[02 Fases 1 y 2 · Capa de datos y núcleo transversal]] · [[03 Fases 3 a 7 · Identidad, habilitación y núcleo de dinero]] · [[04 Fases 8 a 11 · Circuito del pasanaku]] · [[05 Fases 12 a 16 · Plataforma, reputación y cumplimiento]] · [[06 Fase 17 · Endurecimiento, E2E y despliegue]] · [[10 Plan maestro del frontend]] · [[16 Carriles de frontend]] · [[14 Fases F9 a F11 · Sitio público, SEO y GEO]]
