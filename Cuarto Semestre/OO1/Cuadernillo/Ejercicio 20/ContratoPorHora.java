package ar.edu.unlp.oo1.ejercicio20;

import java.time.LocalDate;

public class ContratoPorHora extends Contrato {
	LocalDate fechaInicio;
	LocalDate fechaFin;
	int numeroHoras;
	double valorHora;
	
	// Constructor
	public ContratoPorHora(LocalDate fechaInicio, LocalDate fechaFin, int numeroHoras, double valorHora) {
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.numeroHoras = numeroHoras;
		this.valorHora = valorHora;
	}
	
	// Métodos privados
	double calcularSueldoBasico() { return (this.numeroHoras * this.valorHora); }
	
	// Métodos públicos
	// Preguntar implementación de este método
	public double cobrarSueldo() {
		double sueldoBasico = this.calcularSueldoBasico();
		return (sueldoBasico + this.calcularSueldoAdicional(sueldoBasico));
	}
	
	// Para un contrato “por horas”, se considera activo aquel cuya fecha de fin sea posterior a la fecha actual.
	public boolean esActivo() {
		return (this.fechaFin.isAfter(LocalDate.now()));
	}
	
	public DateLapse obtenerDuracion() {
		return (new DateLapse(this.fechaInicio, this.fechaFin));
	}
}
