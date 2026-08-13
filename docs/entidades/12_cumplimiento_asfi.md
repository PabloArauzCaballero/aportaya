# Módulo 12 — Cumplimiento, PLD/FT, Consumidor Financiero y Riesgo Operativo

> **Pregunta de negocio que responde este módulo:**
> *Llega una inspección. Piden el expediente de un cliente, el detalle de por qué
> no se reportó una operación, la constancia de que el tarifario estaba publicado,
> el plazo en que se respondió un reclamo y cuánto se perdió el año pasado por
> errores operativos. ¿Se puede responder todo eso con datos, hoy, sin armar nada
> a mano?*

Los módulos 10 y 11 hacen que la plataforma custodie dinero y cobre por hacerlo.
Este módulo es el precio de esas dos cosas: el conjunto de controles que un
supervisor financiero espera encontrar **implementados**, no descritos.

El principio que gobierna el módulo:

> **Cumplir no es tener políticas escritas: es poder demostrar que se ejecutaron.**
> Todo control que no deja fila no existe para el supervisor. Por eso acá cada
> control tiene su tabla: quién lo ejecutó, cuándo, sobre quién, con qué resultado
> y quién lo revisó.

> [!warning] Sobre las citas normativas
> Las columnas `base_normativa`, `fuente_normativa` y `base_legal` existen
> justamente para que el área legal cargue la referencia exacta —artículo,
> resolución, circular— de cada límite, tipología, plazo y umbral. **El modelo no
> cablea ninguna cifra regulatoria**: las carga como dato con vigencia, porque las
> cifras cambian y la fecha en que cambiaron importa. Los valores concretos
> (umbrales de reporte, plazos de respuesta, períodos de conservación) deben ser
> confirmados con asesoría legal antes de sembrar el catálogo.

---

## Los cuatro circuitos

| Circuito | Pregunta que responde | Cadena de entidades |
| --- | --- | --- |
| **Conocer** | ¿a quién le estoy dando una cuenta? | matriz de riesgo → calificación → debida diligencia → expediente |
| **Vigilar** | ¿esta operación tiene sentido para esta persona? | regla de monitoreo → alerta → caso → reporte |
| **Reportar** | ¿mandé lo que tenía que mandar, a tiempo? | catálogo → reporte → envío → observación |
| **Responder** | ¿atendí al cliente en plazo y bien? | punto de reclamo → reclamo → instancia → resolución |

Y un quinto, transversal: **riesgo operativo y control interno**, que mide cuánto
cuesta hacer las cosas mal y obliga a remediarlo con plazo y responsable.

---

## Paquete: Conocimiento del cliente

### `MatrizRiesgoLft` / `matriz_riesgo_lft` y `FactorRiesgoEvaluado` / `factor_riesgo_evaluado`

**Qué son.** Los factores con los que se puntúa el riesgo de un cliente y el
resultado de evaluar cada uno.

**Para qué sirven (negocio).** El riesgo no se decide "a ojo": se calcula sobre
cuatro dimensiones —cliente, producto, canal y zona geográfica— con factores
ponderados. Que la matriz sea una tabla versionada permite dos cosas que un
supervisor pide siempre: **explicar por qué este cliente es de riesgo alto** y
**demostrar qué criterio regía cuando se lo calificó**.

`factor_riesgo_evaluado` guarda el detalle: no solo "puntaje 72", sino "actividad
económica: cambista → 25 puntos; zona: frontera → 20 puntos". Sin ese detalle, la
calificación es un número que nadie puede defender.

---

### `CalificacionRiesgoCliente` / `calificacion_riesgo_cliente` — Raíz de agregado

**Qué es.** El nivel de riesgo vigente de un cliente y lo que ese nivel exige.

**Para qué sirve (negocio).** Es **la pieza que conecta cumplimiento con
producto**. De ella dependen:

- el tipo de debida diligencia exigida,
- los [[limite_operativo_billetera]] que aplican (M10),
- la periodicidad de revisión,
- la sensibilidad del monitoreo.

