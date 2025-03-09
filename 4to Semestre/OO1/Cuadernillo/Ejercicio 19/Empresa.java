package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;

public class Empresa {
	// Se agrega el envío al cliente indicado
	public void enviar(Cliente cliente, Envio envio) {
		cliente.getEnvios().add(envio);
	}
	
	// Monto a pagar por los envíos realizados dentro de un período
	public double montoAPagar(Cliente cliente, LocalDate fechaInicio, LocalDate fechaFin) {
		return cliente.calcularMontoPeriodo(fechaInicio, fechaFin);
	}
}
