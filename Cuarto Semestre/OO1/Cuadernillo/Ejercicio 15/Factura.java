package ar.edu.unlp.oo1.ejercicio15;

import java.time.LocalDate;

public class Factura {
	Usuario usuario;
	LocalDate fechaEmision;
	double bonificacion;
	double precioKwh; // No sé si tiene mucho sentido esto, pero es que si no tendría que
	//					 referenciar al CuadroTarifario desde acá, y eso tiene aún menos
	//					 La otra es delegarle al EmisorFactura la tarea de calcular el
	//					 monto de la factura, pero entonces la factura no podría calcular
	//					 su propio monto (falta de responsabilidad). Consultar.
	
	public Factura(Usuario usuario, double precioKwh) {
		this.usuario = usuario;
		this.precioKwh = precioKwh;
		this.fechaEmision = LocalDate.now();
	}
	
	// MÉTODOS HELPERS
	
	// se tiene en cuenta solo su último consumo registrado
	private Consumo obtenerUltimoConsumo() {
		return this.usuario.getDomicilio().getLast();
	}
	
	// El costo del consumo se calcula multiplicando el 
	//consumo de energía activa por el precio del kWh 
	// proporcionado por el cuadro tarifario.
	private double calcularCostoConsumo() {
		int consumoEnergiaActiva = this.obtenerUltimoConsumo().getEnergiaActiva();
		double costoConsumo = consumoEnergiaActiva * precioKwh;
		
		return costoConsumo;
	}
	
	private void calcularFPE() {
		int consumoEnergiaActiva = this.obtenerUltimoConsumo().getEnergiaActiva();
		int consumoEnergiaReactiva = this.obtenerUltimoConsumo().getEnergiaReactiva();
		double raizCuadrada = Math.sqrt(Math.pow(consumoEnergiaActiva, 2) + Math.pow(consumoEnergiaReactiva, 2));
		double fpe = (consumoEnergiaActiva) / raizCuadrada;
		
		this.bonificacion = fpe;
	}
	
	
	// MÉTODOS PÚBLICOS
	public double calcularMontoFinal() {
		this.calcularFPE(); // Queda raro esto
		double montoFinal = this.calcularCostoConsumo();
		
		if (this.bonificacion > 0.8)
			montoFinal -= (montoFinal * 0.1);
		
		return montoFinal;
	}
	
	public LocalDate getFechaEmision() { return this.fechaEmision; }
}
