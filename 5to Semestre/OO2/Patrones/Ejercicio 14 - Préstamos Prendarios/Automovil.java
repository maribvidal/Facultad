package unlp.oo2.patrones.ej14;

public class Automovil extends Prenda {
	private int añosAntiguedad;
	private String modelo;
	private int kilometraje;
	private double costo0km;
	
	//
	
	public Automovil(String modelo, int kilometraje, int añosAntiguedad, double costo0km) {
		this.añosAntiguedad = añosAntiguedad;
		this.modelo = modelo;
		this.kilometraje = kilometraje;
		this.costo0km = costo0km;
	}
	
	// INTERFAZ PÚBLICA

	public int obtenerAñosAntiguedad() { return añosAntiguedad; }
	public String obtenerModelo() { return modelo; }
	public int obtenerKilometraje() { return kilometraje; }
	public double obtenerCosto0KM() { return costo0km; }
	
	public double calcularLiquidez() { return 0.7; }
	
	public double calcularValor() {
		double calculo = this.obtenerCosto0KM() - (this.obtenerCosto0KM() * this.obtenerAñosAntiguedad() * 0.1);
		return (calculo > 0 ? calculo : 0);
	}
}