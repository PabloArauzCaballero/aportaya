---
name: disenar-frontend
description: >
  Diseñar y construir el frontend de AportaYa (billetera de pasanaku digital) con un
  sistema de diseño atómico completo para WEB y MÓVIL. Úsala siempre que haya que crear
  o modificar pantallas, formularios, tablas, filtros, controles, componentes móviles
  (tab bar, bottom sheet, teclado numérico, PIN/OTP) o cualquier pieza de UI. Define
  todos los tokens de marca con sus códigos hex, el inventario de átomos/moléculas/
  organismos y las reglas de uso.
metadata:
  tipo: skill
  proyecto: AportaYa
  version: 2
---

# Diseñar el frontend de AportaYa

Sistema de diseño atómico para la app **móvil** y la **web** de AportaYa. Esta skill es la **base**: al construir cualquier frontend, leela primero y no inventes colores, espaciados ni patrones — ya están definidos acá y en los archivos canónicos de abajo.

## Punto de partida para la IA (leer en este orden)

| # | Archivo canónico | Qué es |
|---|---|---|
| 1 | `apps/movil/src/tokens/tokens.ts` | **Tokens** (color/espacio/tipografía/tema). Copiá de acá; jamás un hex suelto. |
| 2 | `apps/movil/src/atomos/*` | **Átomos de referencia** ya implementados (Boton, Campo, Monto, ChipEstado, TecladoNumerico, Avatar). Imitá su forma para piezas nuevas. |
| 3 | `apps/movil/src/moleculas/*` y `organismos/*` y `pantallas/*` | **Ejemplo vertical completo** (CampoMonto, FilaAporte, TarjetaSaldo → FormularioAporte → PantallaInicio). El patrón de composición a seguir. |
| 4 | `docs/Views/Sistema-Diseno/` | **Catálogo visual** por nivel (HTML navegable + notas .md) con todos los hex. |

### Flujo de trabajo (siempre)
1. **Declará la descomposición** (átomos/moléculas/organismos) ANTES de escribir — ver skill `arquitectura-atomica`.
2. **Reusá** tokens y átomos existentes. No dupliques hasta el 3er uso.
3. **Un archivo = una pieza**, nombre = pieza, < 150 líneas.
4. Consumí color/espacio vía `usarTema()`/`espacio`/`radio`; **cero literales**.
5. Dinero: usá el átomo `Monto` (nunca recalcules importes en el cliente).
6. Pasá el **checklist** (sección 6) antes de cerrar.

> La web (backoffice/React) usa los MISMOS tokens y nombres; portá el CSS de `docs/Views/Sistema-Diseno/estilos.css` o los valores de `tokens.ts`.

## Principio rector

> **Verde = estructura. Naranja = acción.** El naranja (`--accent #E5852B`) se reserva para el **único** llamado a la acción principal de cada pantalla. Nunca dos naranjas compitiendo. El verde sostiene layout, encabezados y confianza.

Personalidad: **cercana al hablar, impecable con el dinero.**

---

## 0 · Tokens con códigos hex (nunca uses hex sueltos en un componente)

### Verde Pasanaku (primario)
| Token | Hex | Uso |
|---|---|---|
| `--g900` | `#0C2C1D` | Fondos muy oscuros |
| `--g800` | `#123A26` | Texto de marca / `--brand-ink` |
| `--g700` | `#164A30` | Superficies oscuras, texto sobre claro |
| `--g600` | `#1C5A3A` | **Base del logo / `--brand`** |
| `--g500` | `#237349` | Botón secundario, acentos |
| `--g400` | `#3C9366` | Verde de dark mode |
| `--g300` | `#7CBE9C` | Halo de foco, ilustración |
| `--g200` | `#BCDFCC` | Bordes suaves |
| `--g100` | `#E7F2EB` | Fondos tenues |

