package parcial2025;

public class PaqueteConSeguro extends PaqueteDecorator {
	//
	public PaqueteConSeguro(IPaquete paquete) {
		super(paquete);
	}

	// INTERFAZ PÚBLICA
	
	// Agrega la nota "con seguro" a la descripción
	@Override
	public String obtenerDescExtra() {
		return " con seguro";
	}

	// Incrementa el costo de envío en un 20% del valor declarado
	@Override
	public double obtenerCostoExtra() {
		return (this.paquete.getValorDeclarado() * 0.2);
	}
}