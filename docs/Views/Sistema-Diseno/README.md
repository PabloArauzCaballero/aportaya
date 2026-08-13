---
titulo: AportaYa — Sistema de Diseño (dividido)
tipo: sistema-diseno
proyecto: AportaYa
version: 2
fecha: 2026-08-12
tags: [diseno, design-system, atomic-design, frontend]
---

# AportaYa — Sistema de Diseño

Diseño atómico dividido por nivel. Cada nivel tiene su **página HTML** (visual, navegable en el navegador) y su **nota `.md`** (referencia en Obsidian). Todo comparte `estilos.css` y `script.js`.

## Niveles

| Nivel | Nota | Página visual |
|---|---|---|
| 0 · Fundamentos (tokens + hex) | [[Fundamentos]] | `Fundamentos/Fundamentos.html` |
| 1 · Átomos | [[Atomos]] | `Atomos/Atomos.html` |
| 2 · Moléculas | [[Moleculas]] | `Moleculas/Moleculas.html` |
| 3 · Organismos | [[Organismos]] | `Organismos/Organismos.html` |
| 3 · Móviles (app) | [[Moviles]] | `Moviles/Moviles.html` |

## Estructura de la carpeta

```
Sistema-Diseno/
├── README.md              ← este índice
├── estilos.css            ← tokens + estilos compartidos
├── script.js              ← interacciones compartidas
├── Fundamentos/  (Fundamentos.html + Fundamentos.md)
├── Atomos/       (Atomos.html + Atomos.md)
├── Moleculas/    (Moleculas.html + Moleculas.md)
├── Organismos/   (Organismos.html + Organismos.md)
└── Moviles/      (Moviles.html + Moviles.md)
```

## Regla de oro

> **Verde `#1C5A3A` = estructura. Naranja `#E5852B` = acción.** Un solo botón naranja por pantalla.

Reglas de uso e implementación: skill del repo `disenar-frontend` (`.claude/skills/disenar-frontend/SKILL.md`).
Relacionado: [[AportaYa-Identidad]] · [AportaYa-Logo-Evaluacion.html](../AportaYa-Logo-Evaluacion.html)
