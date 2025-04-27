package unlp.oo2.patrones.ej14;

public abstract class BienNoMueble extends Prenda {
	private double costoPorMagnitud;
	
	//
	
	public BienNoMueble(double costoPorMagnitud) {
		this.costoPorMagnitud = costoPorMagnitud; // Representa el costo por km, por m2, y por mes
	}
	
	// INTERFAZ PÚBLICA
	
	public abstract double calcularValor(); // Delegar implementación a las subclases
	public double obtenerCostoPorMagnitud() { return this.costoPorMagnitud; }
}