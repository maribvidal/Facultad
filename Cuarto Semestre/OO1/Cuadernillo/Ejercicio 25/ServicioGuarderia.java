package ar.edu.unlp.oo1.ejercicio25;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class ServicioGuarderia extends Servicio {
	private int cantidadDias;
	
	public ServicioGuarderia(Mascota ma, int cantDias) {
		super(ma);
		this.cantidadDias = cantDias;
	}
	
	public double costoServicio() {
		double costo = this.diasQueTranscurrieron() * 500;
		
		if (this.mascota.aplicaParaDescuento()) {
			costo -= (costo * 0.1);
		}
		
		return costo;
	}
	
	private int diasQueTranscurrieron() {
		int cant = (int) ChronoUnit.DAYS.between(this.fecha, LocalDate.now());
		
		if (this.cantidadDias - cant > 0) {
			return this.cantidadDias;
		}
		return cant;
	}
}
