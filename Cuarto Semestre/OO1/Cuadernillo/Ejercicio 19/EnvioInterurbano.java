package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public class EnvioInterurbano extends Envio {
	int distanciaKm;
	
	public EnvioInterurbano(LocalDate fechaDespacio, String direccionOrigen, String direccionDestino, double pesoGramos, int distanciaKm) {
		super(fechaDespacio, direccionOrigen, direccionDestino, pesoGramos);
		this.distanciaKm = distanciaKm;
	}
	
	// Getters
	public int getDistanciaKm() { return this.distanciaKm; }
	
	public double costo() {
		double costoEnvio = 0;
		
		if (distanciaKm > 0 && distanciaKm < 100) {
			costoEnvio = costoEnvio * 20;
		} else if (distanciaKm >= 100 && distanciaKm <= 500) {
			costoEnvio = costoEnvio * 25;
		} else if (distanciaKm > 500) {
			costoEnvio = costoEnvio * 30;
		}
		
		return costoEnvio;
	}
}