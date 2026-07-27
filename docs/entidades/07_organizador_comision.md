# Módulo 7 — Organizador, Comisión y Automatización

> **Pregunta de negocio que responde este módulo:**
> *¿Quién administra el grupo, cuánto cobra por hacerlo, quién autoriza ese cobro,
> y qué pasa cuando lo hace mal? ¿Y qué pasa si no hay nadie que lo administre?*

En el pasanaku tradicional siempre hay alguien que organiza: recuerda las fechas,
persigue a los que se atrasan, junta la plata y la entrega. Ese trabajo es real y
en muchos casos se paga —una comisión, una mano gratis, algún beneficio—. El
problema del modelo tradicional es que **ese mismo organizador es quien custodia
la plata**, y ahí es donde se pierden los pasanakus: se la presta, la usa, o
simplemente desaparece.

El invariante que sostiene todo este módulo:

> **RN-18 — El organizador nunca es cuenta de paso del dinero del grupo.**
> Su comisión es una obligación más dentro del mismo circuito de pagos (M3) y se
> le desembolsa como cualquier otro egreso, con su asiento contable propio.

El módulo tiene dos mitades. Una **profesionaliza al organizador humano**:
habilitación, contrato, límites, comisión transparente y consecuencias por mal
desempeño. La otra **lo hace prescindible**: el organizador digital, que ejecuta el
mismo trabajo sin cobrar comisión.

---

## Paquete: Habilitación del Organizador

### `Organizador` / `organizador` — Raíz de agregado

**Qué es.** Un usuario habilitado para administrar grupos de terceros, con su
nivel, sus límites y sus indicadores de cartera.

**Para qué sirve (negocio).** Convierte "el que organiza" en **un rol
profesionalizado con requisitos, límites y consecuencias**. Los campos clave:

- `limiteGruposSimultaneos` y `limiteMontoAdministrado` son **control de riesgo
  puro**. Un organizador nuevo puede llevar dos grupos chicos; uno con historial
  probado, quince grupos grandes. Sin límites, alguien puede acumular cincuenta
  grupos y su fracaso arrastra a cientos de personas a la vez. Es el mismo
  principio por el que un banco no le da la misma línea a todos.
- `nivel` (aprendiz → estándar → sénior → maestro) es la escalera de crecimiento y
  el incentivo: administrar bien habilita a administrar más y, por lo tanto, a
  ganar más.
- `indiceMorosidadCartera` es **el indicador que más importa de todo el módulo**.
  Un organizador cuyos grupos tienen 30% de mora está haciendo mal el trabajo, sin
  importar cuántos grupos tenga. Es lo que separa a quien realmente gestiona de
  quien solo cobra comisión.
- `calificacionPromedio` viene de las reseñas (M6) y captura la dimensión de trato.

**Por qué debe existir separado de `Usuario`.** Porque ser organizador es un rol
con estado propio (`POSTULADO → EN_EVALUACION → CAPACITACION_PENDIENTE →
HABILITADO → LIMITADO → SUSPENDIDO → DESHABILITADO`), con métricas propias y con
un proceso de habilitación que la cuenta de usuario no tiene. Y porque un usuario
puede ser organizador en unos grupos y participante en otros.

**A nivel de sistema.** `usuario_id` `UNIQUE`. `grupos_activos` y
`monto_administrado_actual` son contadores mantenidos por trigger: hacen cumplir
los límites sin recorrer toda la cartera en cada validación.
`cuenta_cobro_id` → `cuenta_bancaria_beneficiario` (M4), verificada.

---

### `SolicitudOrganizador` / `solicitud_organizador`

**Qué es.** La postulación de un usuario para ser habilitado como organizador.

**Para qué sirve (negocio).** Es la puerta de entrada, y tiene que ser una puerta
real: **quien administra plata ajena tiene que pasar un filtro**. La solicitud
guarda motivación, experiencia declarada, referencias, el KYC reforzado y —
crucialmente— `puntajeReputacionAlSolicitar`: con qué historial se lo aceptó.

