---
tags:
  - moc
  - arquitectura
  - prompts
titulo: "Prompts generalistas de desarrollo"
fecha_revision: 2026-08-12
---

# Prompts generalistas

> Tres prompts **reutilizables en cualquier proyecto**, no solo en este. Codifican el
> [[Método de arquitectura]] y una sola regla estructural que los atraviesa:
> **todo se divide siempre en átomos, moléculas y organismos**, en el frontend y en
> el backend.

## Cómo se usan

```
1. Prompt general de desarrollo   ← siempre, primero. Nunca se omite
2. Prompt de backend  ó  Prompt de frontend   ← especializa
3. Contexto del proyecto (en Pasanaku: la bóveda docs/ y .claude/skills/)
```

El general manda. El especializado **añade**; si alguna vez contradice al general,
gana el general.

| Prompt | Cuándo | Qué garantiza |
| --- | --- | --- |
| [[Prompt general de desarrollo]] | Siempre | Temperatura 0, KISS, composición atómica, nombres, errores, pruebas, seguridad |
| [[Prompt de backend]] | API, workers, datos | Frontera transaccional, garantías en la base, idempotencia, bordes externos |
| [[Prompt de frontend]] | App y web | Átomos visuales, tokens, estados obligatorios, dominio separado de la vista |

## Por qué existen

Un asistente sin restricciones produce el mismo código que un equipo sin
arquitectura: funciona en la demostración y se vuelve inmantenible en el tercer mes.
Estos prompts trasladan al asistente las tres decisiones que más se rompen cuando
nadie las escribe: **no inventar**, **no mezclar niveles** y **no poner la garantía
en el lugar equivocado**.

## Ver también

[[Método de arquitectura]] · [[ADR-009 Composición atómica]] · [[_Arquitectura]]
