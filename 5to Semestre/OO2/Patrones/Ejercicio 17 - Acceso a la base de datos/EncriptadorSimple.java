package ar.edu.unlp.info.oo2.accesobd;

import java.util.stream.IntStream;

// Cifrador cesariano hecho por los loles

public class EncriptadorSimple {
	//
	public String cifrar(String cadena, int offset) {
		// Recibir String y volverlo mutable
		StringBuilder sb = new StringBuilder();
		// Desplazar el charcode de cada carácter offset veces
		IntStream.range(0, sb.length() - 1).forEach(i -> {
			// Para cada letra del StrngBuilder
			sb.setCharAt(i, (char) (this.normalizarNumero((int) sb.charAt(i) + offset)));
		});
		
		return sb.toString();
	}
	
	public String descifrar(String cadena, int offset) {
		return this.cifrar(cadena, -offset);
	}
	
    private int normalizarNumero(int numero) {
        if (numero > 126)
        {
            int desplacement = numero - 126;
            return (33 + desplacement);
        }
        if (numero < 33)
        {
            int desplacement = 33;

            if (numero >= 0)
                desplacement = 33 - numero;
            else
                desplacement += Math.abs(numero);

            return (126 - desplacement);
        }

        return numero;
    }
}