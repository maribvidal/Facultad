package ar.edu.unlp.oo1.ejercicio17;

// Debemos poder distinguir cuantos días reserva cada usuario en cada propiedad
// Esta clase se controla desde Usuario
public class Reserva {
	Propiedad propiedad;
	DateLapse periodo;
	
	public Reserva(Propiedad propiedad, DateLapse periodo) {
		this.propiedad = propiedad;
		this.periodo = periodo;
		this.propiedad.agregarPeriodo(periodo);
	}
	
	public DateLapse getPeriodo() { return this.periodo; }
	
	public double calcularPrecio() { 
		return this.propiedad.getPrecioPeriodo(periodo);
	}
	
	public void cancelarse() {
		this.propiedad.quitarPeriodo(periodo);
	}
}