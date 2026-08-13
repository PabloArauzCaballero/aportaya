---
titulo: AportaYa — Modelo de Identidad de Marca
tipo: identidad-visual
proyecto: AportaYa
version: 1
estado: borrador
fecha: 2026-08-12
tags: [marca, identidad, branding, pasanaku, billetera]
---

# AportaYa — Modelo de Identidad de Marca

> [!info] Vista interactiva
> La versión visual navegable está en [AportaYa-Identidad.html](AportaYa-Identidad.html) (abrir con un lector de HTML o en el navegador).
> Publicada además en: https://claude.ai/code/artifact/238ca073-7c7b-48b1-a3d0-7d5a528753b9

**AportaYa** es una billetera móvil que digitaliza el **pasanaku** boliviano: ahorro rotativo comunitario, gestionado con la calidez de la comunidad y el rigor de una fintech. La persona puede **recargar y retirar dinero en cualquier momento**.

---

## 01 · Esencia de marca

| Dimensión | Definición |
|---|---|
| **Propósito** | Que cualquier persona pueda ahorrar y recibir su turno sin desconfianza, sin cuadernos perdidos y sin depender de que alguien "guarde la plata". |
| **Arquetipo** | El **Cuidador confiable** — cercano al hablar, impecable al manejar la plata. |
| **Promesa** | Recargá y retirá cuando quieras. Tu dinero es tuyo y está disponible. |
| **Posicionamiento** | El cruce entre la calidez de la comunidad y el rigor de una fintech. |

### Valores
1. **Confianza visible** — todo movimiento se ve, se comprueba y se explica. La transparencia es la función, no el eslogan.
2. **Reciprocidad (Ayni)** — el grupo sostiene a cada uno por turnos. Diseñamos para el "nosotros".
3. **Simplicidad** — si tu abuela no lo entiende, lo rehacemos. Menos pasos, palabras claras.
4. **Disponibilidad** — tu plata, a tu alcance. Recargar y retirar es un derecho, no un favor.

---

## 02 · El símbolo

El isotipo representa **tres aportes que convergen**:

- **Líneas que suben y se unen** → cada persona aporta desde su lado; el fondo común se junta en un mismo vértice. La mecánica del pasanaku hecha forma.
- **El núcleo naranja** → el aporte activo, el "Ya": el dinero que se mueve y sostiene al grupo.
- **La apacheta / la "A"** → la estructura andina que se arma piedra sobre piedra, y la inicial de **AportaYa**.

> El SVG del símbolo (interpretación vectorial) está incluido dentro de [AportaYa-Identidad.html](AportaYa-Identidad.html). El archivo original del diseñador es la fuente oficial.

---

## 03 · Paleta de color

> Regla de oro: **Verde = estructura. Naranja = acción.** El naranja se reserva solo para el llamado a la acción que la persona debe tocar. Nunca dos naranjas compitiendo en pantalla.

### Verde Pasanaku — primario (confianza, estabilidad, crecimiento)
| Tono | Hex | Uso |
|---|---|---|
| 900 | `#0C2C1D` | Fondos muy oscuros |
| 800 | `#123A26` | Texto de marca |
| 700 | `#164A30` | Superficies oscuras |
| **600** | **`#1C5A3A`** | **Base del logo / color principal** |
| 500 | `#237349` | Botones, acentos verdes |
| 400 | `#3C9366` | Verde claro / dark mode |
| 300 | `#7CBE9C` | Ilustración |
| 200 | `#BCDFCC` | Bordes suaves |
| 100 | `#E7F2EB` | Fondos tenues |

### Naranja Aporte — acción (energía, inmediatez, el "Ya")
| Tono | Hex | Uso |
|---|---|---|
| 900 | `#7A3D08` | Texto sobre naranja claro |
| 700 | `#BC6217` | Hover de acción |
| 600 | `#D6741C` | — |
| **500** | **`#E5852B`** | **Acento / botón principal (CTA)** |
| 400 | `#EF9E4E` | Acento en dark mode |
| 300 | `#F6BE85` | — |
| 200 | `#FBDBB8` | Fondos de aviso suave |
| 100 | `#FDF0DF` | Fondos tenues |

