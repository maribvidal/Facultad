package unlp.oo2.patrones.ej14;

public class Inmueble extends BienNoMueble {
	private String direccion;
	private int superficie;
	
	//
	
	public Inmueble(String direccion, int superficie, double costoMetroCuadrado) {
		super(costoMetroCuadrado);
		this.direccion = direccion;
		this.superficie = superficie;
	}
	
	// INTERFAZ PÚBLICA
	
	public String obtenerDireccion() { return this.direccion; }
	public int obtenerSuperficie() { return this.superficie; }
	
	public double calcularLiquidez() { return 0.2; }
	
	public double calcularValor() { 
		double calculo = this.obtenerSuperficie() * this.obtenerCostoPorMagnitud();
		return (calculo > 0 ? calculo : 0);
	}
}