package ar.edu.unlp.oo1.ejercicio15;

public class CuadroTarifario {
	double precioKwh;
	
	// Colocar un constructor solo para facilitar la instanciación
	public CuadroTarifario(double precioKwh) { this.precioKwh = precioKwh; }
	
	public double consultarPrecio() { return this.precioKwh; }
	public void ajustarPrecio(double nuevoPrecio) { this.precioKwh = nuevoPrecio; }
}