### Neutros (sesgo verde, elegidos a propósito)
| Nombre | Hex | Uso |
|---|---|---|
| Tinta | `#10231A` | Texto principal |
| Pizarra | `#38473F` | Texto secundario |
| Musgo | `#6C7B72` | Texto sutil |
| Línea | `#DCE4DE` | Bordes |
| Crema | `#F6F4EC` | Fondo de app |
| Blanco | `#FFFFFF` | Superficies |

### Semánticos (separados del acento de marca)
| Estado | Hex | Uso |
|---|---|---|
| Éxito | `#1F9D57` | Aporte confirmado |
| Aviso | `#F0B429` | Turno por vencer |
| Error | `#D64545` | Pago rechazado |
| Info | `#2E7FB8` | Avisos neutros |

**Contrastes verificados (WCAG AA):** Blanco/Verde 600 = 7.4:1 · Tinta/Naranja 500 = 8.1:1 · Tinta/Crema = 13:1.

---

## 04 · Tipografía

| Rol | Tipografía | Pesos |
|---|---|---|
| Display (títulos, logotipo, cifras) | **Poppins** | 600 / 700 |
| Interfaz y cuerpo | **Inter** | 400 / 500 / 600 |

Escala:
- Título de pantalla — Poppins 700 · 34/38
- Encabezado de sección — Poppins 600 · 24/28
- Cuerpo — Inter 400 · 16/26
- Etiqueta/label — Inter 600 · 12 · +8% tracking, MAYÚSCULAS

Ambas son gratuitas (SIL Open Font License). Alternativa de sistema: `system-ui`. Usar `tabular-nums` en toda cifra de dinero.

---

## 05 · Voz y tono

Hablamos de **vos**, con calidez y sin tecnicismos, pero precisos con el dinero. Claros como un recibo, cercanos como un vecino de confianza.

**Sí decimos**
- "Listo, tu aporte de Bs 250 quedó guardado."
- "Te toca en 2 turnos. Te avisamos."
- "Retirá tu plata cuando quieras."

**No decimos**
- "Transacción procesada exitosamente."
- "Su saldo disponible es de…"
- "Estimado usuario, le informamos que…"

### Taglines
| Tagline | Registro |
|---|---|
| **El pasanaku, en tu bolsillo.** | Principal |
| Aportá hoy. Recibí tu turno. | Funcional |
| Tu plata, tu grupo, tu confianza. | Emocional |
| Juntos ahorramos mejor. | Comunitario |

---

## 06 · Principios de aplicación (app)

- **Verde para estructura, naranja para acción.** El acento naranja se reserva para el botón que la persona debe tocar (ej: "Recargar" naranja, "Retirar" fantasma).
- **Las cifras mandan.** Saldo y montos en Poppins con `tabular-nums`.
- **Cada grupo, una identidad.** Iniciales sobre avatar de color de marca.
- **Estado a la vista.** "Tu turno pronto" comunica antes de que la persona lo busque.

---

## 07 · Uso del logo

- Versiones válidas: sobre **verde de marca**, **crema**, **fondo oscuro** y **monocromo verde**.
- Aire mínimo alrededor = altura del vértice del símbolo.
- Tamaño mínimo en pantalla: 24 px de alto.

---

## Pendientes / próximos pasos
- [ ] Confirmar los **hex exactos** del verde y naranja con el archivo original del diseñador (los actuales están estimados desde la imagen).
- [ ] Generar el **logotipo horizontal** (símbolo + "AportaYa").
- [ ] Definir **iconografía** de la app.
- [ ] Incorporar la **idea base** original del equipo para alinear esencia y valores.

Relacionado: [AportaYa-Identidad.html](AportaYa-Identidad.html)
