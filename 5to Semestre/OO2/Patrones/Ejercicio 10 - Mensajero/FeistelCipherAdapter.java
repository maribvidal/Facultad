package unlp.oo2.patrones.ej10;

// Simular que se importa una librería externa
import ar.info.juego.Encriptador.FeistelCipher;

public class FeistelCipherAdapter implements ICipher {
	private String clave;
	private FeistelCipher feistelCipher;
	
	public FeistelCipherAdapter(String clave) {
		this.clave = clave;
		this.feistelCipher = new FeistelCipher(this.clave);
	}
	
	// Métodos de la interfaz implementada
	public String encriptar(String mensaje) { return feistelCipher.encode(mensaje); }
	public String desencriptar(String mensaje) { return feistelCipher.encode(mensaje); }
}