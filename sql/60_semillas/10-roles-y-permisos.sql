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

INSERT INTO permiso (codigo, descripcion, recurso, accion) VALUES
  ('BILLETERA_VER', 'Ver saldo y movimientos propios', 'billetera', 'LEER'),
  ('BILLETERA_OPERAR', 'Recargar, transferir y retirar', 'billetera', 'ESCRIBIR'),
  ('BILLETERA_VER_TERCEROS', 'Ver billeteras de terceros (backoffice)', 'billetera', 'LEER_TERCEROS'),
  ('GRUPO_CREAR', 'Crear un grupo de pasanaku', 'grupo', 'CREAR'),
  ('GRUPO_ADMINISTRAR', 'Administrar un grupo', 'grupo', 'ADMINISTRAR'),
  ('ENTREGA_AUTORIZAR', 'Autorizar una entrega de fondo', 'entrega_fondo', 'AUTORIZAR'),
  ('ENTREGA_EJECUTAR', 'Ejecutar una entrega de fondo', 'entrega_fondo', 'EJECUTAR'),
  ('REVERSO_AUTORIZAR', 'Autorizar el reverso de una transacción', 'transaccion_billetera', 'REVERSAR'),
  ('CUMPLIMIENTO_ALERTAS', 'Ver y tratar alertas de monitoreo', 'alerta_monitoreo_lft', 'GESTIONAR'),
  ('CUMPLIMIENTO_CASOS', 'Abrir y decidir casos de investigación', 'caso_investigacion_lft', 'GESTIONAR'),
  ('CUMPLIMIENTO_REPORTAR', 'Generar y enviar reportes regulatorios', 'reporte_regulatorio', 'ENVIAR'),
  ('RECLAMO_ATENDER', 'Atender y responder reclamos', 'reclamo_cliente', 'GESTIONAR'),
  ('TARIFARIO_PUBLICAR', 'Publicar un tarifario nuevo', 'tarifario', 'PUBLICAR'),
  ('CATALOGO_EDITAR', 'Editar catálogos regulatorios', 'catalogo', 'ESCRIBIR'),
  ('AUDITORIA_LEER', 'Consultar la bitácora y los registros de acceso', 'bitacora_evento', 'LEER'),
  ('DATOS_SENSIBLES_LEER', 'Consultar documentos y cuentas de clientes', 'documento_identidad', 'LEER')
ON CONFLICT (codigo) DO NOTHING;
