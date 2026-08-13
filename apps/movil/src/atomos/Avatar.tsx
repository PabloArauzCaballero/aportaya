import React from 'react';
import { View, Text } from 'react-native';
import { usarTema, radio, fuente, paleta } from '../tokens/tokens';

type Tamano = 'sm' | 'md' | 'lg';

export interface AvatarProps {
  iniciales: string;
  tamano?: Tamano;
  /** Color de fondo; por defecto verde de marca. */
  color?: string;
}

/** Átomo Avatar: iniciales sobre color de marca, para identificar grupo/persona. */
export function Avatar({ iniciales, tamano = 'md', color }: AvatarProps) {
  const t = usarTema();
  const d = tamanos[tamano];
  return (
    <View
      accessibilityRole="image"
      accessibilityLabel={iniciales}
      style={{
        width: d.size, height: d.size, borderRadius: d.r,
        backgroundColor: color ?? t.brand, alignItems: 'center', justifyContent: 'center',
      }}
    >
      <Text style={{ color: paleta.blanco, fontFamily: fuente.display, fontWeight: '700', fontSize: d.fs }}>
        {iniciales.slice(0, 2).toUpperCase()}
      </Text>
    </View>
  );
}

const tamanos: Record<Tamano, { size: number; r: number; fs: number }> = {
  sm: { size: 30, r: radio.sm + 1, fs: 12 },
  md: { size: 40, r: radio.md, fs: 15 },
  lg: { size: 56, r: radio.lg, fs: 20 },
};
