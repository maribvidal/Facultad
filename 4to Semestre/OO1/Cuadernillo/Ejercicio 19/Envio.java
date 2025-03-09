package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public abstract class Envio {
	protected LocalDate fechaDespacho;
	protected String direccionOrigen;
	protected String direccionDestino;
	protected double pesoGramos;
	
	public Envio(LocalDate fechaDespacio, String direccionOrigen, String direccionDestino, double pesoGramos) {
		this.fechaDespacho = fechaDespacio;
		this.direccionOrigen = direccionOrigen;
		this.direccionDestino = direccionDestino;
		this.pesoGramos = pesoGramos;
	}
	
	// Getters
	public LocalDate getFechaDespacho() { return this.fechaDespacho; }
	
	public abstract double costo();
}