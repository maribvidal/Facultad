package ar.edu.unlp.oo1.ejercicio25;

import java.time.DayOfWeek;
import java.time.temporal.ChronoField;

public abstract class ServicioMedico extends Servicio {
	protected Medico medico;
	protected boolean usoMateriales;
	
	public ServicioMedico(Mascota ma, Medico me, boolean uso) {
		super(ma);
		this.medico = me;
		this.usoMateriales = uso;
	}
	
	protected boolean esDomingo() {
		DayOfWeek d = DayOfWeek.of(this.fecha.get(ChronoField.DAY_OF_WEEK));
		return (d == DayOfWeek.SUNDAY);
	}
}
