-- Grupo de pasanaku demo: 6 cupos, Bs 500 mensuales, 6 períodos, con su tarifa congelada y el primer período abierto.
-- GENERADO desde seeders/prueba/03-grupo-demo.json — no editar a mano.

INSERT INTO organizador (usuario_id, estado, nivel, limite_grupos_simultaneos, limite_monto_administrado, grupos_activos, grupos_historicos, calificacion_promedio, indice_morosidad_cartera, fecha_postulacion) VALUES
  ((SELECT id FROM usuario WHERE codigo_publico = 'USR000001'), 'HABILITADO', 'ESTANDAR', 3, 50000, 1, 0, 0, 0, now())
ON CONFLICT DO NOTHING;

INSERT INTO grupo (codigo_publico, nombre, moneda, periodicidad, dia_cobro, num_periodos, cupos_totales, cupos_ocupados, monto_aporte, fecha_inicio, fecha_fin_estimada, estado, tipo_conformacion, modalidad_turnos, visibilidad, requiere_kyc_minimo, reputacion_minima, dias_gracia, porcentaje_fondo_garantia, quorum_decisiones, organizador_id) VALUES
  ('GRP-DEMO-01', 'Pasanaku demo del barrio', 'BOB', 'MENSUAL', 10, 6, 6, 6, 500.0, current_date, (current_date + interval '180 days'), 'EN_CURSO', 'MANUAL_POR_INVITACION', 'SORTEO_ALEATORIO', 'PRIVADO', 'BASICO', 0, 3, 5.0, 0.667, (SELECT id FROM organizador WHERE usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000001')))
ON CONFLICT (codigo_publico) DO NOTHING;

INSERT INTO configuracion_grupo (grupo_id, max_cupos_por_persona, hora_limite_pago, tolerancia_monto_parcial, politica_mora_id) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 2, '20:00:00', 50.0, (SELECT id FROM politica_mora LIMIT 1))
ON CONFLICT DO NOTHING;

INSERT INTO reglamento_grupo (grupo_id, version, contenido, hash_contenido, clausulas_mora, clausulas_abandono, vigente_desde, redactado_por) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 1, 'Reglamento de prueba del grupo demo.', repeat('a', 64), 'Recargo del 2% con tope del 100% del aporte.', 'El cupo se libera y se busca reemplazo.', now(), (SELECT id FROM usuario WHERE codigo_publico = 'USR000001'))
ON CONFLICT DO NOTHING;

-- El precio pactado no cambia a mitad del juego (R-TAR-07)
INSERT INTO tarifa_congelada_grupo (grupo_id, tarifario_id, snapshot_conceptos, hash_snapshot, congelada_en, vigente_hasta_ciclo_nro) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM tarifario WHERE codigo = 'GENERAL' AND version = 1), '{"COM_ENTREGA": {"metodo": "PORCENTUAL", "valor": 0.3, "piso": 10, "techo": 50}}'::jsonb, repeat('a', 64), now(), 6)
ON CONFLICT (grupo_id) DO NOTHING;

INSERT INTO participante (grupo_id, usuario_id, estado, reputacion_al_ingresar, aportes_realizados, aportes_en_mora, fecha_ingreso, es_organizador) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000001'), 'ACTIVO', 700, 0, 0, now(), TRUE),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000002'), 'ACTIVO', 700, 0, 0, now(), FALSE),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000003'), 'ACTIVO', 700, 0, 0, now(), FALSE),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000004'), 'ACTIVO', 700, 0, 0, now(), FALSE),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000005'), 'ACTIVO', 700, 0, 0, now(), FALSE),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM usuario WHERE codigo_publico = 'USR000006'), 'ACTIVO', 700, 0, 0, now(), FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO cupo (grupo_id, numero, estado, fraccion, participante_id) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 1, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000001'))),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 2, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000002'))),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 3, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000003'))),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 4, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000004'))),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 5, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000005'))),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 6, 'OCUPADO', 1.0, (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000006')))
ON CONFLICT DO NOTHING;

INSERT INTO periodo (grupo_id, numero, fecha_inicio, fecha_limite_pago, fecha_fin_gracia, fecha_entrega_prevista, estado, cupos_morosos, monto_recaudado) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 1, (current_date + interval '0 days'), (current_date + interval '10 days'), (current_date + interval '13 days'), (current_date + interval '15 days'), 'ABIERTO', 0, 0),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 2, (current_date + interval '30 days'), (current_date + interval '40 days'), (current_date + interval '43 days'), (current_date + interval '45 days'), 'PROGRAMADO', 0, 0),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 3, (current_date + interval '60 days'), (current_date + interval '70 days'), (current_date + interval '73 days'), (current_date + interval '75 days'), 'PROGRAMADO', 0, 0),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 4, (current_date + interval '90 days'), (current_date + interval '100 days'), (current_date + interval '103 days'), (current_date + interval '105 days'), 'PROGRAMADO', 0, 0),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 5, (current_date + interval '120 days'), (current_date + interval '130 days'), (current_date + interval '133 days'), (current_date + interval '135 days'), 'PROGRAMADO', 0, 0),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), 6, (current_date + interval '150 days'), (current_date + interval '160 days'), (current_date + interval '163 days'), (current_date + interval '165 days'), 'PROGRAMADO', 0, 0)
ON CONFLICT DO NOTHING;

INSERT INTO turno (grupo_id, periodo_id, cupo_id, orden_asignado, estado, criterio_asignacion) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), 1, 'PROGRAMADO', 'SORTEO'),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 2), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 2), 2, 'PROGRAMADO', 'SORTEO'),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 3), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 3), 3, 'PROGRAMADO', 'SORTEO'),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 4), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 4), 4, 'PROGRAMADO', 'SORTEO'),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 5), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 5), 5, 'PROGRAMADO', 'SORTEO'),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 6), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 6), 6, 'PROGRAMADO', 'SORTEO')
ON CONFLICT DO NOTHING;

-- Primer período: seis obligaciones de Bs 500 pendientes
INSERT INTO obligacion_aporte (grupo_id, periodo_id, cupo_id, participante_id, tipo, monto_esperado, moneda, monto_pagado, monto_recargo, monto_condonado, monto_cubierto_garantia, estado, fecha_vencimiento, fecha_fin_gracia, dias_mora, version, politica_mora_id) VALUES
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000001')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1)),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 2), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000002')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1)),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 3), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000003')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1)),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 4), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000004')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1)),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 5), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000005')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1)),
  ((SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01'), (SELECT id FROM periodo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 1), (SELECT id FROM cupo WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND numero = 6), (SELECT id FROM participante WHERE grupo_id = (SELECT id FROM grupo WHERE codigo_publico = 'GRP-DEMO-01') AND usuario_id = (SELECT id FROM usuario WHERE codigo_publico = 'USR000006')), 'APORTE_PERIODICO', 500.0, 'BOB', 0, 0, 0, 0, 'PENDIENTE', (current_date + interval '10 days'), (current_date + interval '13 days'), 0, 0, (SELECT id FROM politica_mora LIMIT 1))
ON CONFLICT DO NOTHING;
