package unlp.oo2.patrones.ej9;

import java.time.LocalDateTime;

public class AutoEnAlquiler {
	private double precioPorDia;
	private int cantidadPlazas;
	private String marca;
	private IPoliticaCancelacion politicaCancelacion;
	
	public AutoEnAlquiler(double precioPorDia, int cantidadPlazas, String marca, IPoliticaCancelacion politicaCancelacion) {
		this.precioPorDia = precioPorDia;
		this.cantidadPlazas = cantidadPlazas;
		this.marca = marca;
		this.politicaCancelacion = politicaCancelacion;
	}

	public double getPrecioPorDia() {
		return precioPorDia;
	}
	
	public double montoAReembolsar(double monto, LocalDateTime fechaCancelacion, LocalDateTime fechaReserva) {
		return politicaCancelacion.montoAReembolsar(monto, fechaCancelacion, fechaReserva);
	}
	
	public void cambiarPoliticaCancelacion(IPoliticaCancelacion politicaCancelacion) {
		this.politicaCancelacion = politicaCancelacion;
	}
	
	// Debug
	public IPoliticaCancelacion getPoliticaCancelacion() { return this.politicaCancelacion; }
}