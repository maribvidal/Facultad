package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public class EnvioInternacional extends Envio {
	public EnvioInternacional(LocalDate fechaDespacio, String direccionOrigen, String direccionDestino, double pesoGramos) {
		super(fechaDespacio, direccionOrigen, direccionDestino, pesoGramos);
	}
	
	public double calcularKg(double gramos) { return (gramos / 1000); }
	
	public double costo() {
		// Provisional
		double costoEnvio = 5000;
		double costoPeso = pesoGramos;
		
		if (calcularKg(pesoGramos) > 0 && calcularKg(pesoGramos) <= 1) {
			costoPeso *= 10;
		} else if (calcularKg(pesoGramos) > 1) {
			costoPeso *= 12;
		}
		
		return (costoEnvio + costoPeso);
	}
}