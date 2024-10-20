package ar.edu.unlp.oo1.ejercicio17;

// Esta clase se controla desde Usuario

public class Reserva {
	public Propiedad propiedad;
	public DateLapse periodo;
	
	public Reserva(Propiedad propiedad, DateLapse periodo) {
		this.propiedad = propiedad;
		this.periodo = periodo;
	}
	
	// El usuario debe poder calcular el precio de la reserva
	public double calcularPrecio()
	{
		return this.propiedad.consultarPrecioPeriodo(periodo);
	}
}