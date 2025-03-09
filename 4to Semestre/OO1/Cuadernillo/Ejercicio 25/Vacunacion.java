package ar.edu.unlp.oo1.ejercicio25;

public class Vacunacion extends ServicioMedico {
	private String nombreVacuna;
	private double costoVacuna;
	
	public Vacunacion(Mascota ma, Medico me, boolean us, String nomV, double costoV) {
		super(ma, me, us);
		this.nombreVacuna = nomV;
		this.costoVacuna = costoV;
	}
	
	public double costoServicio() {
		double costo = this.medico.getHonorario() +
				(this.usoMateriales ? 500 : 0) +
				(this.esDomingo() ? 200 : 0) + this.costoVacuna;
		return costo;
	}
}
