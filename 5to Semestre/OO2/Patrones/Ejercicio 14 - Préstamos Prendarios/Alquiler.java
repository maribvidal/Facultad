package unlp.oo2.patrones.ej14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Alquiler extends BienNoMueble {
	private LocalDate fechaComienzo;
	private LocalDate fechaFin; // Se podría haber usado un objeto Period también
	
	//
	
	public Alquiler(LocalDate fechaComienzo, LocalDate fechaFin, double costoMensual) {
		super(costoMensual);
		this.fechaComienzo = fechaComienzo;
		this.fechaFin = fechaFin;
	}
	
	// INTERFAZ PÚBLICA
	
	public LocalDate obtenerComienzo() { return this.fechaComienzo; }
	public LocalDate obtenerFin() { return this.fechaFin; }
	
	public double calcularLiquidez() { return 0.9; }
	
	public double calcularValor() { 
		double calculo = this.calcularMesesRestantes() * this.obtenerCostoPorMagnitud();
		return calculo;
	}
	
	// MÉTODOS PRIVADOS
	
	private int calcularMesesRestantes() {
		LocalDate diaActual = LocalDate.now();

		if (this.fechaFin.isBefore(diaActual) || this.fechaFin.equals(diaActual))
			return 0;
		
		int calculo = (int) diaActual.until(this.fechaFin, ChronoUnit.MONTHS);
		return calculo;
	}
}