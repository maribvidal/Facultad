package unlp.oo2.patrones.ej10;

public class Mensajero {
	private ICipher cifrador;
	
	public Mensajero(ICipher cifrador) {
		this.cifrador = cifrador;
	}
	
	public String enviar(String mensaje) { return this.cifrador.encriptar(mensaje); }
	public String recibir(String mensaje) { return this.cifrador.desencriptar(mensaje); }
	public void cambiarCifrador(ICipher nuevoCifrador) { this.cifrador = nuevoCifrador; }
}