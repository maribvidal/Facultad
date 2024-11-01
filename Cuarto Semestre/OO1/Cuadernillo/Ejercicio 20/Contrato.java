package ar.edu.unlp.oo1.ejercicio20;

public abstract class Contrato {
	public abstract boolean esActivo();
	public abstract DateLapse obtenerDuracion();
	
	// Evitar repetir código
	protected double calcularSueldoAdicional(double sueldoBasico) {
		// Esto da "mal olor", pero hacerlo de otra forma es solo para complicarse pienso
		if (this.obtenerDuracion().sizeInDays() >= 7300) {
			return sueldoBasico;
		} else if (this.obtenerDuracion().sizeInDays() >= 5475) {
			return (sueldoBasico * 0.7);
		} else if (this.obtenerDuracion().sizeInDays() >= 3650) {
			return (sueldoBasico * 0.5);
		} else if (this.obtenerDuracion().sizeInDays() >= 1825) {
			return (sueldoBasico * 0.3);
		}
		return 0;
	}
}