`motivoRechazo` y `revisadaPor` cierran el proceso: el rechazo tiene autor y
fundamento, y el postulante puede saber qué le faltó para volver a intentar.

**Por qué debe existir.** Sin solicitud formal, ser organizador sería marcar una
casilla, y la plataforma estaría entregando la administración de dinero ajeno sin
evaluación ni registro de quién autorizó qué.

---

### `RequisitoHabilitacion` / `requisito_habilitacion` — Política configurable

**Qué es.** El catálogo de requisitos por nivel: KYC, reputación, antigüedad,
capacitación, garantía económica.

**Para qué sirve (negocio).** Permite endurecer o relajar la barrera de entrada
según la etapa del negocio y según lo que la experiencia enseñe. Si aparece un
patrón de organizadores nuevos que fallan en el primer grupo, se sube la
antigüedad mínima sin desplegar código.

`GARANTIA_ECONOMICA` como tipo es relevante: para niveles altos se puede exigir que
el organizador deje un depósito que responda si su gestión genera pérdidas. Alinea
su interés con el del grupo.

**Por qué debe existir.** Con requisitos hardcodeados, cada ajuste es un release y
no queda registro de qué se le exigió a un organizador habilitado hace un año.

---

### `CapacitacionOrganizador` / `capacitacion_organizador`

**Qué es.** Los módulos de formación que el organizador completó, con su nota y
vigencia.

**Para qué sirve (negocio).** La mayoría de los problemas de un organizador no son
mala fe: son desconocimiento. No sabe cómo manejar a alguien que se atrasa, no
entiende qué puede y qué no puede decidir solo, no sabe cómo se calcula una
liquidación. La capacitación reduce incidentes y le da a la plataforma un
argumento sólido cuando tiene que sancionar: *se te capacitó en esto, aprobaste con
esta nota, y aun así lo hiciste mal.*

`vigenteHasta` obliga a recertificar cuando cambian las reglas.

**Por qué debe existir.** Sin registro de capacitación no se puede exigir
formación como requisito ni distinguir el error de buena fe del incumplimiento
consciente.

---

### `ContratoOrganizador` / `contrato_organizador`

**Qué es.** El contrato firmado entre el organizador y la plataforma, versionado y
sellado con hash.

**Para qué sirve (negocio).** Es el documento que hace exigibles las obligaciones
del organizador y que fundamenta las `causalesRescision`. Cuando hay que
deshabilitar a alguien, la pregunta legal es "¿en base a qué?", y la respuesta es
este contrato, en la versión que firmó, con su hash y su token de firma.

Importa especialmente en un punto: es donde queda escrito que **el organizador no
custodia fondos** (RN-18). Si alguien pide efectivo por fuera del sistema, está
violando el contrato de forma documentada.

**Por qué debe existir.** Sin contrato firmado y versionado, la relación con el
organizador es informal, y sancionarlo o darlo de baja queda sin fundamento.

---

## Paquete: Esquema y Aceptación de Comisión

### `EsquemaComision` / `esquema_comision` — Raíz de agregado

**Qué es.** Cómo, cuánto y quién le paga al organizador por un grupo concreto.

**Para qué sirve (negocio).** Es donde se resuelve el conflicto de interés más
delicado de la plataforma. Los campos y por qué están:

- `tipo` (fija por grupo / fija por período / % sobre aporte / % sobre bolsa /
  escalonada) refleja las formas reales en que se paga a un organizador. No hay una
  sola correcta: en un grupo chico la fija es más justa; en uno grande el
  porcentaje alinea incentivos.
- `pagador` responde la pregunta incómoda: **¿de dónde sale esa plata?** Tres
  respuestas honestas: se prorratea entre todos, la paga el beneficiario del
  período, o la absorbe la plataforma. Dejarlo ambiguo es la fuente número uno de
  conflictos, porque cada participante asume una respuesta distinta.
