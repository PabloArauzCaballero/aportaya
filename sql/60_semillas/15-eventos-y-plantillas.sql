-- Qué avisa la plataforma, por qué canal y con qué texto. El catálogo de eventos notificables decide qué es suprimible y qué no; las plantillas versionadas son el texto exacto que le llega al cliente.
-- GENERADO desde seeders/minimos/15-eventos-y-plantillas.json — no editar a mano.

-- Seguridad: nunca se agrupan, nunca se suprimen y no esperan ventana de deduplicación larga. Si el aviso no sale, el usuario no se entera de que le tomaron la cuenta.
INSERT INTO evento_notificable (tipo, descripcion, categoria, es_obligatorio, prioridad, es_transaccional, permite_agrupacion, ventana_deduplicacion_min, canales_permitidos, cadena_respaldo, activo) VALUES
  ('INICIO_SESION_NUEVO_DISPOSITIVO', 'Se inició sesión desde un dispositivo no reconocido', 'SEGURIDAD', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,CORREO', 'PUSH>WHATSAPP>SMS', TRUE),
  ('SEGUNDO_FACTOR_SOLICITADO', 'Código de verificación de un solo uso', 'SEGURIDAD', TRUE, 'CRITICA', TRUE, FALSE, 0, 'SMS,WHATSAPP', 'WHATSAPP>SMS', TRUE),
  ('CONTRASENA_CAMBIADA', 'La contraseña de acceso fue modificada', 'SEGURIDAD', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,CORREO,SMS', 'CORREO>SMS', TRUE),
  ('TELEFONO_CAMBIADO', 'El teléfono de la cuenta fue modificado — se avisa al número anterior', 'SEGURIDAD', TRUE, 'CRITICA', TRUE, FALSE, 0, 'SMS,CORREO', 'SMS>CORREO', TRUE),
  ('DISPOSITIVO_AUTORIZADO', 'Se autorizó un dispositivo nuevo para operar', 'SEGURIDAD', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,CORREO', 'PUSH>WHATSAPP', TRUE),
  ('CUENTA_BLOQUEADA', 'La cuenta quedó bloqueada por intentos fallidos o por decisión de riesgo', 'SEGURIDAD', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,CORREO', 'PUSH>WHATSAPP>SMS', TRUE)
ON CONFLICT (tipo) DO NOTHING;

-- Transaccionales: cada movimiento de dinero se avisa. El comprobante que el cliente guarda sale de acá.
INSERT INTO evento_notificable (tipo, descripcion, categoria, es_obligatorio, prioridad, es_transaccional, permite_agrupacion, ventana_deduplicacion_min, canales_permitidos, cadena_respaldo, activo) VALUES
  ('RECARGA_ACREDITADA', 'Se acreditó saldo en la billetera', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 5, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('APORTE_ACREDITADO', 'El aporte al grupo quedó acreditado y conciliado', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 5, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('APORTE_RECHAZADO', 'El intento de pago del aporte fue rechazado', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 15, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('TRANSFERENCIA_RECIBIDA', 'Recibiste saldo de otra billetera', 'TRANSACCIONAL', TRUE, 'NORMAL', TRUE, FALSE, 5, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('RETIRO_EJECUTADO', 'El retiro salió hacia la cuenta de destino', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 5, 'PUSH,WHATSAPP,CORREO,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('RETIRO_FALLIDO', 'El desembolso fue rechazado por el banco y el saldo volvió a la billetera', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,CORREO', 'PUSH>WHATSAPP>SMS', TRUE),
  ('ENTREGA_ACREDITADA', 'Cobraste tu turno: la bolsa está acreditada', 'TRANSACCIONAL', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,IN_APP', 'PUSH>WHATSAPP>SMS', TRUE),
  ('REVERSO_APLICADO', 'Se reversó una operación de tu billetera', 'TRANSACCIONAL', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,CORREO', 'PUSH>WHATSAPP', TRUE),
  ('COMISION_COBRADA', 'Se cobró una comisión y se emitió el documento tributario', 'TRANSACCIONAL', TRUE, 'NORMAL', TRUE, TRUE, 60, 'PUSH,CORREO,IN_APP', 'CORREO>PUSH', TRUE),
  ('FACTURA_EMITIDA', 'Tu factura electrónica está disponible', 'TRANSACCIONAL', TRUE, 'NORMAL', TRUE, TRUE, 1440, 'CORREO,IN_APP', 'CORREO', TRUE)
ON CONFLICT (tipo) DO NOTHING;

-- Cobranza: sí se agrupan y sí cuentan contra el tope de contactos por semana de la estrategia de cobranza (archivo 18).
INSERT INTO evento_notificable (tipo, descripcion, categoria, es_obligatorio, prioridad, es_transaccional, permite_agrupacion, ventana_deduplicacion_min, canales_permitidos, cadena_respaldo, activo) VALUES
  ('APORTE_POR_VENCER', 'Falta poco para el vencimiento del aporte', 'COBRANZA', FALSE, 'NORMAL', FALSE, TRUE, 720, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('APORTE_VENCIDO', 'El aporte venció y entró en mora', 'COBRANZA', TRUE, 'ALTA', FALSE, TRUE, 720, 'PUSH,WHATSAPP,SMS,IN_APP', 'PUSH>WHATSAPP>SMS', TRUE),
  ('MORA_APLICADA', 'Se aplicó el recargo por mora previsto en el reglamento', 'COBRANZA', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('COBERTURA_APLICADA', 'El fondo de garantía cubrió tu aporte y quedó una deuda a tu nombre', 'COBRANZA', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,CORREO', 'PUSH>WHATSAPP>SMS', TRUE),
  ('PROMESA_DE_PAGO_POR_VENCER', 'Vence la fecha que comprometiste para regularizar', 'COBRANZA', FALSE, 'NORMAL', FALSE, TRUE, 1440, 'PUSH,WHATSAPP,SMS', 'WHATSAPP>SMS', TRUE),
  ('PLAN_REGULARIZACION_APROBADO', 'Se aprobó tu plan de regularización con su cronograma', 'COBRANZA', TRUE, 'NORMAL', FALSE, FALSE, 0, 'PUSH,WHATSAPP,CORREO', 'CORREO>WHATSAPP', TRUE)
ON CONFLICT (tipo) DO NOTHING;

-- Regulatorios y de debido proceso: la notificación es parte del acto. Si no se probó el envío, el plazo no corre (R-PLZ).
INSERT INTO evento_notificable (tipo, descripcion, categoria, es_obligatorio, prioridad, es_transaccional, permite_agrupacion, ventana_deduplicacion_min, canales_permitidos, cadena_respaldo, activo) VALUES
  ('RECLAMO_RECIBIDO', 'Se registró tu reclamo con su código y su plazo de respuesta', 'REGULATORIA', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,CORREO,SMS', 'CORREO>WHATSAPP>SMS', TRUE),
  ('RECLAMO_RESUELTO', 'Hay respuesta a tu reclamo y podés recurrir a segunda instancia', 'REGULATORIA', TRUE, 'ALTA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,CORREO,SMS', 'CORREO>WHATSAPP>SMS', TRUE),
  ('TARIFARIO_MODIFICADO', 'Preaviso de cambio de tarifario con la fecha desde la que rige', 'REGULATORIA', TRUE, 'ALTA', FALSE, FALSE, 0, 'PUSH,WHATSAPP,CORREO,IN_APP', 'CORREO>WHATSAPP', TRUE),
  ('CONTRATO_MODIFICADO', 'Preaviso de modificación del contrato de adhesión', 'REGULATORIA', TRUE, 'ALTA', FALSE, FALSE, 0, 'PUSH,WHATSAPP,CORREO,IN_APP', 'CORREO>WHATSAPP', TRUE),
  ('REVISION_KYC_REQUERIDA', 'Toca actualizar tus datos para seguir operando', 'REGULATORIA', TRUE, 'ALTA', FALSE, FALSE, 10080, 'PUSH,WHATSAPP,CORREO,IN_APP', 'PUSH>WHATSAPP>CORREO', TRUE),
  ('CUENTA_RESTRINGIDA_CUMPLIMIENTO', 'Se restringió la operativa por una revisión de cumplimiento', 'REGULATORIA', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,CORREO,IN_APP', 'CORREO>PUSH', TRUE),
  ('DESCARGO_HABILITADO', 'Se te imputó un incumplimiento y tenés plazo para presentar descargo', 'REGULATORIA', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,CORREO', 'CORREO>WHATSAPP>SMS', TRUE),
  ('SANCION_NOTIFICADA', 'Se resolvió una sanción y corre el plazo de apelación', 'REGULATORIA', TRUE, 'CRITICA', TRUE, FALSE, 0, 'PUSH,WHATSAPP,SMS,CORREO', 'CORREO>WHATSAPP>SMS', TRUE)
ON CONFLICT (tipo) DO NOTHING;

-- Vida del grupo y avisos comerciales: los únicos que el usuario puede apagar sin perder información obligatoria.
INSERT INTO evento_notificable (tipo, descripcion, categoria, es_obligatorio, prioridad, es_transaccional, permite_agrupacion, ventana_deduplicacion_min, canales_permitidos, cadena_respaldo, activo) VALUES
  ('INVITACION_A_GRUPO', 'Te invitaron a un grupo de pasanaku', 'COMERCIAL', FALSE, 'NORMAL', FALSE, TRUE, 1440, 'PUSH,WHATSAPP,SMS', 'WHATSAPP>SMS', TRUE),
  ('GRUPO_COMPLETO', 'El grupo llenó sus cupos y arranca', 'COMERCIAL', FALSE, 'NORMAL', FALSE, TRUE, 1440, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('SORTEO_REALIZADO', 'Salió el orden de turnos con su semilla verificable', 'COMERCIAL', TRUE, 'ALTA', FALSE, FALSE, 0, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('TURNO_PROXIMO', 'Se acerca tu turno de cobro', 'COMERCIAL', FALSE, 'NORMAL', FALSE, TRUE, 1440, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('ACUERDO_EN_VOTACION', 'El grupo abrió una votación y falta tu voto', 'COMERCIAL', FALSE, 'NORMAL', FALSE, TRUE, 720, 'PUSH,WHATSAPP,IN_APP', 'PUSH>WHATSAPP', TRUE),
  ('INSIGNIA_OTORGADA', 'Ganaste una insignia por tu comportamiento de pago', 'COMERCIAL', FALSE, 'BAJA', FALSE, TRUE, 10080, 'PUSH,IN_APP', 'PUSH', TRUE),
  ('TICKET_ACTUALIZADO', 'Hay novedades en tu consulta de soporte', 'SOPORTE', FALSE, 'BAJA', FALSE, TRUE, 240, 'PUSH,CORREO,IN_APP', 'PUSH>CORREO', TRUE)
ON CONFLICT (tipo) DO NOTHING;

-- Una plantilla por (evento, canal). Las de canal externo nacen en BORRADOR: recién pasan a APROBADA cuando el proveedor devuelve su identificador, y sin `id_plantilla_proveedor` no se pueden enviar.
INSERT INTO plantilla_mensaje (codigo, evento_id, canal, descripcion, categoria_proveedor, estado_aprobacion, id_plantilla_proveedor, activa) VALUES
  ('OTP_SEGUNDO_FACTOR_WA', (SELECT id FROM evento_notificable WHERE tipo = 'SEGUNDO_FACTOR_SOLICITADO'), 'WHATSAPP', 'Código de verificación de un solo uso por WhatsApp', 'AUTHENTICATION', 'BORRADOR', NULL, FALSE),
  ('OTP_SEGUNDO_FACTOR_SMS', (SELECT id FROM evento_notificable WHERE tipo = 'SEGUNDO_FACTOR_SOLICITADO'), 'SMS', 'Código de verificación de un solo uso por SMS', 'AUTHENTICATION', 'BORRADOR', NULL, FALSE),
  ('SEGURIDAD_SESION_NUEVA_PUSH', (SELECT id FROM evento_notificable WHERE tipo = 'INICIO_SESION_NUEVO_DISPOSITIVO'), 'PUSH', 'Aviso de sesión desde dispositivo no reconocido', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('SEGURIDAD_CUENTA_BLOQUEADA_WA', (SELECT id FROM evento_notificable WHERE tipo = 'CUENTA_BLOQUEADA'), 'WHATSAPP', 'Aviso de bloqueo de cuenta con canal de contacto', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('TX_RECARGA_ACREDITADA_PUSH', (SELECT id FROM evento_notificable WHERE tipo = 'RECARGA_ACREDITADA'), 'PUSH', 'Confirmación de recarga acreditada', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('TX_APORTE_ACREDITADO_WA', (SELECT id FROM evento_notificable WHERE tipo = 'APORTE_ACREDITADO'), 'WHATSAPP', 'Confirmación de aporte acreditado con constancia', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('TX_APORTE_RECHAZADO_WA', (SELECT id FROM evento_notificable WHERE tipo = 'APORTE_RECHAZADO'), 'WHATSAPP', 'Aviso de pago rechazado con motivo y reintento', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('TX_ENTREGA_ACREDITADA_WA', (SELECT id FROM evento_notificable WHERE tipo = 'ENTREGA_ACREDITADA'), 'WHATSAPP', 'Aviso de bolsa acreditada con el detalle de deducciones', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('TX_RETIRO_FALLIDO_WA', (SELECT id FROM evento_notificable WHERE tipo = 'RETIRO_FALLIDO'), 'WHATSAPP', 'Aviso de retiro rechazado por el banco con devolución del saldo', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('COB_APORTE_POR_VENCER_WA', (SELECT id FROM evento_notificable WHERE tipo = 'APORTE_POR_VENCER'), 'WHATSAPP', 'Recordatorio de aporte próximo a vencer con enlace de pago', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('COB_APORTE_VENCIDO_WA', (SELECT id FROM evento_notificable WHERE tipo = 'APORTE_VENCIDO'), 'WHATSAPP', 'Aviso de aporte vencido con monto exacto y recargo', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('COB_COBERTURA_APLICADA_WA', (SELECT id FROM evento_notificable WHERE tipo = 'COBERTURA_APLICADA'), 'WHATSAPP', 'Aviso de cobertura del fondo de garantía y deuda generada', 'UTILITY', 'BORRADOR', NULL, FALSE),
  ('REG_RECLAMO_RECIBIDO_CORREO', (SELECT id FROM evento_notificable WHERE tipo = 'RECLAMO_RECIBIDO'), 'CORREO', 'Acuse de reclamo con código, plazo y segunda instancia', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('REG_RECLAMO_RESUELTO_CORREO', (SELECT id FROM evento_notificable WHERE tipo = 'RECLAMO_RESUELTO'), 'CORREO', 'Respuesta motivada al reclamo con vía de recurso', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('REG_DESCARGO_HABILITADO_CORREO', (SELECT id FROM evento_notificable WHERE tipo = 'DESCARGO_HABILITADO'), 'CORREO', 'Notificación de imputación con plazo de descargo', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('REG_TARIFARIO_MODIFICADO_CORREO', (SELECT id FROM evento_notificable WHERE tipo = 'TARIFARIO_MODIFICADO'), 'CORREO', 'Preaviso de cambio de tarifario', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('GRP_SORTEO_REALIZADO_PUSH', (SELECT id FROM evento_notificable WHERE tipo = 'SORTEO_REALIZADO'), 'PUSH', 'Aviso del sorteo con la semilla verificable', 'UTILITY', 'APROBADA', NULL, TRUE),
  ('GRP_INVITACION_WA', (SELECT id FROM evento_notificable WHERE tipo = 'INVITACION_A_GRUPO'), 'WHATSAPP', 'Invitación a un grupo con enlace de un solo uso', 'MARKETING', 'BORRADOR', NULL, FALSE)
ON CONFLICT (codigo) DO NOTHING;

-- El texto es dato versionado: corregir una redacción es publicar la versión 2 y cerrar la 1, para que un envío viejo se pueda reproducir tal como salió.
INSERT INTO version_plantilla (plantilla_id, version, idioma, asunto, cuerpo, variables, botones, url_encabezado_media, vigente_desde, vigente_hasta) VALUES
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'OTP_SEGUNDO_FACTOR_WA'), 1, 'es-BO', NULL, '{{codigo}} es tu código de verificación de AportaYa. Vence en {{minutos}} minutos. No lo compartas con nadie: AportaYa nunca te lo va a pedir por teléfono ni por chat.', '{"codigo": "string", "minutos": "number"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'OTP_SEGUNDO_FACTOR_SMS'), 1, 'es-BO', NULL, 'AportaYa: {{codigo}} es tu codigo. Vence en {{minutos}} min. No lo compartas.', '{"codigo": "string", "minutos": "number"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'SEGURIDAD_SESION_NUEVA_PUSH'), 1, 'es-BO', 'Inicio de sesión nuevo', 'Se inició sesión en tu cuenta desde {{dispositivo}} ({{ciudad}}) el {{fecha_hora}}. Si no fuiste vos, bloqueá la cuenta desde la app ahora mismo.', '{"dispositivo": "string", "ciudad": "string", "fecha_hora": "datetime"}'::jsonb, '[{"tipo": "APP", "texto": "No fui yo", "ruta": "/seguridad/bloquear"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'SEGURIDAD_CUENTA_BLOQUEADA_WA'), 1, 'es-BO', NULL, 'Tu cuenta de AportaYa quedó bloqueada el {{fecha_hora}} por {{motivo}}. Tu saldo está intacto. Para desbloquearla, escribinos o entrá al Punto de Reclamo desde la app.', '{"fecha_hora": "datetime", "motivo": "string"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'TX_RECARGA_ACREDITADA_PUSH'), 1, 'es-BO', 'Saldo acreditado', 'Se acreditaron Bs {{monto}} en tu billetera. Saldo disponible: Bs {{saldo}}. Comprobante {{referencia}}.', '{"monto": "money", "saldo": "money", "referencia": "string"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'TX_APORTE_ACREDITADO_WA'), 1, 'es-BO', NULL, 'Listo, {{nombre}}. Tu aporte de Bs {{monto}} al grupo {{grupo}} ({{periodo}}) quedó acreditado el {{fecha_hora}}. Constancia: {{codigo_verificacion}}.', '{"nombre": "string", "monto": "money", "grupo": "string", "periodo": "string", "fecha_hora": "datetime", "codigo_verificacion": "string"}'::jsonb, '[{"tipo": "URL", "texto": "Ver constancia", "url": "{{url_constancia}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'TX_APORTE_RECHAZADO_WA'), 1, 'es-BO', NULL, '{{nombre}}: tu pago de Bs {{monto}} al grupo {{grupo}} no se pudo procesar ({{motivo}}). No se te descontó nada. Podés reintentar hasta el {{fecha_limite}}.', '{"nombre": "string", "monto": "money", "grupo": "string", "motivo": "string", "fecha_limite": "date"}'::jsonb, '[{"tipo": "URL", "texto": "Reintentar pago", "url": "{{url_pago}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'TX_ENTREGA_ACREDITADA_WA'), 1, 'es-BO', NULL, '{{nombre}}, cobraste tu turno del grupo {{grupo}}. Bolsa: Bs {{bruto}}. Deducciones: Bs {{deducciones}}. Acreditado: Bs {{neto}}. Detalle en la app.', '{"nombre": "string", "grupo": "string", "bruto": "money", "deducciones": "money", "neto": "money"}'::jsonb, '[{"tipo": "URL", "texto": "Ver detalle", "url": "{{url_entrega}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'TX_RETIRO_FALLIDO_WA'), 1, 'es-BO', NULL, '{{nombre}}: el banco rechazó tu retiro de Bs {{monto}} ({{motivo}}). Los Bs {{monto}} ya volvieron a tu billetera. Revisá la cuenta de destino e intentá de nuevo.', '{"nombre": "string", "monto": "money", "motivo": "string"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'COB_APORTE_POR_VENCER_WA'), 1, 'es-BO', NULL, '{{nombre}}, tu aporte de Bs {{monto}} al grupo {{grupo}} vence el {{fecha_vencimiento}}. Podés pagarlo desde la app en un toque.', '{"nombre": "string", "monto": "money", "grupo": "string", "fecha_vencimiento": "date"}'::jsonb, '[{"tipo": "URL", "texto": "Pagar ahora", "url": "{{url_pago}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'COB_APORTE_VENCIDO_WA'), 1, 'es-BO', NULL, '{{nombre}}: tu aporte al grupo {{grupo}} venció el {{fecha_vencimiento}}. Total a pagar hoy: Bs {{total}} (aporte Bs {{monto}} + recargo Bs {{mora}}). Si necesitás otro plazo, escribinos.', '{"nombre": "string", "grupo": "string", "fecha_vencimiento": "date", "total": "money", "monto": "money", "mora": "money"}'::jsonb, '[{"tipo": "URL", "texto": "Pagar ahora", "url": "{{url_pago}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'COB_COBERTURA_APLICADA_WA'), 1, 'es-BO', NULL, '{{nombre}}: el fondo de garantía del grupo {{grupo}} cubrió tu aporte de Bs {{monto}} para que el grupo no se frene. Queda una deuda a tu nombre por Bs {{deuda}}. Podés regularizarla o pedir un plan de pagos.', '{"nombre": "string", "grupo": "string", "monto": "money", "deuda": "money"}'::jsonb, '[{"tipo": "URL", "texto": "Regularizar", "url": "{{url_deuda}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'REG_RECLAMO_RECIBIDO_CORREO'), 1, 'es-BO', 'Recibimos tu reclamo {{codigo_reclamo}}', 'Estimado/a {{nombre}}:

Registramos tu reclamo con el código {{codigo_reclamo}} el {{fecha_recepcion}}.

Te vamos a responder a más tardar el {{fecha_limite}} ({{dias_habiles}} días hábiles). Si la respuesta no te conforma, podés recurrir a segunda instancia ante la Autoridad de Supervisión del Sistema Financiero (ASFI).

Punto de Reclamo AportaYa', '{"nombre": "string", "codigo_reclamo": "string", "fecha_recepcion": "date", "fecha_limite": "date", "dias_habiles": "number"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'REG_RECLAMO_RESUELTO_CORREO'), 1, 'es-BO', 'Respuesta a tu reclamo {{codigo_reclamo}}', 'Estimado/a {{nombre}}:

Sobre tu reclamo {{codigo_reclamo}}, la resolución es: {{resultado}}.

Fundamento: {{motivacion}}

{{detalle_reparacion}}

Si no estás de acuerdo, tenés {{dias_segunda_instancia}} días hábiles para recurrir a segunda instancia ante ASFI.

Punto de Reclamo AportaYa', '{"nombre": "string", "codigo_reclamo": "string", "resultado": "string", "motivacion": "string", "detalle_reparacion": "string", "dias_segunda_instancia": "number"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'REG_DESCARGO_HABILITADO_CORREO'), 1, 'es-BO', 'Tenés plazo para presentar descargo — {{codigo_registro}}', 'Estimado/a {{nombre}}:

Se registró un presunto incumplimiento ({{causal}}) en el grupo {{grupo}} el {{fecha_hecho}}.

Antes de resolver nada, tenés hasta el {{fecha_limite_descargo}} ({{dias_habiles}} días hábiles) para presentar tu descargo y adjuntar la evidencia que quieras.

Si no presentás descargo dentro del plazo, se resuelve con lo que hay en el expediente.

AportaYa', '{"nombre": "string", "codigo_registro": "string", "causal": "string", "grupo": "string", "fecha_hecho": "date", "fecha_limite_descargo": "date", "dias_habiles": "number"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'REG_TARIFARIO_MODIFICADO_CORREO'), 1, 'es-BO', 'Cambio de tarifario desde el {{vigente_desde}}', 'Estimado/a {{nombre}}:

A partir del {{vigente_desde}} rige el tarifario {{version_tarifario}}. Te avisamos con {{dias_preaviso}} días de anticipación, como corresponde.

Cambios: {{resumen_cambios}}

El tarifario completo está publicado en {{url_tarifario}}. Las operaciones anteriores al {{vigente_desde}} conservan la tarifa que tenían congelada.

AportaYa', '{"nombre": "string", "vigente_desde": "date", "version_tarifario": "string", "dias_preaviso": "number", "resumen_cambios": "string", "url_tarifario": "string"}'::jsonb, NULL, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'GRP_SORTEO_REALIZADO_PUSH'), 1, 'es-BO', 'Ya salió el orden de turnos', 'El grupo {{grupo}} sorteó su orden de turnos. Te tocó el turno {{numero_turno}} de {{total_turnos}}. Podés verificar el sorteo con la semilla {{semilla}}.', '{"grupo": "string", "numero_turno": "number", "total_turnos": "number", "semilla": "string"}'::jsonb, '[{"tipo": "APP", "texto": "Verificar sorteo", "ruta": "/grupos/{{grupo_id}}/sorteo"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL),
  ((SELECT id FROM plantilla_mensaje WHERE codigo = 'GRP_INVITACION_WA'), 1, 'es-BO', NULL, '{{invitante}} te invitó al pasanaku "{{grupo}}": Bs {{monto_aporte}} por {{periodicidad}}, {{cupos}} personas. El enlace es de un solo uso y vence el {{fecha_expira}}.', '{"invitante": "string", "grupo": "string", "monto_aporte": "money", "periodicidad": "string", "cupos": "number", "fecha_expira": "date"}'::jsonb, '[{"tipo": "URL", "texto": "Ver invitación", "url": "{{url_invitacion}}"}]'::jsonb, NULL, '2026-01-01T00:00:00-04:00', NULL)
ON CONFLICT (plantilla_id, idioma, version) DO NOTHING;
