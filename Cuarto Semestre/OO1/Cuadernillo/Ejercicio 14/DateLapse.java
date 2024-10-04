package ar.edu.unlp.oo1.ejercicio14;

import java.time.LocalDate;

public class DateLapse {
	LocalDate from; // Fecha Desde
	LocalDate to;   // Fecha Hasta
	
	public DateLapse(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	//“Retorna la fecha de inicio del rango” 
	public LocalDate getFrom() { return this.from; }
	
	//“Retorna la fecha de fin del rango” 
	public LocalDate getTo() { return this.to; }
	
	//“retorna la cantidad de días entre la fecha 'from' y la fecha 'to'” 
	public int sizeInDays() {
		int cantidadDias = (int) from.until(to, java.time.temporal.ChronoUnit.DAYS);
		return cantidadDias;
	}
	
	//“recibe un objeto LocalDate y retorna true si la fecha está entre el from y el to del receptor y false en caso contrario”.
	public boolean includesDate(LocalDate other) {
		boolean siVieneLuego = from.isBefore(other);
		boolean peroAntesDelHasta = to.isAfter(other);
		
		return (siVieneLuego && peroAntesDelHasta);
	}
}
