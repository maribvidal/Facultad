package ar.edu.unlp.oo1.ejercicio14;

import java.time.LocalDate;

public class DateLapseB implements IDateLapse {
	LocalDate from;
	int sizeInDays;
	
	public DateLapseB(LocalDate from, int sizeInDays) {
		this.from = from;
		this.sizeInDays = sizeInDays;
	}
	
	public LocalDate getFrom() { return this.from; }
	public int sizeInDays() { return this.sizeInDays; }
	
	public LocalDate getTo() {
		LocalDate fechaHasta = from.plusDays(sizeInDays);
		return fechaHasta;
	};
	
	public boolean includesDate(LocalDate other) {
		boolean siVieneLuego = getFrom().isBefore(other);
		boolean peroAntesDelHasta = getTo().isAfter(other);
		
		return (siVieneLuego && peroAntesDelHasta);
	}
}
