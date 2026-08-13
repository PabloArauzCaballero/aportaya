import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { usarTema, espacio, fuente } from '../tokens/tokens';
import { CampoMonto } from '../moleculas/CampoMonto';
import { Boton } from '../atomos/Boton';
import { formatear } from '../atomos/Monto';

export interface FormularioAporteProps {
  montoSugerido?: string;
  enviando?: boolean;
  /** El caller conecta esto al caso de uso (CU Cobrar aporte). El organismo NO hace IO. */
  onConfirmar: (monto: string) => void;
}

/**
 * Organismo FormularioAporte: orquesta la captura y confirmación de un aporte.
 * No hace fetch ni SQL — recibe `onConfirmar` y deja el efecto al caso de uso.
 */
export function FormularioAporte({ montoSugerido = '250', enviando = false, onConfirmar }: FormularioAporteProps) {
  const t = usarTema();
  const [monto, setMonto] = React.useState(montoSugerido);
  const valido = monto.trim().length > 0;

  return (
    <View style={estilos.wrap}>
      <Text style={[estilos.titulo, { color: t.brandInk }]}>Aportar mi turno</Text>
      <Text style={[estilos.desc, { color: t.text3 }]}>Confirmá el monto de tu aporte para este período.</Text>

      <CampoMonto
        etiqueta="Monto del aporte"
        obligatorio
        valor={monto}
        onChangeMonto={setMonto}
        ayuda="Es el monto fijo del grupo por turno."
      />

      <View style={{ marginTop: espacio[5] }}>
        <Boton
          titulo={`Confirmar aporte de Bs ${formatear(monto)}`}
          bloque
          cargando={enviando}
          deshabilitado={!valido}
          onPress={() => onConfirmar(monto)}
        />
      </View>
    </View>
  );
}

const estilos = StyleSheet.create({
  wrap: { gap: espacio[4] },
  titulo: { fontFamily: fuente.display, fontWeight: '700', fontSize: 20, letterSpacing: -0.4 },
  desc: { fontSize: 13, marginTop: -espacio[2] },
});