- `eventoGatillo` define **cuándo se gana**: al conformarse el grupo, al iniciar,
  al liquidar cada período, al confirmarse cada entrega o al completarse el ciclo.
  Que se gane por hito cumplido, y no por adelantado, alinea el incentivo del
  organizador con el éxito real del grupo.
- `topeMaximoPorPeriodo` / `porCiclo` / `topeRegulatorioPorcentaje` (RN-20) son los
  límites duros.
- `requiereAceptacionUnanime` y `porcentajeAceptacion` (RN-19): **la comisión no
  existe hasta que los participantes la aceptan.**

`esquemaAnteriorId` + estado `SUSTITUIDO` implementan la regla de oro: **un
esquema de comisión nunca se edita en sitio**. Cambiarlo a mitad de ciclo exige un
`Acuerdo` del grupo (M2), y el esquema viejo queda marcado como sustituido, no
sobrescrito. Sin eso, un organizador podría subirse la comisión y nadie podría
probar cuál era la original.

**Por qué debe existir.** Sin esquema explícito y aceptado, la comisión es un
descuento que aparece en la entrega y que nadie recuerda haber aprobado — que es
exactamente la queja que hunde la confianza en el organizador.

**A nivel de sistema.**
`CREATE UNIQUE INDEX ON esquema_comision (grupo_id) WHERE estado = 'VIGENTE'`: un
solo esquema vigente por grupo. `CHECK`: el valor no puede superar el tope
regulatorio cuando el tipo es porcentual.

---

### `AceptacionComision` / `aceptacion_comision`

**Qué es.** La aceptación individual de cada participante al esquema de comisión,
firmada y con sello de tiempo.

**Para qué sirve (negocio).** Es la prueba de RN-19. Cuando en el período 8 alguien
diga "yo nunca acepté pagar comisión", la respuesta es: aceptaste el 3 de enero a
las 20:14, desde esta IP, con este token de firma enviado a tu teléfono verificado.

Guardar también los rechazos (`acepta = false`) importa: si la mitad del grupo
rechazó el esquema, eso quedó registrado y el esquema no debió activarse.

`comentario` permite que quede la objeción de quien aceptó a regañadientes.

**Por qué debe existir.** Sin aceptación individual, la comisión se impone. Y una
comisión impuesta es, en la práctica, indistinguible de que el organizador se quede
con plata del grupo.

---

### `TramoComision` / `tramo_comision`

**Qué es.** Los escalones de una comisión escalonada por monto.

**Para qué sirve (negocio).** Permite comisiones regresivas —el porcentaje baja a
medida que el monto sube—, que es lo justo: administrar un grupo de Bs 10.000 no
cuesta diez veces más trabajo que uno de Bs 1.000. Sin tramos, o los grupos chicos
son inviables para el organizador, o los grandes pagan de más.

**Por qué debe existir.** Un solo campo `valor` solo soporta comisión lineal, que
deja fuera al segmento chico o le cobra de más al grande.

---

### `TopeRegulatorio` / `tope_regulatorio` — Política configurable

**Qué es.** El límite máximo de comisión permitido, con su fundamento normativo.

**Para qué sirve (negocio).** Implementa RN-20. Es el techo que **ningún esquema
puede superar, aunque los participantes lo acepten**. Esa distinción es
importante: hay límites que no son negociables entre partes, porque existen para
proteger a la parte más débil de una negociación desigual. Alguien que necesita
plata con urgencia acepta cualquier comisión.

`fundamentoNormativo` documenta de dónde sale el tope, y `vigenteDesde` lo versiona:
cuando la normativa cambia, los esquemas viejos siguen validados contra la que
regía cuando se firmaron.

**Por qué debe existir.** Sin tope validado por el sistema, la plataforma queda
expuesta a que un organizador cobre comisiones abusivas usando su marca — con la
responsabilidad reputacional y legal que eso implica.