Eso convierte la verificación en algo con valor para el usuario: subir de nivel no
es un trámite burocrático, es lo que le permite operar más. Y convierte el
cumplimiento en algo automático: cambiar la calificación cambia los límites sin
que nadie toque una configuración.

**A nivel de sistema.** Restricción de exclusión: una sola calificación vigente por
usuario en cada momento. Las anteriores **no se borran**: hay que poder probar en
qué nivel estaba el cliente el día de una operación cuestionada.

---

### `DebidaDiligencia` / `debida_diligencia` — Raíz de agregado

**Qué es.** El expediente de conocimiento del cliente, por nivel.

**Para qué sirve (negocio).** Cinco niveles —simplificada, estándar, ampliada,
reforzada y continua— porque no todos los clientes justifican el mismo esfuerzo.
Una persona que abre cuenta para aportar Bs 300 al mes no puede pasar por el mismo
proceso que una que mueve Bs 80.000: exigirle lo mismo es perder al primero sin
controlar mejor al segundo.

`documentos_requeridos` vs `documentos_recibidos` en JSON permite que el
requerimiento documental sea **configurable por nivel** y que la app muestre
exactamente qué falta.

`segunda_revision_por` implementa el principio de cuatro ojos: en debida diligencia
reforzada, quien aprueba no puede ser quien recolectó.

**Por qué debe existir separada de [[verificacion_kyc]] (M1).** Porque la
verificación KYC es un acto técnico —validar que el documento es real y la persona
es quien dice ser— y la debida diligencia es un proceso de cumplimiento con
vigencia, revisión periódica, aprobación y vencimiento. Fusionarlas hace imposible
representar "el KYC está bien pero la debida diligencia venció".

---

### `PerfilTransaccional` / `perfil_transaccional` y `DesvioPerfil` / `desvio_perfil`

**Qué son.** Lo que el cliente declaró que iba a mover, y lo que efectivamente
movió.

**Para qué sirven (negocio).** Esta es la base de todo el monitoreo con sentido.
Sin perfil declarado, la única forma de detectar algo raro es por umbrales
absolutos, que generan miles de falsos positivos. Con perfil, "Bs 40.000 este mes"
es normal para un comerciante y una alerta seria para un asalariado que declaró
Bs 3.000.

`tipo` distingue `DECLARADO` de `OBSERVADO`: el segundo se recalcula solo con el
comportamiento real, y compararlos es exactamente lo que produce el desvío.

**Por qué deben existir.** Porque la pregunta del supervisor no es "¿tienen
alertas?", es "¿cómo saben que esta operación es coherente con este cliente?".

---

### `DeclaracionPep` / `declaracion_pep`, `BeneficiarioFinal` / `beneficiario_final`, `DeclaracionOrigenFondos` / `declaracion_origen_fondos`

**Qué son.** Las tres declaraciones que el marco de prevención exige y que casi
ningún sistema casero modela.

**Para qué sirven (negocio).**
- **PEP**: si el cliente es una persona expuesta políticamente —o familiar o
  allegado— la relación exige debida diligencia reforzada y aprobación de nivel
  superior. Guardar cargo, institución, país y período es lo que permite saber
  cuándo deja de serlo.
- **Beneficiario final**: quién controla realmente. Aplica sobre todo cuando el
  titular es una organización, una asociación o un grupo con personería.
- **Origen de fondos**: para operaciones sobre umbral, la declaración de dónde
  salió la plata, con documento de respaldo y su hash.

**Por qué deben existir.** Porque son exactamente los tres papeles que se piden en
una inspección, y porque cuando aparece un problema con un cliente, la primera
pregunta es "¿le preguntaron?". Sin estas tablas la respuesta es "verbalmente".

---

### `RevisionPeriodicaKyc` / `revision_periodica_kyc` y `ExpedienteCliente` / `expediente_cliente`

**Qué son.** La agenda de actualización y el legajo completo.

