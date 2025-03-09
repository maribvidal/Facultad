package ar.edu.unlp.oo1.ejercicio25;

import java.time.LocalDate;

public abstract class Servicio {
	protected Mascota mascota;
	protected LocalDate fecha;
	
	public Servicio(Mascota m) {
		this.mascota = m;
		this.fecha = LocalDate.now();
	}
	
	public abstract double costoServicio();
	public boolean ocurrioEn(LocalDate f) {
		return (this.fecha.equals(f));
	}
}
