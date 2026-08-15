---
tags:
  - plan
  - fase
  - frontend
titulo: "Fases F2 a F5 — App móvil (Expo)"
fases: [F2, F3, F4, F5]
depende_de: [F0, F1]
habilita: [F12]
---

# Fases F2 a F5 — App móvil

> **Se ejecuta en:** Ola F1 · carril M (F2) y Ola F2–F3 · carriles M1, M2, M3 (F3, F4,
> F5). Ver [[16 Carriles de frontend]].

> [!important] Antes de escribir la primera línea
> [[10b Estándar de ejecución del frontend]] aplica en las cuatro fases. **Cada
> pantalla sale de la sección «Interfaz» de su caso de uso** — no se inventa.

**Contexto real de uso, que manda sobre todo lo demás:** Android de gama baja, datos
móviles intermitentes, en la calle, con una persona que quizá nunca usó una billetera
digital. Si la abuela no lo entiende, se rehace.

---

# FASE F2 — Shell móvil

> **Objetivo.** Que la app tenga navegación, sesión, tema, biometría, almacenamiento
> seguro y los estados obligatorios funcionando — para que F3, F4 y F5 solo agreguen
> pantallas.

## Alcance

| Pieza | Qué resuelve |
| --- | --- |
| **Expo Router** con tab bar de 3–5 destinos | Enrutamiento por archivos: cada carril agrega pantallas sin tocar un registro común |
| `ProveedorSesion` | Token en `expo-secure-store`, refresco rotado (`R-SEG-09`), cierre de sesión, expiración |
| `ProveedorTema` | Claro/oscuro + preferencia del sistema |
| `usarBiometria()` | `expo-local-authentication` para confirmar operaciones de dinero |
| `usarDispositivo()` | Identificador de dispositivo de confianza (CU-04) |
| `ProveedorConexion` | Estado de red; bloquea operaciones cuando no hay |
| `LimiteDeError` | Captura, muestra en voz de marca y ofrece reintento |
| `usarIdempotencia()` | Genera la clave al abrir un formulario y **la reenvía igual** en el reintento |
| EAS Update | Canal por entorno; correcciones sin pasar por tienda |

## Las tres reglas del shell

1. **Sin conexión, la app muestra el último estado y no deja operar.** No se encola una
   operación de dinero para «cuando vuelva» — eso duplica aportes.
2. **La biometría confirma, no autentica.** Autentica el servidor; la huella solo
   desbloquea el envío.
3. **Nada sensible en `AsyncStorage`.** Token, PIN y datos personales van a
   `expo-secure-store`. Las vistas con saldo bloquean captura de pantalla.

## Gate de salida F2

- [ ] Gate común de §10 del plan maestro del frontend
- [ ] Sesión expirada ⇒ vuelve a login **sin perder el formulario en curso**
- [ ] Modo avión ⇒ último estado visible y botones de dinero deshabilitados con motivo
- [ ] Una pantalla nueva se registra **solo creando el archivo**
- [ ] Token y PIN **no** aparecen en ningún log ni traza (revisado con caso real)

---

# FASE F3 — Móvil · identidad y cuenta

**Casos de uso:** CU-01, 02, 03, 04, 05, 06, 07, 09, 40, 46

| CU | Pantalla | Lo que el CU exige |
| :-: | --- | --- |
| 01 | **Alta guiada en cuatro pasos** con cámara para el documento | Al terminar **muestra los topes que le corresponden** |
| 02 | *Aumentá tu límite* | Muestra **qué desbloquea cada nivel antes** de pedir papeles |
| 03 | Declaración PEP | Las cinco categorías **en lenguaje llano, no en jerga normativa** |
| 04 | Ingreso con teléfono y PIN o biometría | Dispositivo nuevo **siempre** pide segundo factor |
| 05 | Contrato a pantalla completa | Resumen de comisiones arriba, **con impuestos incluidos** |
| 06 | Aviso de actualización de datos | **Qué falta y por qué se pide** |
| 07 | *Mis datos*: descargar, corregir u oponerse | **Con el plazo de respuesta a la vista** |
| 09 | *Cuenta → Seguridad*: cambio de clave | Medidor de fortaleza; baja con impedimentos listados |
| 40 | Antes de operar | **Cuánto queda del límite del mes** |
| 46 | Servicio no habilitado | **Lo explica sin jerga** |