**Para qué sirven (negocio).** El conocimiento del cliente **se vence**. La
revisión periódica se programa según el nivel de riesgo (más riesgo, más frecuente)
y queda visible cuando está atrasada. El expediente consolida qué documentos hay,
qué completitud tiene y hasta cuándo hay que conservarlo. El período de conservación
es largo —no menor a **diez años** para los libros y documentos de las operaciones,
contados desde la fecha del último asiento contable, según la Ley de Servicios
Financieros— y por eso `retencion_hasta` se calcula y se guarda por expediente en
lugar de aplicarse una regla global que nadie puede auditar.

`retencion_hasta` es también lo que hace compatible el derecho a la eliminación de
datos personales con la obligación de conservación: [[proceso_anonimizacion]] (M9)
consulta esta fecha antes de borrar.

---

## Paquete: Monitoreo y reporte de operaciones

### `ReglaMonitoreoLft` / `regla_monitoreo_lft` — Política configurable

**Qué es.** Una tipología de operación inusual, expresada como dato.

**Para qué sirve (negocio).** Detectar patrones: fraccionamiento para no llegar al
umbral de registro, entrada y salida inmediata del mismo monto, circularidad entre
cuentas del mismo círculo, uso de un grupo de pasanaku como pantalla para mover
plata entre desconocidos.

La expresión es `JSONB` declarativo y `accion_automatica` decide qué hacer: solo
alertar, retener la operación o bloquear la cuenta. **Cuando el regulador publica
una tipología nueva, se carga una fila**; no se despliega software. Y
`fuente_normativa` deja constancia de de dónde salió cada regla.

**Por qué debe existir.** Porque las tipologías cambian dos o tres veces al año y
porque el supervisor pregunta específicamente "¿qué tipologías tienen
parametrizadas?". Un `if` en el código no es una respuesta.

---

### `AlertaMonitoreoLft` / `alerta_monitoreo_lft` y `CasoInvestigacionLft` / `caso_investigacion_lft`

**Qué son.** La detección y la investigación.

**Para qué sirven (negocio).** Están separadas a propósito: una alerta es
automática y barata; un caso es humano y caro. Varias alertas del mismo cliente se
agrupan en un caso, el analista investiga y **decide**: descartar, mantener bajo
monitoreo reforzado, reportar a la autoridad o terminar la relación.

Lo importante es que **descartar también deja rastro**: `conclusion` es
obligatoria. Un sistema donde las alertas se cierran sin justificación es peor que
uno sin alertas, porque documenta que se vio y no se hizo nada.

`plazo_limite` en el caso obliga a que la investigación tenga fecha de vencimiento.

**A nivel de sistema.** El caso se enlaza con [[reporte_operacion_sospechosa]]
(M9), que ya existía: este módulo no duplica el reporte, le construye el
expediente que lo sostiene.

---

### `UmbralReporteUif` / `umbral_reporte_uif` — Política configurable

**Qué es.** Cada inciso del instructivo de la unidad de inteligencia financiera,
convertido en una fila.

**Para qué sirve (negocio).** El régimen de reporte por umbral no es un número: es
una tabla de casos, cada uno con su formulario, su concepto de operación, si es por
operación individual o acumulada, su monto en dólares, su ventana en días
calendario y si exige declarar origen y destino de los fondos. Modelarlo como dato
tiene tres consecuencias prácticas:

1. **Cuando la autoridad cambia un umbral, es un `INSERT` con vigencia.** Y los
   cambios ocurren: el régimen vigente incorporó un umbral específico para
   billeteras móviles —carga y retiro acumulados desde USD 1.000 en ventanas de
   1 a 3 días calendario— que antes no existía.
2. **Se puede demostrar qué umbral regía el día de una operación**, porque la fila
   vieja conserva su vigencia en lugar de ser sobrescrita.
3. `base_normativa` guarda el artículo e inciso exactos, que es lo que se cita en
   una inspección.

---

### `RegistroOperacionRelevante` / `registro_operacion_relevante` — append-only

**Qué es.** El registro de toda operación que activa una obligación de reporte por
umbral.

