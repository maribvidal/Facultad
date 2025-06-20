package parcial2025;

public class PaqueteExpres extends PaqueteDecorator {
	//
	public PaqueteExpres(IPaquete paquete) {
		super(paquete);
	}

	// INTERFAZ PÚBLICA
	
	// Agrega la nota "entrega express" a la descripción
	@Override
	public String obtenerDescExtra() {
		return " entrega express";
	}

	// Incrementa el costo de envío en un 50% del valor declarado
	@Override
	public double obtenerCostoExtra() {
		return (this.paquete.getValorDeclarado() * 0.5);
	}
}