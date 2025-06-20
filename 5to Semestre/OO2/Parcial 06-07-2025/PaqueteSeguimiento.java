package parcial2025;

public class PaqueteSeguimiento extends PaqueteDecorator {
	//
	public PaqueteSeguimiento(IPaquete paquete) {
		super(paquete);
	}

	// INTERFAZ PÚBLICA
	
	// No modifica la descripción
	@Override
	public String obtenerDescExtra() {
		return "";
	}

	// Incrementa el costo de envío en 2000 pesos
	@Override
	public double obtenerCostoExtra() {
		return (this.paquete.getCostoEnvio() + 2000);
	}
}