**Para qué sirve (negocio).** Hay operaciones que se registran y se reportan **por
monto, sin que haya nada sospechoso**. Es una obligación distinta del reporte de
operación sospechosa y hay que poder demostrar las dos por separado: una es
objetiva y automática, la otra es subjetiva y fundada.

Tres columnas que parecen detalle y son el núcleo del cumplimiento:

- **`operacion_inicio_ventana_id`** implementa la regla de reinicio: *"se considera
  como inicio la operación posterior a la última que hubiera superado el umbral"*.
  Sin esa referencia, la acumulación se calcula mal y se reporta de menos o de más.
- **`monto_equivalente_usd` + `tipo_cambio_aplicado`**: los umbrales están en
  dólares y las operaciones ocurren en bolivianos. Guardar la conversión y su tipo
  de cambio hace el cálculo reproducible dos años después.
- **`periodo_remision`**: alimenta el envío mensual. La obligación no es solo
  reportar: es reportar **hasta el día 15 del mes siguiente**, y si no hubo ninguna
  operación, informar igual que no la hubo — de ahí `reporte_regulatorio.reporte_en_cero`.

`exento` + `motivo_exencion` cubren los casos que la norma excluye expresamente
(operativa propia entre entidades reguladas, pagos de servicios básicos,
impuestos, bonos sociales, pagos con tarjeta). Sin esas columnas, un exento se ve
igual que un olvido.

---

### `CatalogoReporteRegulatorio` / `catalogo_reporte_regulatorio`, `ReporteRegulatorio` / `reporte_regulatorio`, `EnvioRegulatorio` / `envio_regulatorio`, `ObservacionRegulatoria` / `observacion_regulatoria`

**Qué son.** La agenda de reportes obligatorios y el rastro de cada envío.

**Para qué sirven (negocio).** Una entidad supervisada envía información
periódica: diaria, mensual, trimestral. El catálogo define **qué se debe enviar, a
quién, con qué periodicidad, en qué formato y con qué plazo**. A partir de ahí el
sistema genera los vencimientos solo, y un reporte no enviado es visible antes de
vencer, no después.

El envío guarda `numero_constancia`: la prueba de que se envió. La observación
guarda lo que el organismo devolvió —observación, instrucción, multa o
requerimiento— con su plazo de respuesta.

**Por qué deben existir.** Porque el incumplimiento más común y más caro no es
hacer las cosas mal: es **no mandar a tiempo**. Un calendario en una planilla no
sobrevive a la primera rotación de personal.

---

### `RequerimientoAutoridad` / `requerimiento_autoridad` — Raíz de agregado

**Qué es.** Cada oficio recibido de una autoridad.

**Para qué sirve (negocio).** Llegan oficios: de fiscalía, de juzgados, de la
unidad de inteligencia financiera, del supervisor. Cada uno tiene plazo, alcance y
consecuencia. Si ordena inmovilizar fondos, genera un [[bloqueo_saldo]] (M10); si
pide información, genera un [[registro_acceso_datos]] (M9).

**Por qué debe existir.** Porque **nunca se ejecuta una orden sin el documento que
la respalda**, y porque el día que el titular reclame por qué le congelaron el
saldo, la respuesta tiene que ser el número de oficio, no "nos lo pidieron".

---

## Paquete: Consumidor financiero

### `ContratoAdhesion` / `contrato_adhesion` y `AceptacionContrato` / `aceptacion_contrato`

**Qué son.** El contrato modelo y la prueba de que cada usuario lo aceptó.

**Para qué sirven (negocio).** Los contratos de adhesión de servicios financieros
tienen forma reglada y suelen requerir registro previo ante el supervisor. El
modelo guarda versión, hash, número de registro y vigencia.

La aceptación guarda IP, dispositivo, token de firma y hash de evidencia: eso es lo
que convierte un clic en una aceptación oponible. Sin esa fila, el consentimiento
del usuario es una afirmación de la empresa.

---

### `DocumentoPublicado` / `documento_publicado`

**Qué es.** El registro de qué documentos estuvieron publicados y desde cuándo.

