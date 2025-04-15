package unlp.oo2.patrones.ej9;

import java.time.LocalDateTime;

public interface IPoliticaCancelacion {
	public double montoAReembolsar(double monto, LocalDateTime fechaCancelacion, LocalDateTime fechaReserva);
}