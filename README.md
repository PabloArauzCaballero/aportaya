# Modelo de Clases y Relacional por Módulo — Pasanaku Digital v2.0 + Parche A

Este paquete contiene, para cada módulo del sistema, **un archivo `.puml`** con
dos diagramas: el **modelo de clases** (diseño orientado a objetos, con
estereotipos DDD) y el **modelo relacional** (entidad-relación listo para
traducir a DDL). Ambos viven en el mismo archivo; al renderizar se generan dos
imágenes por módulo.

Cubre el Documento de Requerimientos v2.0 (pago QR, WhatsApp, transparencia,
reputación) **más** el Parche A (organizador digital automatizado, organizador
humano con comisión y fondo de garantía).

**Tamaño del modelo:** 200 clases, 62 enumeraciones y 184 tablas en 18
diagramas. Los 18 renderizan sin errores con PlantUML 1.2025.4.

## Módulos incluidos

| Archivo | Módulo | Clases | Tablas | Requerimientos |
| --- | --- | ---: | ---: | --- |
| `01_identidad_usuarios.puml` | Identidad, Usuarios y Seguridad de Acceso | 30 | 25 | RF-01, RF-18 (base), RN-01, RN-17 |
| `02_grupos_turnos.puml` | Grupos, Cupos, Turnos y Gobernanza | 22 | 22 | Núcleo + RF-19 |
| `03_aportes_pagos_qr.puml` | Aportes, Pagos QR, Conciliación y Contabilidad | 22 | 22 | RF-15, RN-05, RN-17 |
| `04_entregas_fondo.puml` | Entregas de Fondo (liquidación y desembolso) | 11 | 10 | Núcleo, RN-05 |
| `05_notificaciones.puml` | Notificaciones y Comunicaciones | 17 | 15 | RF-16 |
| `06_transparencia_reputacion.puml` | Transparencia, Reputación y Confianza | 21 | 16 | RF-17, RF-18 |
| `07_organizador_comision.puml` | Organizador, Comisión y Automatización | 23 | 22 | RF-20, RN-18 a RN-20, RN-22 |
| `08_garantia_incumplimiento.puml` | Garantía, Incumplimiento, Cobranza y Sanciones | 34 | 33 | RF-21, RN-21 |
| `09_auditoria_reportes.puml` | Auditoría, Reportes y Cumplimiento | 20 | 19 | RN-17 |

## Decisiones de diseño que atraviesan todo el modelo

Estas son las decisiones que separan un modelo de clase de un modelo que
aguanta producción con dinero de terceros:

1. **Tokens de verificación como agregado propio (M1).** Jerarquía
   `TokenVerificacion` → `TokenOTP` / `TokenEnlaceFirmado` / `TokenRefresco`,
   con `PoliticaToken` parametrizable por propósito, `IntentoValidacionToken`
   para detectar fuerza bruta y clave de idempotencia para evitar doble
   emisión. Nunca se persiste el valor plano: solo su hash con *pepper*.
2. **Incumplimiento como expediente, no como bandera (M8).**
   `RegistroIncumplimiento` con evidencia, línea de tiempo de estados,
   descargo del participante, gestión de cobranza escalonada, deuda exigible,
   subrogación al fondo, aval solidario, sanción proporcional y apelación. La
   reputación es *una consecuencia* de este expediente, no el registro mismo.
3. **Cupo separado de Participante (M2).** Una persona puede tener dos manos o
   media mano; las obligaciones y los turnos cuelgan del cupo. Esto permite
   reemplazar a un moroso conservando la posición económica en el calendario.
4. **Contabilidad de doble partida (M3).** `AsientoContable` +
   `MovimientoContable` con invariante `SUM(debe) = SUM(haber)`. El panel de
   transparencia se calcula desde el mayor, no desde sumas ad-hoc. Nada se
   edita: se reversa.
5. **Idempotencia de extremo a extremo.** Webhooks de pasarela, órdenes de
   cobro, desembolsos, tareas automatizadas y notificaciones llevan
   `clave_idempotencia` única. Un reintento del proveedor no acredita dos veces.
6. **Sorteo de turnos verificable (M2).** Esquema *commit-reveal*: se publica
   el hash de la semilla antes de sortear y se revela después, para que
   cualquiera recompute el orden. El orden de cobro es el punto de
   desconfianza número uno del pasanaku.
7. **Debido proceso en las sanciones (M8).** Matriz
   `tipo × severidad × reincidencia`, plazo de descargo, estado FIRME antes de
   ejecutar y derecho a apelación en dos instancias.
8. **Auditoría encadenada por hash (M9) + outbox transaccional.** Bitácora
   *insert-only* con `hash_anterior`, auditoría de lectura separada de la de
   escritura, y `EventoDominio` escrito en la misma transacción que el cambio.