**Para qué sirve (negocio).** Tarifario, contrato, política de privacidad, canales
de reclamo y horarios de atención deben estar publicados y accesibles. La
obligación no es solo publicarlos: es **poder demostrar que estuvieron publicados
en una fecha determinada**. `hash_documento` + vigencias responden eso.

**Por qué debe existir.** Porque "el tarifario siempre estuvo en la web" no es
demostrable si la web se actualiza en el lugar. Con esta tabla, sí.

---

### `PuntoReclamo` / `punto_reclamo`, `ReclamoCliente` / `reclamo_cliente`, `InstanciaReclamo` / `instancia_reclamo`

**Qué son.** El canal de reclamos, el reclamo y su escalamiento.

**Para qué sirven (negocio).** La atención de reclamos es uno de los aspectos más
vigilados de la relación con el consumidor financiero, y uno de los más fáciles de
hacer mal. Tres decisiones del modelo:

1. **El plazo se guarda, no se calcula.** `plazo_respuesta` se fija al ingresar el
   reclamo. Si la norma cambia el plazo el mes que viene, los reclamos viejos
   conservan el plazo que les regía. Un plazo calculado al vuelo reescribe la
   historia.
2. **El escalamiento es una entidad, no un estado.** Un reclamo puede subir a la
   defensoría del consumidor financiero, al supervisor, a arbitraje o a la vía
   judicial, y cada instancia tiene expediente, resolución y monto resarcido
   propios.
3. **Un reclamo favorable con monto exige una devolución asociada.** No se puede
   cerrar diciendo "le dimos la razón" sin que exista la
   [[devolucion_comision]] (M11) o la transacción de resarcimiento (M10). Eso
   cierra el circuito entre reconocer el error y repararlo.

**Por qué deben existir.** Porque la tasa de reclamos resueltos a favor del cliente
es el indicador que mira el supervisor: si sube, hay un problema de producto, no de
atención. Y ese indicador no se puede calcular sin estas tablas.

---

## Paquete: Riesgo operativo y control interno

### `EventoRiesgoOperativo` / `evento_riesgo_operativo` — append-only

**Qué es.** La base de datos de pérdidas por errores, fallas y fraudes.

**Para qué sirve (negocio).** Poner número a lo que cuesta hacer las cosas mal.
Cada descuadre de custodia (M10), cada reverso por error operativo, cada
acreditación duplicada y cada caída con impacto monetario entra acá con su pérdida
bruta, su recuperación y su pérdida neta.

`categoria_basilea` y `linea_negocio` permiten comparar con estándares y armar los
reportes de gestión de riesgo operativo.

**Por qué debe existir.** Porque sin base de pérdidas, la discusión sobre invertir
en controles es una discusión de opiniones. Con base de pérdidas, es una discusión
de números: *"la conciliación manual nos costó Bs 40.000 el año pasado"*.

---

### `ControlInterno` / `control_interno` y `PruebaControl` / `prueba_control`

**Qué son.** El inventario de controles y la evidencia de que se ejecutan.

**Para qué sirven (negocio).** Un control que nadie prueba es un control que no
existe. `prueba_control` guarda período, tamaño de muestra, excepciones
encontradas y resultado —efectivo, deficiente o no efectivo—, que es exactamente el
formato en el que auditoría interna y externa trabajan.

---

### `HallazgoAuditoria` / `hallazgo_auditoria` y `PlanAccionRiesgo` / `plan_accion_riesgo`

**Qué son.** Lo que se encontró mal y lo que se va a hacer al respecto.

**Para qué sirven (negocio).** Un hallazgo sin responsable y sin plazo no se
corrige. El plan de acción tiene responsable, fecha comprometida, porcentaje de
avance y evidencia de cierre. Los hallazgos vencidos son visibles y **son
exactamente lo primero que revisa una inspección de seguimiento**.

---

### `EvaluacionRiesgoProducto` / `evaluacion_riesgo_producto`

**Qué es.** El análisis de riesgo previo al lanzamiento de un producto o canal
nuevo.

