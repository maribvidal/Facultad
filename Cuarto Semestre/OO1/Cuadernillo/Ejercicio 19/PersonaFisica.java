package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public class PersonaFisica extends Cliente {
	int DNI;
	
	public PersonaFisica(String nombre, String direccion, int DNI) {
		super(nombre, direccion);
		this.DNI = DNI;
	}
	
	// Los envíos efectuados por personas físicas tienen un 10% de descuento
	@Override
	public double calcularMontoPeriodo(LocalDate fechaInicio, LocalDate fechaFinal) {
		return (super.calcularMontoPeriodo(fechaInicio, fechaFinal) * 0.9);
	}
}