package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public class EnvioLocal extends Envio {
	String tipoEntrega;
	
	public EnvioLocal(LocalDate fechaDespacio, String direccionOrigen, String direccionDestino, double pesoGramos, String tipoEntrega) {
		super(fechaDespacio, direccionOrigen, direccionDestino, pesoGramos);
		this.tipoEntrega = tipoEntrega;
	}
	
	// Getters
	public String getTipoEntrega() { return this.tipoEntrega; }
	
	public double costo() {
		if (this.getTipoEntrega().equals("Estandar"))
			return 1000;
		// Si no es estandar, es porque es rápida
		return 1500;
	}
}