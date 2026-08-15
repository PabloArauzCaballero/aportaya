-- Roles y permisos base del control de accesos (M1).
-- GENERADO desde seeders/minimos/10-roles-y-permisos.json — no editar a mano.

INSERT INTO rol (codigo, nombre, ambito, es_sistema) VALUES
  ('ADMIN_PLATAFORMA', 'Administrador de plataforma', 'GLOBAL', TRUE),
  ('OFICIAL_CUMPLIMIENTO', 'Oficial de cumplimiento', 'GLOBAL', TRUE),
  ('ANALISTA_CUMPLIMIENTO', 'Analista de cumplimiento', 'GLOBAL', TRUE),
  ('AUDITOR_INTERNO', 'Auditor interno', 'GLOBAL', TRUE),
  ('RESPONSABLE_RIESGOS', 'Responsable de gestión de riesgos', 'GLOBAL', TRUE),
  ('RESPONSABLE_SEGURIDAD', 'Responsable de seguridad de la información', 'GLOBAL', TRUE),
  ('SOPORTE', 'Soporte y atención al cliente', 'GLOBAL', TRUE),
  ('PUNTO_RECLAMO', 'Responsable del Punto de Reclamo', 'GLOBAL', TRUE),
  ('TESORERIA', 'Tesorería y conciliación', 'GLOBAL', TRUE),
  ('CONTABILIDAD', 'Contabilidad', 'GLOBAL', TRUE),
  ('ORGANIZADOR', 'Organizador de grupo', 'GRUPO', TRUE),
  ('PARTICIPANTE', 'Participante de grupo', 'GRUPO', TRUE)
ON CONFLICT (codigo) DO NOTHING;

-- `requiere_mfa` marca los permisos que exigen segundo factor en el momento de usarlos, no solo al iniciar sesión: todo lo que mueve dinero, publica precios, edita catálogos o lee datos de terceros.
INSERT INTO permiso (codigo, descripcion, recurso, accion, requiere_mfa) VALUES
  ('BILLETERA_VER', 'Ver saldo y movimientos propios', 'billetera', 'LEER', FALSE),
  ('BILLETERA_OPERAR', 'Recargar, transferir y retirar', 'billetera', 'ESCRIBIR', TRUE),
  ('BILLETERA_VER_TERCEROS', 'Ver billeteras de terceros (backoffice)', 'billetera', 'LEER_TERCEROS', TRUE),
  ('GRUPO_CREAR', 'Crear un grupo de pasanaku', 'grupo', 'CREAR', FALSE),
  ('GRUPO_ADMINISTRAR', 'Administrar un grupo', 'grupo', 'ADMINISTRAR', FALSE),
  ('ENTREGA_AUTORIZAR', 'Autorizar una entrega de fondo', 'entrega_fondo', 'AUTORIZAR', TRUE),
  ('ENTREGA_EJECUTAR', 'Ejecutar una entrega de fondo', 'entrega_fondo', 'EJECUTAR', TRUE),
  ('REVERSO_AUTORIZAR', 'Autorizar el reverso de una transacción', 'transaccion_billetera', 'REVERSAR', TRUE),
  ('CUMPLIMIENTO_ALERTAS', 'Ver y tratar alertas de monitoreo', 'alerta_monitoreo_lft', 'GESTIONAR', FALSE),
  ('CUMPLIMIENTO_CASOS', 'Abrir y decidir casos de investigación', 'caso_investigacion_lft', 'GESTIONAR', FALSE),
  ('CUMPLIMIENTO_REPORTAR', 'Generar y enviar reportes regulatorios', 'reporte_regulatorio', 'ENVIAR', TRUE),
  ('RECLAMO_ATENDER', 'Atender y responder reclamos', 'reclamo_cliente', 'GESTIONAR', FALSE),
  ('TARIFARIO_PUBLICAR', 'Publicar un tarifario nuevo', 'tarifario', 'PUBLICAR', TRUE),
  ('CATALOGO_EDITAR', 'Editar catálogos regulatorios', 'catalogo', 'ESCRIBIR', TRUE),
  ('AUDITORIA_LEER', 'Consultar la bitácora y los registros de acceso', 'bitacora_evento', 'LEER', FALSE),
  ('DATOS_SENSIBLES_LEER', 'Consultar documentos y cuentas de clientes', 'documento_identidad', 'LEER', TRUE)