**Para qué sirve (negocio).** Antes de habilitar, por ejemplo, transferencias entre
personas sin límite, o pasanakus entre desconocidos, hay que evaluar qué riesgos
de lavado y de fraude introduce eso y qué controles lo mitigan. Guardar la
evaluación con su aprobación es lo que permite lanzar sin que el lanzamiento sea la
observación del año siguiente.

---

### `OficialCumplimiento` / `oficial_cumplimiento` y `CapacitacionCumplimiento` / `capacitacion_cumplimiento`

**Qué son.** La designación del responsable y la formación obligatoria del personal.

**Para qué sirven (negocio).** Son dos requisitos formales que siempre se piden y
que siempre se responden con papeles sueltos: quién es el oficial de cumplimiento
—titular y suplente—, desde cuándo, con qué acta y si se comunicó al organismo; y
quién recibió capacitación, sobre qué tema, cuántas horas y con qué resultado.

Tenerlos como tablas convierte "sí, capacitamos" en un reporte con nombres y
fechas.

---

## Paquete: Gobierno, licencia, seguridad y continuidad

Este paquete se agregó tras contrastar el modelo contra la normativa real. Cubre
lo que un supervisor pide y que ninguna de las tablas anteriores respondía.

### `LicenciaRegulatoria` / `licencia_regulatoria` — Raíz de agregado

**Qué es.** El estado de habilitación de la empresa ante el regulador.

**Para qué sirve (negocio).** Operar sin licencia es el riesgo número uno de este
producto, por encima de cualquier bug. El régimen vigente para empresas de
tecnología financiera exige primero un **certificado de adecuación** y después una
**licencia de funcionamiento**, con categorías de actividad definidas —pagos y
plataformas de pago es la que corresponde a este producto— y con plazo de
adecuación para quien ya está operando.

`alcance_autorizado` en JSON es la parte accionable: **la aplicación consulta esta
tabla antes de habilitar un servicio**, en vez de confiar en que alguien recuerde
qué quedó autorizado. Lanzar una función fuera del alcance deja de ser posible por
descuido.

---

### `EntornoPruebaRegulado` / `entorno_prueba_regulado`

**Qué es.** El sandbox: probar un servicio nuevo bajo supervisión, con límites.

**Para qué sirve (negocio).** Permite lanzar algo que todavía no está en la
licencia, con tope de usuarios, tope de monto por operación, garantía constituida y
plazo. Que esos límites sean columnas permite que el sistema los haga cumplir solo,
que es la única forma de no salirse del sandbox sin darse cuenta.

---

### `ComiteGobierno` / `comite_gobierno`, `ActaComite` / `acta_comite`, `PoliticaInterna` / `politica_interna`, `DesignacionRegulatoria` / `designacion_regulatoria`

**Qué son.** El aparato de gobierno: comités, actas, manuales y designaciones.

**Para qué sirven (negocio).** Esto no es burocracia decorativa: en la práctica
supervisora, **un manual sin acta de aprobación se considera inexistente**, y la
ausencia de manuales de procedimientos es una falta administrativa sancionable.
`acta_comite` guarda asistentes, quórum, temas y decisiones con hash del documento;
`politica_interna` versiona cada manual con su fecha de próxima revisión;
`designacion_regulatoria` unifica quién es oficial de cumplimiento, responsable de
seguridad de la información, responsable de riesgos, auditor interno y responsable
del punto de reclamo, con acta y fecha de comunicación al organismo.

---

### `ActivoInformacion` / `activo_informacion` e `IncidenteSeguridad` / `incidente_seguridad`

**Qué son.** El inventario clasificado de activos y los incidentes que los afectan.

**Para qué sirven (negocio).** El inventario con propietario, custodio y
clasificación es el punto de partida de cualquier sistema de gestión de seguridad
de la información, y también lo que permite responder "¿dónde están los datos
personales?" sin adivinar: `contiene_datos_personales` es una columna consultable.