### Naranja Aporte (acción — uno por pantalla)
| Token | Hex | Uso |
|---|---|---|
| `--o700` | `#BC6217` | Hover de acción |
| `--o600` | `#D6741C` | — |
| `--o500` | `#E5852B` | **`--accent` / CTA principal** |
| `--o400` | `#EF9E4E` | Acento en dark mode |
| `--o300` | `#F6BE85` | Progreso suave |
| `--o200` | `#FBDBB8` | Fondos de aviso |
| `--o100` | `#FDF0DF` | Fondos tenues |
| `--accent-ink` | `#3A1E02` | Texto sobre naranja |

### Neutros (sesgo verde)
| Token | Hex | Uso |
|---|---|---|
| `--ink` / `--text` | `#10231A` | Texto principal |
| `--slate` / `--text-2` | `#38473F` | Texto secundario |
| `--muted` / `--text-3` | `#6C7B72` | Texto sutil, placeholder |
| `--line` / `--border` | `#DCE4DE` | Bordes |
| `--field-border` | `#C9D4CD` | Borde de campos |
| `--cloud` / `--surface-2` | `#F3F6F2` | Fondos secundarios |
| `--crema` / `--bg` | `#F6F4EC` | Fondo de app |
| `--surface` | `#FFFFFF` | Superficies/tarjetas |

### Semánticos (separados del acento; solo estados)
| Token | Hex | Fondo tenue | Uso |
|---|---|---|---|
| `--ok` | `#1F9D57` | `#E7F5EC` | Éxito, al día, switch activo |
| `--warn` | `#F0B429` | `#FEF4DA` | Aviso, turno por vencer |
| `--err` | `#D64545` | `#FBECEC` | Error, atrasado, destructivo |
| `--info` | `#2E7FB8` | `#E7F1F8` | Información neutra |

### Dark mode (redefinir SOLO tokens)
`--brand #3C9366` · `--accent #EF9E4E` · `--text #EAF3ED` · `--text-2 #B7CCC0` · `--text-3 #89998E` · `--bg #0A1F15` · `--surface #0F2B1D` · `--surface-2 #0C2418` · `--border #1C3A2A` · `--field #0C2418` · `--field-border #2A4A38`.

### Escalas de sistema
- **Espaciado** (múltiplos de 4): `--s1 4` · `--s2 8` · `--s3 12` · `--s4 16` · `--s5 24` · `--s6 32` · `--s7 48`.
- **Radio**: `--r-sm 8` (chips pequeños) · `--r-md 12` (campos/botones) · `--r-lg 16` (tarjetas) · `--r-xl 24` (bottom sheet/móvil) · `--r-pill 999`.
- **Sombra**: `--sh-1 0 1px 2px rgba(16,35,26,.06)` · `--sh-2 0 4px 16px rgba(16,35,26,.08)` · `--sh-3 0 18px 44px rgba(16,35,26,.16)`.
- **Tipografía**: `--font-d "Poppins"` (display/cifras) · `--font-b "Inter"` (cuerpo/UI) · `--mono` para hex/código.
- **Dinero**: `font-variant-numeric:tabular-nums`, prefijo `Bs`, decimales con coma → `Bs 1.240,00`.
- **Táctil (móvil)**: área mínima de toque **44×44 px**.

---

## 1 · Átomos

Botones: **primario** (`--accent`), **secundario** (`--brand`), **fantasma** (borde + texto `--brand`), **peligro** (`--err`), **enlace**, **ícono** (cuadrado 40px), **FAB** (flotante 56px, móvil). Tamaños sm/base/lg. Estados: normal, hover, active, foco (`outline 3px --g300`), **deshabilitado** (opacity .5), **cargando** (spinner).

Campos: texto, con ícono, con addon (`Bs`), **monto**, **búsqueda**, textarea, select, date, **stepper numérico** (− valor +), **contraseña con ojo**, **PIN/OTP** (celdas separadas). Estados: normal, foco (borde `--brand` + halo), **error** (borde `--err`), **éxito** (borde `--ok`), deshabilitado.

Selección: checkbox, radio, **switch** (activo `--ok`), control segmentado, chip de elección.

Indicadores: **badge** (ok/warn/err/info/neutral, con punto), **chip/tag** removible, **avatar** (sizes 24/30/40/56, grupo apilado), **spinner**, **barra de progreso**, **anillo de progreso** (SVG), **skeleton** (carga), **tooltip**, **dot** de notificación.

