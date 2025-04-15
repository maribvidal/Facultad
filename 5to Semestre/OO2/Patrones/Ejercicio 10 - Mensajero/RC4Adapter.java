package unlp.oo2.patrones.ej10;

//Simular que se importa una librería externa
import ar.info.juego.Encriptador.RC4;

public class RC4Adapter implements ICipher {
	private String clave;
	private RC4 rc4;
	
	public RC4Adapter(String clave) {
		this.clave = clave;
		this.rc4 = new RC4();
	}
	
	// Métodos de la interfaz implementada
	public String encriptar(String mensaje) { return rc4.encriptar(mensaje, this.clave); }
	public String desencriptar(String mensaje) { return rc4.desencriptar(mensaje, this.clave); }
}