## Lo que define esta fase

- **CU-01 es la primera impresión del producto.** Cuatro pasos, cámara para el
  documento, y al final los límites concretos — no un «bienvenido» vacío.
- **CU-03 en lenguaje llano** es un requisito escrito, no una sugerencia de estilo:
  una declaración PEP que la persona no entiende es una declaración inválida.
- **CU-46**: mientras la licencia esté `EN_TRAMITE` la app tiene que explicar, sin
  jerga, qué no se puede hacer todavía. Esa pantalla se usa desde el día uno.

## Gate de salida F3

- [ ] Gate común
- [ ] Alta completa con cámara, probada en Android de gama baja
- [ ] Dispositivo nuevo ⇒ segundo factor, siempre (probado)
- [ ] El contrato muestra comisiones **con impuestos** antes de aceptar
- [ ] Plazo de respuesta visible en *Mis datos* (CU-07)
- [ ] Servicio no habilitado ⇒ explicación sin jerga, no un error

---

# FASE F4 — Móvil · billetera

**Casos de uso:** CU-10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 30, 31, 32, 33, 57

Es la fase donde la app toca dinero. **Todos los invariantes de dinero se verifican
acá.**

| CU | Pantalla | Lo que el CU exige |
| :-: | --- | --- |
| 10 | *Cargar saldo*: monto, medio, **QR a pantalla completa con cuenta regresiva** | El QR vence a la vista |
| 11 | *Retirar*: destino, monto, **costo y neto antes de confirmar** con biometría | El neto en grande |
| 12 | Enviar | **Nombre y foto del destinatario antes de aceptar** |
| 13 | Saldo retenido **separado**, con motivo y hasta cuándo | No se mezcla con disponible |
| 14 | Extracto | Muestra **el movimiento y su corrección**, nunca solo el resultado |
| 15 | *Movimientos → Descargar* | Extracto por mes y certificado con folio |
| 16 | *Cerrar mi cuenta* | **Lista de lo que falta**, no un «no» genérico |
| 17 | Monto no disponible | **Número de oficio y a quién consultar** |
| 18 | *Cobros → Mis cuentas* | Número **enmascarado**, banco, estado de verificación |
| 19 | Detalle del pago | El reembolso **como movimiento**, con su motivo |
| 30 | Antes de confirmar | Costo **con impuestos incluidos y su desglose** |
| 31 | Detalle | La comisión como **línea con nombre**, nunca descuento anónimo |
| 32 | Detalle de la operación | La factura queda disponible |
| 33 | Extracto | El abono con **el motivo escrito** |
| 57 | Mapa/lista de puntos | Dónde recargar o retirar en efectivo |

## Las cinco reglas de esta fase

1. **El cliente no calcula ni un centavo.** Muestra lo que el servidor devolvió.
2. **Costo total con impuestos, antes de confirmar.** `R-CON-07`, CU-30.
3. **Doble envío bloqueado** en las cinco operaciones de dinero, con la misma clave de
   idempotencia en el reintento.
4. **El extracto muestra la corrección, no el resultado limpio.** Un reverso se ve
   como movimiento nuevo — es `R-AUD-06` hecho interfaz.
5. **El número de cuenta siempre enmascarado**, en pantalla y en cualquier traza.

## Gate de salida F4

- [ ] Gate común
- [ ] **Prueba de doble envío en las cinco operaciones de dinero** (recarga, retiro,
      transferencia, aporte, cierre)