## 2 · Moléculas

Campo de formulario (label+input+ayuda/error), **búsqueda**, **menú desplegable**, **selector de fecha**, **input de monto con moneda**, grupo de filtros (chips), **tarjeta KPI/stat**, **tarjeta de saldo**, **ítem de lista/pasanaku** (avatar+info+progreso+badge), **fila de movimiento** (ícono±monto), alerta/banner, **toast/snackbar**, tabs, **breadcrumb**, **paginación**, **acordeón**, **stepper/wizard** (pasos), **ítem de notificación**, **fila de acciones rápidas** (Recargar/Retirar/Enviar).

## 3 · Organismos

Navbar web, **sidebar**, **formulario completo**, **tabla de datos** (toolbar con búsqueda+filtros, orden por columna, **selección múltiple**, paginación), barra de filtros, **modal**, **diálogo de confirmación**, **estado vacío**, **grilla de tarjetas**, **lista de movimientos agrupada por fecha**.

## 4 · Móviles (obligatorio para la app)

- **Marco de teléfono** con status bar (hora, batería).
- **App bar superior**: título centrado + volver (‹) + acción.
- **Tab bar inferior**: 3–5 destinos con ícono + label; activo en `--brand`; ítem central puede ser botón de acción.
- **FAB**: acción principal flotante (56px, `--accent`).
- **Bottom sheet / action sheet**: panel inferior con `--r-xl` arriba, handle, opciones.
- **Teclado numérico**: grilla 3×4 para montos y PIN.
- **Entrada de PIN/OTP**: 4–6 celdas para seguridad de billetera.
- **Snackbar**: mensaje inferior efímero.
- **Tarjeta de saldo móvil**: encabezado verde con saldo + Recargar (naranja) / Retirar (fantasma).
- **Onboarding**: slides con símbolo, título, texto, paginación por puntos.
- **Estados obligatorios** (toda vista con datos remotos): `Cargando`, `EstadoVacio`, `EstadoError` (con `sinConexion`). Nunca dejes una pantalla sin su estado de carga/vacío/error.
- **Tema**: envolvé con `ProveedorTema` (override manual + sistema); consumí siempre con `usarTema()`.
- **Pantallas de referencia**: Home billetera, Detalle de pasanaku, Recargar/Retirar, Movimientos, Crear pasanaku.

## 5 · Voz en la UI
- ✅ "Listo, tu aporte de Bs 250 quedó guardado." ❌ "Transacción procesada exitosamente."
- ✅ "Te toca en 2 turnos. Te avisamos." Botones dicen la acción exacta ("Confirmar aporte de Bs 250").

## 6 · Checklist antes de cerrar una pantalla
- [ ] Un solo botón naranja (acción principal); el resto verde/fantasma.
- [ ] Todo color desde un token con su hex; cero hex sueltos.
- [ ] Espaciados múltiplos de 4; áreas táctiles ≥ 44px en móvil.
- [ ] Dinero con `tabular-nums`, formato `Bs 1.240,00`.
- [ ] Estados de campo: normal, foco, error, éxito, deshabilitado.
- [ ] Foco de teclado visible; contraste AA (≥ 4.5:1).
- [ ] Tema claro y oscuro probados con `data-theme`.
- [ ] Tablas en `overflow-x:auto`; sin scroll lateral del body.
- [ ] `prefers-reduced-motion` respetado.
- [ ] Copy en voz de marca y vocabulario del `glosario-dominio` (grupo/cupo/turno/período/aporte/entrega).
- [ ] Estados cubiertos: cargando / vacío / error / sin conexión.
- [ ] Prueba unitaria de todo átomo con aritmética (ej: `dominio/dinero.spec.ts`).

## Cómo usar
1. Abrí el HTML de referencia para ver cada componente renderizado y copiar marcado/CSS.
2. Pegá los tokens (sección 0) una sola vez.
3. Construí de abajo hacia arriba: átomos → moléculas → organismos → pantalla (web o móvil).
4. Pasá el checklist (sección 6).
