package ar.edu.unlp.oo1.parcial;

import java.time.LocalDate;

public class EventoVirtual extends Evento {
	// En los eventos virtuales además se cobra un monto
	// fijo por el envío de la remera
	private double montoEnvio;
	
	public EventoVirtual(String nom, LocalDate fecha, String temaPri, double preIns, double preRem, double montoE) {
		super(nom, fecha, temaPri, preIns, preRem);
		this.montoEnvio = montoE;
	}
	
	// El precio de asistencia a un evento para los virtuales es la
	// suma del precio de inscripción, el precio de la remera y el
	// monto fijo por el envío
	@Override
	public double obtenerPrecioAsistencia(LocalDate fechaConsulta) {
		return (this.getPrecioBase(fechaConsulta) + this.montoEnvio);
	}
}
