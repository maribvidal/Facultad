package ar.edu.unlp.oo1.ejercicio20;

public interface IContrato {
	public double calcularSueldoBasico();
	public abstract boolean esActivo();
	public abstract DateLapse obtenerDuracion();
}
