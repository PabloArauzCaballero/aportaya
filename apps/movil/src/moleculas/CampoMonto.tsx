import React from 'react';
import { Campo } from '../atomos/Campo';

export interface CampoMontoProps {
  valor: string;
  onChangeMonto: (v: string) => void;
  etiqueta?: string;
  ayuda?: string;
  error?: string;
  obligatorio?: boolean;
}

/**
 * Molécula CampoMonto: captura un importe. Hace UNA cosa (capturar monto)
 * colaborando con el átomo `Campo`. Fija el addon "Bs" y el teclado decimal,
 * y limita la entrada a dígitos y separadores.
 */
export function CampoMonto({ valor, onChangeMonto, etiqueta = 'Monto', ayuda, error, obligatorio }: CampoMontoProps) {
  return (
    <Campo
      addon="Bs"
      etiqueta={etiqueta}
      valor={valor}
      onChangeText={(v) => onChangeMonto(v.replace(/[^0-9.,]/g, ''))}
      teclado="decimal-pad"
      placeholder="0,00"
      ayuda={ayuda}
      error={error}
      obligatorio={obligatorio}
    />
  );
}
