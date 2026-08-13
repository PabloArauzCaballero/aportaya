import React from 'react';
import { Pressable, Text, ActivityIndicator, View, StyleSheet } from 'react-native';
import { usarTema, espacio, radio, fuente, TACTIL_MIN, type Tema } from '../tokens/tokens';

type Variante = 'primario' | 'secundario' | 'fantasma' | 'peligro' | 'enlace' | 'claro';
type Tamano = 'sm' | 'base' | 'lg';

export interface BotonProps {
  titulo: string;
  onPress?: () => void;
  variante?: Variante;
  tamano?: Tamano;
  cargando?: boolean;
  deshabilitado?: boolean;
  bloque?: boolean;
  icono?: React.ReactNode;
}

/** Átomo Botón. Regla: un solo botón `primario` (naranja) por pantalla. */
export function Boton({
  titulo, onPress, variante = 'primario', tamano = 'base',
  cargando = false, deshabilitado = false, bloque = false, icono,
}: BotonProps) {
  const t = usarTema();
  const inactivo = deshabilitado || cargando;
  const c = colores(variante, t);
  const dim = tamanos[tamano];

  return (
    <Pressable
      onPress={inactivo ? undefined : onPress}
      disabled={inactivo}
      accessibilityRole="button"
      accessibilityState={{ disabled: inactivo, busy: cargando }}
      hitSlop={8}
      style={({ pressed }) => [
        estilos.base,
        {
          minHeight: TACTIL_MIN,
          paddingVertical: dim.py,
          paddingHorizontal: variante === 'enlace' ? espacio[1] : dim.px,
          borderRadius: variante === 'enlace' ? 0 : radio.md,
          backgroundColor: c.bg,
          borderColor: c.borde,
          alignSelf: bloque ? 'stretch' : 'flex-start',
          opacity: inactivo ? 0.5 : pressed ? 0.9 : 1,
        },
      ]}
    >
      {cargando ? (
        <ActivityIndicator size="small" color={c.texto} />
      ) : (
        <View style={estilos.contenido}>
          {icono ? <View style={{ marginRight: espacio[2] }}>{icono}</View> : null}
          <Text
            style={{
              color: c.texto,
              fontFamily: fuente.display,
              fontWeight: '600',
              fontSize: dim.fs,
              textDecorationLine: variante === 'enlace' ? 'underline' : 'none',
            }}
          >
            {titulo}
          </Text>
        </View>
      )}
    </Pressable>
  );
}

function colores(v: Variante, t: Tema) {
  switch (v) {
    case 'primario': return { bg: t.accent, texto: t.accentInk, borde: 'transparent' };
    case 'secundario': return { bg: t.brand, texto: t.textoClaro, borde: 'transparent' };
    case 'fantasma': return { bg: 'transparent', texto: t.brand, borde: t.fieldBorder };
    case 'claro': return { bg: t.overlayClaro, texto: t.textoClaro, borde: t.overlayClaroBorde };
    case 'peligro': return { bg: t.err, texto: t.textoClaro, borde: 'transparent' };
    case 'enlace': return { bg: 'transparent', texto: t.brand, borde: 'transparent' };
  }
}

const tamanos: Record<Tamano, { py: number; px: number; fs: number }> = {
  sm: { py: espacio[2], px: espacio[3], fs: 12.5 },
  base: { py: espacio[3], px: espacio[4] + 2, fs: 14 },
  lg: { py: espacio[4], px: espacio[5], fs: 15 },
};

const estilos = StyleSheet.create({
  base: { borderWidth: 1, alignItems: 'center', justifyContent: 'center' },
  contenido: { flexDirection: 'row', alignItems: 'center' },
});
