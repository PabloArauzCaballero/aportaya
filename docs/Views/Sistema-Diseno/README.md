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

## Texto: usar los roles `-texto`, no el tono de marca directo

Cuatro tonos de marca no llegan a AA (4.5:1) cuando se usan como **texto chico** sobre su
fondo habitual — se midió renderizando el DOM real, no a ojo:

| Tono de marca | Uso que falla | Da | Necesita |
|---|---|---|---|
| `--accent` (`#E5852B`) | texto sobre `--crema` (eyebrow, etiquetas) | 2.47:1 | 4.5:1 |
| `--muted` (`#6C7B72`) | texto sobre `--crema` (texto sutil) | 4.05:1 | 4.5:1 |
| `--ok` (`#1F9D57`) | texto sobre `--okbg` (badge, monto positivo) | 3.10:1 | 4.5:1 |
| `--brand` oscuro (`#3C9366`) | texto sobre `--surface` en tema oscuro | 4.02:1 | 4.5:1 |

`estilos.css` ya define los roles derivados que sí pasan, con el mismo matiz: `--text-3`,
`--brand-texto`, `--accent-texto`, `--ok-texto`, `--aviso-texto`, `--err-texto`,
`--info-texto`. **Para texto usá siempre el rol `-texto` (o `--text-3`), nunca `--brand`,
`--accent`, `--ok`, `--warn`/`--o700`, `--err` ni `--info` directo.** Esos tonos de marca
siguen siendo correctos para superficies, iconos, bordes y el logotipo, donde el requisito
es 3:1 o no aplica — el logotipo está exento de contraste por norma WCAG.

Componentes ya migrados en `estilos.css`: `.eyebrow`, `.badge`, `.help`, `.listitem .amt`,
`.txrow .tic/.ta`, `.stat .delta`, `.tabs button.on`, `.segmented button.on`, `.btn-ghost`,
`.btn-link`, `.tabbar a.on`, `footer a`, `.req`, `.lvl.*`, `.keypad button.act`,
`.sheet .opt` (color de acción destructiva). Si agregás un componente nuevo con texto de
marca o de estado, usá el rol `-texto` desde el principio.

Excepción de `.lvl.mol`: usa un color de texto **fijo** (`#A65B14`), no `--accent-texto`.
Su fondo (`--o100`) es un tono de escala crudo que no cambia con el tema, a diferencia de
`--infobg`/`--warnbg` que sí — pairearlo con un rol `-texto` (pensado para adaptarse al
tema) daba 1.93:1 en oscuro. Cuando un componente tiene fondo fijo, su texto también debe
ser fijo.

## `--brand` no sostiene texto blanco: usá `--verde-solido`

`--brand` se aclara en tema oscuro (`#3C9366`) para poder servir como **texto** legible
sobre superficies oscuras — es justamente el propósito de `--brand-texto`. Pero eso mismo
lo vuelve poco fiable como **fondo sólido con texto blanco encima**: `.btn-secondary`,
`.navbar`, `.pager button.on` y `.stepwiz .st.now .num` usaban `background:var(--brand)`
y en oscuro caían a 3.59:1.

`--verde-solido` (`#1C5A3A`) + `--sobre-verde-solido` (`#F4FBF6`) son un par **fijo**, igual
en los dos temas, para esos casos: botones de relleno sólido, círculos de paso activo,
paginador. Ya migrados en `estilos.css`. Si un componente nuevo pinta un fondo verde sólido
con texto claro encima, usá este par — no `--brand` + blanco.

## `<!doctype html>` es obligatorio

Las 5 páginas de este sistema (y las páginas raíz `AportaYa-*.html`) no tenían doctype y
renderizaban en **quirks mode**. La consecuencia no es cosmética: en quirks mode, `<table>`
no hereda `color` de sus ancestros en Chrome/Blink, así que toda tabla con tema oscuro
mostraba el texto en el tono de tema **claro** — prácticamente invisible sobre fondo oscuro
(1.08:1 medido). Ya corregido con `<!doctype html>` al principio de cada archivo. Cualquier
página HTML nueva del sistema tiene que empezar con esa línea.