---

## Paquete: Ciclo Financiero de la Comisión

> **Por qué tres tiempos: devengo → liquidación → pago.**
> Porque el organizador **gana** su comisión período a período, pero **cobra** una
> vez al mes. Si el grupo se cae a mitad de camino, los devengos no liquidados se
> anulan sin tener que quitarle dinero ya pagado —una operación que en la práctica
> es imposible—. Además, agrupar devengos en una liquidación mensual es lo que
> permite aplicar retenciones impositivas correctamente y emitir un solo documento.

### `DevengoComision` / `devengo_comision`

**Qué es.** La comisión ganada en un hito concreto: este período, este grupo, este
evento gatillo, este monto.

**Para qué sirve (negocio).** Es el reconocimiento del ingreso en el momento en
que se gana, no cuando se paga. Guarda `baseCalculo` (sobre qué se calculó) y
`montoDevengado` (el resultado), lo que hace el cálculo auditable: se puede
verificar que el 2% se aplicó sobre la bolsa correcta.

`anular(motivo)` cubre el caso importante: el grupo se disolvió, el período se
canceló, la entrega se reversó. **Anular un devengo no liquidado es limpio; quitar
plata ya pagada es un conflicto.**

**Por qué debe existir.** Sin devengos individuales, la liquidación mensual sería
un número sin desglose y el organizador no podría verificar por qué le pagan lo
que le pagan — ni el grupo, por qué le descuentan lo que le descuentan.

**A nivel de sistema.** `UNIQUE (esquema_id, periodo_id, evento_gatillo)`: **evita
cobrar dos veces el mismo hito**. Un devengo entra a una sola liquidación
(`liquidacion_id`) y solo una vez.

---

### `LiquidacionComision` / `liquidacion_comision` — Raíz de agregado

**Qué es.** La consolidación mensual de los devengos de un organizador, con
retenciones y deducciones, hasta llegar al neto.

**Para qué sirve (negocio).** Es la "boleta de pago" del organizador. El camino
bruto → retenciones → deducciones → neto es el que un contador espera y el que la
normativa exige.

El flujo `BORRADOR → CALCULADA → APROBADA → PAGADA` con `aprobadaPor` implementa
**segregación de funciones**: el sistema calcula, un humano con autoridad aprueba,
y recién entonces se paga. Nadie puede autopagarse.

`liquidacionReversaId`: igual que en contabilidad, **una liquidación errónea no se
edita, se reversa** con una liquidación contraria.

**Por qué debe existir.** Sin liquidación, cada devengo se pagaría por separado:
imposible aplicar retenciones impositivas correctamente, imposible emitir un
documento único, y una cantidad absurda de transferencias pequeñas.

**A nivel de sistema.** `UNIQUE (organizador_id, periodo_liquidacion)`: una
liquidación por mes por organizador. Genera asiento contable en M3
(`origen_tipo = 'COMISION'`).

---

### `RetencionImpuesto` / `retencion_impuesto`

**Qué es.** Cada retención impositiva aplicada sobre la liquidación (IT, RC-IVA,
otros), con su base, alícuota y certificado.

**Para qué sirve (negocio).** El organizador presta un servicio y cobra por él:
eso genera obligaciones tributarias. La plataforma, como agente de retención, tiene
que retener, declarar y **entregarle el certificado** (`numeroCertificado`,
`emitirCertificado()`), que él necesita para su propia declaración.

`normativaAplicada` documenta bajo qué norma se retuvo, porque las alícuotas
cambian y hay que poder justificar una retención de hace dos años.

**Por qué debe existir.** Ignorar las retenciones convierte a la plataforma en
incumplidora tributaria y deja al organizador sin respaldo de lo que le
retuvieron. Es un riesgo legal directo, no un detalle contable.

---