9. **Entrega como liquidación, no como transferencia (M4).** Bolsa bruta,
   deducciones línea a línea (comisión, deuda propia, reposición de cobertura)
   y neto contra cuenta bancaria verificada con periodo de enfriamiento.
10. **Comisión en tres tiempos (M7).** Devengo → liquidación → pago, con
    retenciones impositivas y tope regulatorio validado antes de activar el
    esquema.

## Cómo se relacionan los módulos entre sí

Los módulos comparten claves foráneas, señaladas en notas dentro de cada
diagrama. Mapa general de dependencias:

```
1. Identidad y Seguridad ─── usuario_id, token_id ──┬──► 2, 3, 4, 5, 7, 8
        │                                            │
        │ restriccion_usuario ◄───────────────────── 8 (incumplimiento)
        ▼
2. Grupos, Cupos y Turnos ──► 3. Aportes y Pagos QR ──► 4. Entregas de Fondo
        │  grupo/cupo/periodo      │ obligacion_id            │
        │                          │                          │ deducciones
        │                          ▼                          ▼
        │                  8. Garantía e Incumplimiento ◄─────┘
        │                          │  cobertura, deuda, sanción
        │                          ▼
        └────────────────► 6. Transparencia y Reputación ◄──── eventos
                                   ▲
2. Grupos ──► 7. Organizador y Comisión ──► 3 (cobro) y 4 (deducción)

5. Notificaciones consume eventos de 2, 3, 4, 7 y 8 (cobranza)
3 / 4 / 7 / 8 ──► 9. Auditoría, Reportes y Cumplimiento (transversal)
```

Puntos de integración concretos más usados:

- `token_verificacion` (M1) respalda invitaciones (M2), enlaces de pago (M3/M5),
  confirmación de entrega (M4), firma de reglamento (M2) y aceptación de aval (M8).
- `obligacion_aporte` (M3) es el eje: la cubre el fondo (M8), la deduce la
  entrega (M4) y la puntúa la reputación (M6).
- `acuerdo` (M2) autoriza lo que no puede ser unilateral: condonaciones,
  expulsiones, permutas, cambio de esquema de comisión y disolución.
- `evento_dominio` (M9) es el canal por el que M5, M6 y el cumplimiento se
  enteran de lo que pasa, sin acoplar los módulos entre sí.

## Convenciones usadas

**Diagramas de clases**

- Visibilidad `-` privado, `#` protegido, `+` público; `{static}` para
  operaciones de clase.
- Estereotipos: `<<AR>>` raíz de agregado, `<<VO>>` objeto de valor,
  `<<Svc>>` servicio de dominio, `<<Pol>>` política configurable.
- Todo agregado persistente lleva implícitamente `creadoEn`, `actualizadoEn`,
  `creadoPor`, `version` (bloqueo optimista) y `eliminadoEn` (borrado lógico).
- Las clases se agrupan en paquetes por subdominio para poder leer el diagrama
  por partes.

**Modelo relacional**

- `*` PK, `#` FK, `<<UQ>>` único, `<<IDX>>` indexado, `<<CK>>` restricción
  CHECK, `<<NULL>>` admite nulos. Nombres en `snake_case`.
- Importes en `DECIMAL(14,2)` (o `16,2` para acumulados) siempre acompañados de
  `moneda CHAR(3)` ISO-4217. Fechas en `TIMESTAMPTZ`.
- Las tablas *append-only* están marcadas en las notas: bitácora, eventos de
  reputación, movimientos de fondo, asientos contables y abonos de recuperación.
  A esas se les revoca `UPDATE`/`DELETE` a nivel de rol de base de datos.
- Las referencias polimórficas (bitácora, deducciones, alertas) se indican en
  notas y se validan por aplicación o trigger, no con FK física.
- Las notas al pie de cada diagrama señalan las claves foráneas hacia **otros
  módulos**, para que cada diagrama se lea de forma independiente.

## Cómo renderizar

**VS Code**: extensión *PlantUML* (jebbs), `Alt+D` para previsualizar (se
generan dos vistas por archivo, una por cada `@startuml`).

**Línea de comandos** (requiere Java + `plantuml.jar`):

```bash
java -jar plantuml.jar -tsvg -charset UTF-8 *.puml
```

Genera un `.svg` por diagrama, nombrado según el título interno del `@startuml`
(`..._clases.svg` y `..._relacional.svg`). Para PNG use `-tpng`; los diagramas
grandes (módulos 1, 2, 7 y 8) se leen mejor en SVG.

**En línea**: pegue el contenido en https://www.plantuml.com/plantuml. Si el
visor solo renderiza un diagrama a la vez, copie cada bloque
`@startuml ... @enduml` por separado.
