package ar.edu.unlp.info.oo1.Ejercicio23;

public class SeisCuotas implements IFormaDePago {
	public double calcularPrecioFinal(double precio) {
		return (precio * 1.2);
	}
}