### `DeduccionLiquidacion` / `deduccion_liquidacion`

**Qué es.** Los descuentos que no son impuestos: sanciones, anticipos, ajustes de
períodos anteriores, costo de transferencia.

**Para qué sirve (negocio).** Es el mecanismo por el que **las sanciones al
organizador se hacen efectivas**. `SancionOrganizador` de tipo
`RETENCION_COMISION` se materializa acá: se le retiene plata de su liquidación. Una
sanción que no toca el bolsillo no cambia comportamientos.

`AJUSTE_PERIODO_ANTERIOR` corrige errores sin reversar toda la liquidación pasada.

**Por qué debe existir.** Sin deducciones, la sanción económica al organizador
requeriría cobrarle por fuera, lo que en la práctica no ocurre nunca.

---

### `PagoComision` / `pago_comision`

**Qué es.** La transferencia efectiva del neto a la cuenta del organizador.

**Para qué sirve (negocio).** Cierra el ciclo. `conciliar()` verifica que
efectivamente salió, igual que cualquier otro egreso del sistema.

**Por qué debe existir.** `claveIdempotencia` `UNIQUE` es crítica por la misma
razón que en los desembolsos del módulo 4: **duplicar un pago de comisión es plata
perdida**, no un registro duplicado.

**A nivel de sistema.** `cuenta_destino_id` → M4, cuenta verificada. Un
organizador no cobra a una cuenta sin verificar.

---

### `DisputaComision` / `disputa_comision`

**Qué es.** El reclamo sobre una liquidación: monto incorrecto, cobro no acordado,
doble cobro.

**Para qué sirve (negocio).** El reclamante puede ser el organizador (le pagaron
menos de lo que ganó) **o un participante** (le cobraron algo que no aceptó). El
segundo caso es el importante: `COBRO_NO_ACORDADO` es exactamente la situación que
RN-19 quiere prevenir, y necesita un canal formal de resolución además de la
prevención.

**Por qué debe existir.** Sin gestión de disputas, un reclamo de comisión se
resuelve por WhatsApp con el soporte, sin trazabilidad y sin criterio uniforme.

---

## Paquete: Desempeño y Sanciones al Organizador

### `EvaluacionDesempeno` / `evaluacion_desempeno`

**Qué es.** La evaluación periódica del organizador sobre seis indicadores
objetivos.

**Para qué sirve (negocio).** Implementa RN-22 y responde: *¿este organizador está
haciendo bien su trabajo?* Con datos, no con impresiones:

- `indiceMorosidadCartera`: sus grupos, ¿pagan a tiempo?
- `tasaFinalizacionGrupos`: sus grupos, ¿terminan o se caen?
- `satisfaccionParticipantes`: la gente que administró, ¿lo recomendaría?
- `tiempoRespuestaPromedioHoras`: cuando alguien tiene un problema, ¿contesta?
- `incidenciasAbiertas` y `coberturasConsumidas`: ¿cuánto le cuesta al sistema?

`nivelSugerido` + `accionRecomendada` cierran el ciclo: la evaluación **tiene
consecuencias automáticas**, hacia arriba (ascenso de nivel, más límite) o hacia
abajo (reducción de límite, suspensión).

**Por qué debe existir.** Sin evaluación sistemática, un organizador que administra
mal sigue acumulando grupos hasta que el daño es grande y visible. Y uno que
administra bien no tiene forma de demostrarlo para crecer.

**A nivel de sistema.** `UNIQUE (organizador_id, periodo_evaluado)`.

---

### `MetricaOrganizador` / `metrica_organizador`

**Qué es.** El detalle de cada indicador dentro de la evaluación: valor, meta, si
cumple y cuánto pesa.

**Para qué sirve (negocio).** Hace la evaluación **explicable y apelable**. El
organizador no recibe "puntaje 62, nivel reducido"; recibe el desglose: morosidad
18% contra meta de 10% (no cumple, peso 0,35); tiempo de respuesta 4 h contra meta
de 6 h (cumple, peso 0,15). Con eso sabe qué corregir, y si apela, sabe qué
discutir.

