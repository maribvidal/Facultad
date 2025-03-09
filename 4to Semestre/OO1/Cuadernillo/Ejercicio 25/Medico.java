package ar.edu.unlp.oo1.ejercicio25;

import java.time.LocalDate;

public class Medico {
	private String nombre;
	private LocalDate fechaIngreso;
	private double honorario;
	
	public Medico(String nom, LocalDate f, double honorario) {
		this.nombre = nom;
		this.fechaIngreso = f;
		this.honorario = honorario;
	}
	
	public double getHonorario() { return this.honorario; }
	public double getAntiguedad() { return (LocalDate.now().getYear() - this.fechaIngreso.getYear());}
}
