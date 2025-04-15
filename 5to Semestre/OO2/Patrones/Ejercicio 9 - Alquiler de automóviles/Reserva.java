package unlp.oo2.patrones.ej9;

import java.time.LocalDateTime;

public class Reserva {
	private Usuario conductor;
	private AutoEnAlquiler autoEnAlquiler;
	private int cantidadDias;
	private LocalDateTime fecha;
	
	public Reserva(Usuario conductor, AutoEnAlquiler autoEnAlquiler, int cantidadDias, LocalDateTime fecha) {
		this.conductor = conductor;
		this.autoEnAlquiler = autoEnAlquiler;
		this.cantidadDias = cantidadDias;
		this.fecha = fecha;
	}
	
	public double montoAPagar() {
		double autoPrecioPorDia = this.autoEnAlquiler.getPrecioPorDia();
		return (autoPrecioPorDia * cantidadDias);
	}
	
	public double montoAReembolsar(LocalDateTime fechaCancelacion) {
		return this.autoEnAlquiler.montoAReembolsar(this.montoAPagar(), fechaCancelacion, this.fecha);
	}
	
	// Debug
	public Usuario getConductor() { return this.conductor; }
	public AutoEnAlquiler getAutoEnAlquiler() { return this.autoEnAlquiler; }
	public int getCantidadDias() { return this.cantidadDias; }
	public LocalDateTime getFecha() { return this.fecha; }
}