En el incidente, `plazo_reporte` se calcula al detectar y **se guarda**: tres
relojes distintos corren en paralelo —contención, reporte al organismo y
notificación a los titulares— y hay que poder demostrar cuál regía ese día.

---

### `PlanContinuidad` / `plan_continuidad` y `PruebaContinuidad` / `prueba_continuidad`

**Qué son.** Los planes de continuidad por proceso crítico y la evidencia de que se
prueban.

**Para qué sirven (negocio).** La norma no pide tener un plan: pide **probarlo y
documentar el resultado en acta**. Por eso la prueba guarda RTO y RPO obtenidos
contra los comprometidos, el tipo de prueba, los hallazgos y el acta donde se
reportó. Un plan sin pruebas registradas es un hallazgo garantizado.

---

### `ContratoTercero` / `contrato_tercero` y `EvaluacionTercero` / `evaluacion_tercero`

**Qué son.** La tercerización y su seguimiento.

**Para qué sirven (negocio).** Una billetera se apoya en terceros críticos:
pasarela, mensajería, nube, antifraude. La responsabilidad frente al cliente **no
se terceriza**, así que hay que registrar quién procesa qué, si accede a datos
personales, en qué país los procesa, con qué cláusulas de confidencialidad,
auditoría y continuidad, y con qué nivel de servicio. La evaluación periódica mide
cumplimiento de acuerdo de nivel de servicio e incidentes atribuibles.

---

## Cómo se conecta con el resto del modelo

| Con | Por dónde | Para qué |
| --- | --- | --- |
| **M1 Identidad** | `usuario_id`, `verificacion_kyc_id`, `dispositivo_id`, `token_firma_id` | la debida diligencia se apoya en el KYC técnico |
| **M8 Incumplimiento** | expedientes y listas internas | riesgo de crédito ≠ riesgo de lavado, pero se informan |
| **M9 Auditoría** | `reporte_operacion_sospechosa_id`, `ticket_soporte_id`, `incidente_operativo_id` | este módulo profundiza lo que M9 dejó planteado |
| **M10 Billetera** | límites por nivel, `bloqueo_saldo_id`, transacciones monitoreadas | el saldo es el objeto que la norma vigila |
| **M11 Tarifas** | `devolucion_comision_id`, tarifario publicado | reclamos por cobros y transparencia de precios |

> [!note] Relación con el módulo 9
> M9 ya tenía [[alerta_cumplimiento]], [[reporte_operacion_sospechosa]],
> [[lista_restrictiva_externa]] y [[umbral_operativo]]. Este módulo **no los
> reemplaza**: les construye alrededor el proceso que los sostiene —matriz,
> calificación, debida diligencia, caso de investigación, reporte periódico y
> descargo—. M9 sigue siendo la capa de auditoría técnica y reportería; M12 es la
> capa de cumplimiento normativo.

---

## Qué habría que poder mostrar en una inspección, y con qué

| Piden | Se responde con |
| --- | --- |
| Manual y matriz de riesgo aplicada | [[matriz_riesgo_lft]] + [[factor_riesgo_evaluado]] |
| Expediente de estos 20 clientes | [[expediente_cliente]] + [[debida_diligencia]] |
| Cómo detectan operaciones inusuales | [[regla_monitoreo_lft]] con `fuente_normativa` |
| Alertas del último trimestre y su tratamiento | [[alerta_monitoreo_lft]] + [[caso_investigacion_lft]] |
| Reportes enviados y constancias | [[reporte_regulatorio]] + [[envio_regulatorio]] |
| Reclamos y plazos de respuesta | [[reclamo_cliente]] + [[instancia_reclamo]] |
| Tarifario publicado y aviso de cambios | [[documento_publicado]] + `cambio_tarifario` (M11) |
| Respaldo del dinero de los usuarios | [[conciliacion_custodia]] (M10) |
| Pérdidas operativas del período | [[evento_riesgo_operativo]] |
| Designación del oficial de cumplimiento | [[oficial_cumplimiento]] |

Ninguna de esas respuestas requiere armar nada: son consultas.
