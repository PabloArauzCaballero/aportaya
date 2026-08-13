import React from 'react';
import { View, Text, TextInput, StyleSheet, type KeyboardTypeOptions } from 'react-native';
import { usarTema, espacio, radio, fuente } from '../tokens/tokens';

export interface CampoProps {
  etiqueta?: string;
  valor: string;
  onChangeText: (v: string) => void;
  placeholder?: string;
  ayuda?: string;
  /** Mensaje de error: pinta el borde de rojo y reemplaza a `ayuda`. */
  error?: string;
  /** Marca visual de validación correcta. */
  exito?: boolean;
  obligatorio?: boolean;
  deshabilitado?: boolean;
  secreto?: boolean;
  teclado?: KeyboardTypeOptions;
  /** Prefijo fijo, p. ej. "Bs" para montos. */
  addon?: string;
}

/** Átomo Campo de texto con estados: normal, foco, error, éxito, deshabilitado. */
export function Campo({
  etiqueta, valor, onChangeText, placeholder, ayuda, error, exito,
  obligatorio, deshabilitado, secreto, teclado, addon,
}: CampoProps) {
  const t = usarTema();
  const [foco, setFoco] = React.useState(false);

  const borde = error ? t.err : exito ? t.ok : foco ? t.brand : t.fieldBorder;

  return (
    <View>
      {etiqueta ? (
        <Text style={[estilos.etiqueta, { color: t.text2 }]}>
          {etiqueta}
          {obligatorio ? <Text style={{ color: t.err }}> *</Text> : null}
        </Text>
      ) : null}

      <View
        style={[
          estilos.fila,
          {
            borderColor: borde,
            borderRadius: radio.md,
            backgroundColor: deshabilitado ? t.surface2 : t.field,
          },
          foco && !error ? { shadowColor: t.brand, shadowOpacity: 0.22, shadowRadius: 4, elevation: 2 } : null,
        ]}
      >
        {addon ? (
          <View style={[estilos.addon, { backgroundColor: t.surface2, borderColor: t.fieldBorder }]}>
            <Text style={{ color: t.text2, fontFamily: fuente.display, fontWeight: '600' }}>{addon}</Text>
          </View>
        ) : null}
        <TextInput
          value={valor}
          onChangeText={onChangeText}
          placeholder={placeholder}
          placeholderTextColor={t.text3}
          editable={!deshabilitado}
          secureTextEntry={secreto}
          keyboardType={teclado}
          onFocus={() => setFoco(true)}
          onBlur={() => setFoco(false)}
          accessibilityLabel={etiqueta}
          style={[estilos.input, { color: deshabilitado ? t.text3 : t.text }]}
        />
      </View>

      {error ? (
        <Text style={[estilos.ayuda, { color: t.err }]}>{error}</Text>
      ) : ayuda ? (
        <Text style={[estilos.ayuda, { color: t.text3 }]}>{ayuda}</Text>
      ) : null}
    </View>
  );
}

const estilos = StyleSheet.create({
  etiqueta: { fontSize: 13, fontWeight: '600', marginBottom: espacio[2] - 2 },
  fila: { flexDirection: 'row', alignItems: 'stretch', borderWidth: 1, overflow: 'hidden' },
  addon: { justifyContent: 'center', paddingHorizontal: espacio[3], borderRightWidth: 1 },
  input: { flex: 1, paddingHorizontal: espacio[3], paddingVertical: espacio[3], fontSize: 14.5 },
  ayuda: { fontSize: 12, marginTop: espacio[1] + 1 },
});
