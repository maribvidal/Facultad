package ar.edu.unlp.oo1.ejercicio25;

public class ConsultaMedica extends ServicioMedico {
	public ConsultaMedica(Mascota ma, Medico me, boolean us) {
		super(ma, me, us);
	}
	
	public double costoServicio() {
		double costo = this.medico.getHonorario() +
				(this.usoMateriales ? 300 : 0) +
				(this.esDomingo() ? 200 : 0) +
				(this.medico.getAntiguedad() * 100);
		return costo;
	}
}
