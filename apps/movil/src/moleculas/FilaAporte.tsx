import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { usarTema, espacio, radio, fuente } from '../tokens/tokens';
import { Avatar } from '../atomos/Avatar';
import { ChipEstado, type Estado } from '../atomos/ChipEstado';

export interface FilaAporteProps {
  nombre: string;
  detalle: string;
  iniciales: string;
  colorAvatar?: string;
  /** Avance del ciclo, 0–1. */
  progreso: number;
  /** Texto del turno, p. ej. "5/8". */
  turno: string;
  estado?: Estado;
}

/** Molécula FilaAporte: fila de un pasanaku (avatar + info + progreso + estado). */
export function FilaAporte({ nombre, detalle, iniciales, colorAvatar, progreso, turno, estado }: FilaAporteProps) {
  const t = usarTema();
  const pct = Math.max(0, Math.min(1, progreso)) * 100;

  return (
    <View style={[estilos.fila, { backgroundColor: t.surface, borderColor: t.border, borderRadius: radio.md }]}>
      <Avatar iniciales={iniciales} color={colorAvatar} />
      <View style={estilos.info}>
        <Text style={[estilos.nombre, { color: t.text }]} numberOfLines={1}>{nombre}</Text>
        <Text style={[estilos.detalle, { color: t.text3 }]} numberOfLines={1}>{detalle}</Text>
        <View style={[estilos.barra, { backgroundColor: t.surface2 }]}>
          <View style={{ height: '100%', width: `${pct}%`, backgroundColor: t.accent, borderRadius: radio.pill }} />
        </View>
      </View>
      <View style={estilos.der}>
        <Text style={[estilos.turno, { color: t.brand }]}>{turno}</Text>
        {estado ? <ChipEstado estado={estado} /> : null}
      </View>
    </View>
  );
}

const estilos = StyleSheet.create({
  fila: { flexDirection: 'row', alignItems: 'center', gap: espacio[3], borderWidth: 1, padding: espacio[3] },
  info: { flex: 1, minWidth: 0 },
  nombre: { fontFamily: fuente.display, fontWeight: '600', fontSize: 14.5 },
  detalle: { fontSize: 12.5, marginTop: 1 },
  barra: { height: 6, borderRadius: radio.pill, overflow: 'hidden', marginTop: espacio[2] - 1 },
  der: { alignItems: 'flex-end', gap: espacio[1] },
  turno: { fontFamily: fuente.display, fontWeight: '700', fontVariant: ['tabular-nums'] },
});
