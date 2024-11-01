package ar.edu.unlp.oo1.ejercicio20;

import java.time.LocalDate;

public class ContratoDePlanta extends Contrato {
	LocalDate fechaInicio;
	double montoPorConyuge;
	double montoPorHijos;
	double sueldoMensual;
	
	// Constructor
	public ContratoDePlanta(LocalDate fechaInicio, double montoPorConyuge, double montoPorHijos, double sueldoMensual) {
		this.fechaInicio = fechaInicio;
		this.montoPorConyuge = montoPorConyuge;
		this.montoPorHijos = montoPorHijos;
		this.sueldoMensual = sueldoMensual;
	}
	
	// Métodos privados
	double calcularSueldoBasico() { return (this.sueldoMensual + this.montoPorConyuge + this.montoPorHijos); }	

	// Métodos públicos
	// Mal olor
	public double cobrarSueldo() {
		double sueldoBasico = this.calcularSueldoBasico();
		return (sueldoBasico + this.calcularSueldoAdicional(sueldoBasico));
	}
	
	// El contrato de planta SIEMPRE está vigente
	public boolean esActivo() { return true; }
	
	public DateLapse obtenerDuracion() {
		return (new DateLapse(this.fechaInicio, LocalDate.now()));
	}
}
