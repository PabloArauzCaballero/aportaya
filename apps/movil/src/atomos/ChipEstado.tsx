import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { usarTema, espacio, radio, fuente, type Tema } from '../tokens/tokens';

export type Estado = 'al-dia' | 'por-vencer' | 'atrasado' | 'en-revision' | 'borrador';

export interface ChipEstadoProps {
  estado: Estado;
  /** Sobrescribe el texto por defecto del estado. */
  texto?: string;
}

/** Átomo ChipEstado: traduce un estado de dominio a color semántico + etiqueta. */
export function ChipEstado({ estado, texto }: ChipEstadoProps) {
  const t = usarTema();
  const { fondo, color, etiqueta } = mapa(estado, t);

  return (
    <View style={[estilos.chip, { backgroundColor: fondo, borderRadius: radio.pill }]} accessibilityRole="text">
      {estado !== 'borrador' ? <View style={[estilos.punto, { backgroundColor: color }]} /> : null}
      <Text style={[estilos.texto, { color, fontFamily: fuente.display }]}>{texto ?? etiqueta}</Text>
    </View>
  );
}

function mapa(e: Estado, t: Tema): { fondo: string; color: string; etiqueta: string } {
  switch (e) {
    case 'al-dia': return { fondo: t.okBg, color: t.ok, etiqueta: 'Al día' };
    case 'por-vencer': return { fondo: t.warnBg, color: t.warn, etiqueta: 'Por vencer' };
    case 'atrasado': return { fondo: t.errBg, color: t.err, etiqueta: 'Atrasado' };
    case 'en-revision': return { fondo: t.infoBg, color: t.info, etiqueta: 'En revisión' };
    case 'borrador': return { fondo: t.surface2, color: t.text2, etiqueta: 'Borrador' };
  }
}

const estilos = StyleSheet.create({
  chip: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: espacio[3] - 2, paddingVertical: 3, alignSelf: 'flex-start' },
  punto: { width: 6, height: 6, borderRadius: 3, marginRight: espacio[1] + 1 },
  texto: { fontSize: 11.5, fontWeight: '700' },
});