- [ ] Ningún `toFixed`, `Intl.NumberFormat` ni aritmética sobre importes (lint)
- [ ] El costo con impuestos aparece **antes** del botón de confirmar, en las tres
      operaciones con comisión
- [ ] Lista de movimientos virtualizada y paginada, probada con 5 000 filas en gama baja
- [ ] Retiro sin conexión ⇒ bloqueado con motivo, **nunca encolado**
- [ ] Número de cuenta enmascarado en pantalla, en logs y en capturas

---

# FASE F5 — Móvil · pasanaku y comunidad

**Casos de uso:** CU-20, 21, 22, 23, 25, 26, 27, 28, 29, 52, 53, 55, 59, 60, 61, 62,
63, 64, 65, 68, 69, 70, 71, 74, 75, 76

Es el producto propiamente dicho: el grupo.

| Grupo | CU | Pantallas |
| --- | --- | --- |
| **Crear y entrar** | 20, 68, 69 | Asistente que **muestra el costo total del ciclo antes de confirmar** · postulación · invitar con token |
| **El ciclo del dinero** | 21, 22 | ***Mi aporte***: monto, fecha límite y **un** botón · ***Cobrar mi turno***: bolsa, cada deducción con su motivo, **el neto en grande** |
| **Turnos** | 59, 60, 61, 62 | *Tu turno* con **cuenta regresiva al revelado** · botón **Verificar** con veredicto · proponer permuta · fecha corrida por feriado **explicada** |
| **Decisiones** | 63, 64, 65 | *Grupo → Decisiones*: tarjeta por acuerdo con propuesta, plazo y quórum · traspaso · retiro con su liquidación |
| **Cuando algo sale mal** | 23, 25, 26, 27, 28, 29 | Aviso de incumplimiento con **qué se le imputa y hasta cuándo puede responder** · *Mis avales* con tope consumido · aviso de restricción **persistente pero no bloqueante**, con motivo y monto · *Mi entrega*: línea de tiempo real · *Fondo de garantía*: lo que puso y lo que se consumió |
| **Reclamos** | 52, 53, 55 | *Ayuda → Reclamo*: **código, plazo y estado siempre a la vista** · elevación a segunda instancia · aviso de incidente que lo afecta |
| **Reputación** | 70, 71, 74, 75, 76 | Puntaje **con su desglose**, insignias, certificado compartible, reseñas |

## Las cuatro reglas de esta fase

1. **El debido proceso se ve.** CU-25: la persona ve qué se le imputa, con qué
   evidencia y **hasta cuándo puede responder**, con el plazo guardado — no uno
   recalculado en el cliente.
2. **La restricción explica, no castiga en silencio.** CU-27: aviso persistente **no
   bloqueante**, con motivo, monto y cómo salir.
3. **La reputación es explicable.** CU-71: nunca un número solo. Siempre su desglose,
   porque un puntaje que no se puede discutir no se puede usar.
4. **La transparencia es una función, no un eslogan.** CU-61: el botón *Verificar* da
   un veredicto que la persona puede recomputar por su cuenta.

## Gate de salida F5

- [ ] Gate común
- [ ] *Mi aporte* funciona con saldo en **un** toque, con doble envío bloqueado
- [ ] *Cobrar mi turno* muestra **cada deducción con su motivo** y el neto destacado
- [ ] El plazo de descargo que se muestra es **el guardado por el servidor**, no
      recalculado en el cliente
- [ ] El puntaje de reputación **nunca** se muestra sin su desglose
- [ ] *Verificar* el sorteo da veredicto y permite descargar el paquete
- [ ] Las 26 pantallas tienen sus cuatro estados

## Ver también

[[00c Recetario · implementar un caso de uso]] · [[16 Carriles de frontend]] · [[10 Plan maestro del frontend]] · [[10b Estándar de ejecución del frontend]] · [[13 Fases F6 a F8 · Backoffice]] · [[_CasosDeUso]]
