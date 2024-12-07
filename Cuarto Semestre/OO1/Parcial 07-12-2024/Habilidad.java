package parcial.segundaFecha;

public class Habilidad {
	private double inteligencia;
	private double fuerza;
	
	public Habilidad(double in, double fu) {
		this.inteligencia = in;
		this.fuerza = fu;
	}
	
	public double getInteligencia() { return this.inteligencia; }
	public double getFuerza() { return this.fuerza; }
	
	public void aumentarInteligencia(double cant) { this.inteligencia += cant; }
	public void aumentarFuerza(double cant) { this.fuerza += cant; }
}