**Por qué debe existir.** Una evaluación sin desglose es una calificación
arbitraria, y sancionar en base a ella es indefendible.

---

### `SancionOrganizador` / `sancion_organizador`

**Qué es.** La consecuencia por mal desempeño: advertencia, reducción de límite,
retención de comisión, suspensión o inhabilitación.

**Para qué sirve (negocio).** La escalera es deliberadamente gradual. Se empieza
por advertencia, no por inhabilitación, porque **inhabilitar a un organizador deja
a todos sus grupos sin administrador** — el remedio puede ser peor que la
enfermedad. `REDUCCION_LIMITE` es la sanción más elegante: no le quita los grupos
que tiene, pero le impide tomar más hasta que mejore.

`RETENCION_COMISION` con `montoRetenido` es la que pega en el bolsillo, y se
materializa como `DeduccionLiquidacion`.

**Por qué debe existir.** Sin sanciones graduadas, la única alternativa es tolerar
o expulsar, y ninguna de las dos sirve para la mayoría de los casos reales.

---

### `ApelacionSancion` (organizador) / `apelacion_sancion_org`

**Qué es.** El recurso del organizador contra una sanción.

**Para qué sirve (negocio).** Debido proceso. Las evaluaciones automáticas se
equivocan: un grupo puede tener alta morosidad por razones ajenas al organizador
(una crisis local, un participante que resultó ser un estafador). Sin apelación, un
buen organizador puede ser sancionado por un dato que no controlaba, y la
plataforma pierde a alguien valioso.

**Por qué debe existir.** Una sanción automática sin recurso es arbitraria, y
disuade a la gente buena de asumir el rol.

---

## Paquete: Organizador Digital (automatización, RF-20)

> **Por qué existe este paquete.** Porque el organizador humano es a la vez el
> mayor costo y el mayor riesgo del modelo. Si el sistema puede hacer el trabajo
> —generar cobros, mandar recordatorios, aplicar mora, liquidar el período,
> ejecutar la entrega, escalar la cobranza—, entonces el grupo puede ser
> **autogestionado**: sin comisión y sin dependencia de que una persona cumpla.
> Esa es la versión más barata y más segura del producto.

### `OrganizadorDigital` — Servicio de dominio

**Qué es.** El agente automático que ejecuta las funciones del organizador en un
grupo.

**Para qué sirve (negocio).** `nivelAutonomia` es el campo de negocio importante,
con tres modos:

- `SOLO_SUGIERE`: el sistema propone y un humano decide. Para grupos nuevos o
  organizadores que quieren mantener el control.
- `EJECUTA_CON_AVISO`: actúa y notifica. El punto medio razonable.
- `AUTONOMO`: actúa solo. Para grupos autogestionados maduros.

Poder graduar la autonomía es lo que permite adoptar la automatización sin pedirle
a la gente un acto de fe. Se empieza sugiriendo, se gana confianza, se sube el
nivel.

**Por qué debe existir.** Sin organizador digital, todo grupo necesita una persona
disponible y confiable — y ese es el cuello de botella que limita el crecimiento y
concentra el riesgo.

---

### `ReglaAutomatizacion` / `regla_automatizacion` — Política configurable

**Qué es.** Qué se automatiza, cuándo se dispara, bajo qué condición y qué acción
ejecuta.

**Para qué sirve (negocio).** Es el cerebro configurable. Las seis acciones
tipificadas son exactamente el trabajo del organizador: generar cobros, enviar
recordatorios, aplicar mora, liquidar el período, ejecutar la entrega, escalar la
cobranza.

`requiereConfirmacionHumana` es el freno de seguridad **por acción, no por
sistema**. Generar recordatorios puede ser totalmente automático; ejecutar una
entrega de Bs 20.000 probablemente no. La granularidad permite automatizar lo
rutinario sin automatizar lo irreversible.

