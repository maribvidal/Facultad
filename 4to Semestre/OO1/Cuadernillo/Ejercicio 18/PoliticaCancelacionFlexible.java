package ar.edu.unlp.oo1.ejercicio17;

import java.time.LocalDate;

public class PoliticaCancelacionFlexible extends PoliticaCancelacion {
	public double reembolsar(double montoOriginal, LocalDate fechaInicioReserva) {
		// Si aún hay tiempo para cancelar la reserva...
		if (fechaInicioReserva.isAfter(LocalDate.now())) {
			return montoOriginal;
		}
		return 0;
	}
}
