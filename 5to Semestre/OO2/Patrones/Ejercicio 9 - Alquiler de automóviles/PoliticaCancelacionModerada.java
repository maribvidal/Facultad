package unlp.oo2.patrones.ej9;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class PoliticaCancelacionModerada implements IPoliticaCancelacion {
	public double montoAReembolsar(double monto, LocalDateTime fechaCancelacion, LocalDateTime fechaReserva) {
		double seHaceDosDiasAntes = (Duration.ofDays(ChronoUnit.DAYS.between(fechaCancelacion, fechaReserva)).toDays() > 2 ? monto * 0.5 : 0);
		double cuenta = (Duration.between(fechaCancelacion, fechaReserva).toDays() > 7 ? monto : seHaceDosDiasAntes);
		return cuenta;
	}
}