**Por qué debe existir.** Con automatización hardcodeada no se puede ajustar qué
se automatiza por tipo de grupo, ni desactivar una regla que está causando
problemas sin apagar todo el sistema.

---

### `TareaAutomatizada` / `tarea_automatizada`

**Qué es.** Una instancia concreta de trabajo programada por una regla.

**Para qué sirve (negocio).** Hace visible lo que el sistema va a hacer **antes de
hacerlo**. `tareasPendientes()` es la agenda del organizador digital, y en modo
`SOLO_SUGIERE` es literalmente la lista de sugerencias que el humano revisa.

`REQUIERE_APROBACION` como estado materializa el freno: la tarea está lista, sabe
qué hacer, y espera el visto bueno.

**Por qué debe existir.** `claveIdempotencia` `UNIQUE` es crítica: **impide que un
reintento del planificador genere cobros o recordatorios duplicados**. Un cron que
se ejecuta dos veces por un problema de infraestructura no puede cobrarle dos veces
a nadie ni mandar el recordatorio dos veces.

---

### `EjecucionTarea` / `ejecucion_tarea`

**Qué es.** El registro de cada ejecución: cuándo, con qué resultado, cuántos
registros afectó.

**Para qué sirve (negocio).** Es la **rendición de cuentas de la automatización**.
Cuando un participante pregunta "¿por qué me aplicaron mora?", la respuesta es:
la tarea de aplicación de mora del 6 de marzo a las 00:15 procesó 47 obligaciones
vencidas, y la tuya era una. Con `detalle` en JSON, se puede reconstruir
exactamente qué hizo.

`resultado = PARCIAL` es realista: una tarea puede procesar 40 de 47 registros y
fallar en 7. Sin ese estado, o se marca éxito (y se ocultan los 7 fallos) o se
marca error (y se pierden los 40 éxitos).

**Por qué debe existir.** **Un sistema que actúa solo sobre el dinero de la gente
tiene que poder explicar cada acción que tomó.** Sin registro de ejecución, la
automatización es una caja negra que mueve plata, y eso es inaceptable.

**A nivel de sistema.** Toda ejecución va también a la bitácora del módulo 9, con
`origen = ORGANIZADOR_DIGITAL` — lo que permite distinguir en la auditoría lo que
hizo el sistema de lo que hizo una persona.

---

## Resumen: qué se cae si se quita cada bloque

| Bloque | Si no existe… |
| --- | --- |
| `Organizador` con límites | Alguien acumula cincuenta grupos y su fracaso arrastra a cientos de personas. |
| `SolicitudOrganizador` + `Requisito` | Se entrega la administración de plata ajena sin filtro ni registro. |
| `ContratoOrganizador` | Deshabilitar a un organizador queda sin fundamento legal. |
| `EsquemaComision` + `Aceptacion` | La comisión es un descuento que aparece en la entrega y que nadie aprobó (viola RN-19). |
| `TopeRegulatorio` | La plataforma queda expuesta a comisiones abusivas cobradas con su marca. |
| `Devengo` separado de `Liquidacion` | Si el grupo se cae, hay que quitarle plata ya pagada al organizador. |
| `RetencionImpuesto` | La plataforma incumple como agente de retención. |
| `EvaluacionDesempeno` + `Metrica` | Un mal organizador sigue acumulando grupos hasta que el daño es grande. |
| `SancionOrganizador` graduada | La única alternativa es tolerar o expulsar; ninguna sirve. |
| `OrganizadorDigital` + reglas | Todo grupo depende de que una persona esté disponible y sea confiable. |
| `TareaAutomatizada` (idempotente) | Un cron ejecutado dos veces cobra dos veces. |
| `EjecucionTarea` | La automatización es una caja negra que mueve plata sin poder explicarse. |
