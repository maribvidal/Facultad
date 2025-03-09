package ar.edu.unlp.oo1.ejercicio25;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Mascota {
	private String nombre;
	private LocalDate fechaNacimiento;
	private String especie;
	private List<Servicio> servicios;
	
	public Mascota(String nom, LocalDate fechaNac, String esp) {
		this.nombre = nom;
		this.fechaNacimiento = fechaNac;
		this.especie = esp;
		this.servicios = new ArrayList<Servicio>();
	}
	
	public ServicioGuarderia darAltaGuarderia(int cantDias) {
		ServicioGuarderia sg = new ServicioGuarderia(this, cantDias);
		this.servicios.add(sg);
		return sg;
	}
	
	public ConsultaMedica darAltaConsulta(Medico me, boolean usoD) {
		ConsultaMedica cm = new ConsultaMedica(this, me, usoD);
		this.servicios.add(cm);
		return cm;
	}
	
	public Vacunacion darAltaVacunacion(Medico me, boolean usoD, String nomV, double costoV) {
		Vacunacion vc = new Vacunacion(this, me, usoD, nomV, costoV);
		this.servicios.add(vc);
		return vc;
	}
	
	public double recaudadoEn(LocalDate f) {
		double total = this.servicios.stream().filter(ser -> ser.ocurrioEn(f)).mapToDouble(ser -> ser.costoServicio()).sum();
		return total;
	}
	
	public boolean aplicaParaDescuento() {
		return (this.servicios.size() >= 5);
	}
}
