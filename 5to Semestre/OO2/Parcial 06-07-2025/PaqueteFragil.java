package parcial2025;

public class PaqueteFragil extends PaqueteDecorator {
	//
	public PaqueteFragil(IPaquete paquete) {
		super(paquete);
	}

	// INTERFAZ PÚBLICA
	
	// Agrega la nota "frágil" a la descripción
	@Override
	public String obtenerDescExtra() {
		return " frágil";
	}

	// No incrementa el costo
	@Override
	public double obtenerCostoExtra() {
		return 0;
	}
}