package ar.edu.unlp.oo1.ejercicio6;

import java.time.LocalDate;

public class Mamifero {
	String identificador;
	String especie;
	LocalDate fechaNacimiento;
	Mamifero madre;
	Mamifero padre;
	
	// CONSTRUCTOR
	public Mamifero() {}
	public Mamifero(String identificador) { this.identificador = identificador; }
	
	// MÉTODOS
	public void setIdentificador(String identificador) { this.identificador = identificador; } 
	public String getIdentificador() { return this.identificador; }
	public void setEspecie(String especie) { this.especie = especie; }
	public String getEspecie() { return this.especie; }
	public void setFechaNacimiento(LocalDate fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }
	public LocalDate getFechaNacimiento() { return this.fechaNacimiento; }
	
	public Mamifero getMadre() { return this.madre; }
	public Mamifero getPadre() { return this.padre; }
	
	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}
	
	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}
	
	public Mamifero getAbueloPaterno() { return (this.getPadre() != null ? this.getPadre().getPadre() : null); }
	public Mamifero getAbuelaPaterna() { return (this.getPadre() != null ? this.getPadre().getMadre() : null); }
	public Mamifero getAbueloMaterno() { return (this.getMadre() != null ? this.getMadre().getPadre() : null); }
	public Mamifero getAbuelaMaterna() { return (this.getMadre() != null ? this.getMadre().getMadre() : null); }
	
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		return recorrerRama(this, unMamifero);
	}
	
	private boolean recorrerRama(Mamifero pariente, Mamifero mamifero) {
		boolean devolver = false;
		if (pariente.getPadre() != null && !devolver) { 
			if (pariente.getPadre().equals(mamifero)) { return true; }
			devolver = devolver || recorrerRama(pariente.getPadre(), mamifero);
		}
		if (pariente.getMadre() != null && !devolver) { 
			if (pariente.getMadre().equals(mamifero)) { return true; }
			devolver = devolver || recorrerRama(pariente.getMadre(), mamifero);
		}
		return devolver;
	}
}