ON CONFLICT (codigo) DO NOTHING;

-- Sin esta matriz los roles no otorgan nada y el guard de denegar por omisión rechaza todo. Dos separaciones de funciones están cableadas acá y no se negocian: quien AUTORIZA una entrega o un reverso no puede EJECUTARLO, y quien edita catálogos no toca dinero ni datos sensibles (control CI-04).
INSERT INTO rol_permiso (rol_id, permiso_id) VALUES
  ((SELECT id FROM rol WHERE codigo = 'ADMIN_PLATAFORMA'), (SELECT id FROM permiso WHERE codigo = 'CATALOGO_EDITAR')),
  ((SELECT id FROM rol WHERE codigo = 'ADMIN_PLATAFORMA'), (SELECT id FROM permiso WHERE codigo = 'TARIFARIO_PUBLICAR')),
  ((SELECT id FROM rol WHERE codigo = 'ADMIN_PLATAFORMA'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'CUMPLIMIENTO_ALERTAS')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'CUMPLIMIENTO_CASOS')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'CUMPLIMIENTO_REPORTAR')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'DATOS_SENSIBLES_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'OFICIAL_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'ANALISTA_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'CUMPLIMIENTO_ALERTAS')),
  ((SELECT id FROM rol WHERE codigo = 'ANALISTA_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'DATOS_SENSIBLES_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'ANALISTA_CUMPLIMIENTO'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'AUDITOR_INTERNO'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'AUDITOR_INTERNO'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'RESPONSABLE_RIESGOS'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'RESPONSABLE_RIESGOS'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'RESPONSABLE_RIESGOS'), (SELECT id FROM permiso WHERE codigo = 'ENTREGA_AUTORIZAR')),
  ((SELECT id FROM rol WHERE codigo = 'RESPONSABLE_RIESGOS'), (SELECT id FROM permiso WHERE codigo = 'REVERSO_AUTORIZAR')),
  ((SELECT id FROM rol WHERE codigo = 'RESPONSABLE_SEGURIDAD'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'TESORERIA'), (SELECT id FROM permiso WHERE codigo = 'ENTREGA_EJECUTAR')),
  ((SELECT id FROM rol WHERE codigo = 'TESORERIA'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'TESORERIA'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'CONTABILIDAD'), (SELECT id FROM permiso WHERE codigo = 'AUDITORIA_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'CONTABILIDAD'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'SOPORTE'), (SELECT id FROM permiso WHERE codigo = 'RECLAMO_ATENDER')),
  ((SELECT id FROM rol WHERE codigo = 'SOPORTE'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'PUNTO_RECLAMO'), (SELECT id FROM permiso WHERE codigo = 'RECLAMO_ATENDER')),
  ((SELECT id FROM rol WHERE codigo = 'PUNTO_RECLAMO'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER_TERCEROS')),
  ((SELECT id FROM rol WHERE codigo = 'PUNTO_RECLAMO'), (SELECT id FROM permiso WHERE codigo = 'DATOS_SENSIBLES_LEER')),
  ((SELECT id FROM rol WHERE codigo = 'ORGANIZADOR'), (SELECT id FROM permiso WHERE codigo = 'GRUPO_CREAR')),
  ((SELECT id FROM rol WHERE codigo = 'ORGANIZADOR'), (SELECT id FROM permiso WHERE codigo = 'GRUPO_ADMINISTRAR')),
  ((SELECT id FROM rol WHERE codigo = 'ORGANIZADOR'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER')),
  ((SELECT id FROM rol WHERE codigo = 'ORGANIZADOR'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_OPERAR')),
  ((SELECT id FROM rol WHERE codigo = 'PARTICIPANTE'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_VER')),
  ((SELECT id FROM rol WHERE codigo = 'PARTICIPANTE'), (SELECT id FROM permiso WHERE codigo = 'BILLETERA_OPERAR'))
ON CONFLICT (rol_id, permiso_id) DO NOTHING;
