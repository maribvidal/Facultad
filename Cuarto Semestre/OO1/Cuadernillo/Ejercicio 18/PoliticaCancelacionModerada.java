package ar.edu.unlp.oo1.ejercicio17;

import java.time.LocalDate;

public class PoliticaCancelacionModerada extends PoliticaCancelacion {
	public double reembolsar(double montoOriginal, LocalDate fechaInicioReserva) {
		// Si queda una semana antes de que comience la reserva
		if (LocalDate.now().isBefore(fechaInicioReserva.minusDays(7))) {
			return montoOriginal;
		} else if (LocalDate.now().isBefore(fechaInicioReserva.minusDays(2))) {
			return montoOriginal * 0.5;
		}
		return 0;
	}
}
