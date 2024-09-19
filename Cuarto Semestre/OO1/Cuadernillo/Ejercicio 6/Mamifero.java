package ar.edu.unlp.info.oo1.ejercicio6.archetype;

import java.time.LocalDate;

public class Mamifero {
	String identificador = "";
	String especie;
	LocalDate fechaNacimiento;
	Mamifero padre;
	Mamifero madre;
	Mamifero abueloMaterno;
	Mamifero abuelaMaterna;
	Mamifero abueloPaterno;
	Mamifero abuelaPaterna;
	
	public Mamifero() {};
	public Mamifero(String identificador) {this.setIdentificador(identificador);}
	
	// Getters & Setters
	public void setIdentificador(String identificador) {this.identificador = identificador;}
	public String getIdentificador() {return this.identificador;}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Mamifero getPadre() {
		return padre;
	}

	public void setPadre(Mamifero padre) {
		this.padre = padre;
		if (this.getPadre() != null) {
			if (padre.getPadre() != null) {
				this.abueloPaterno = padre.getPadre();
			}
			if (padre.getMadre() != null) {
				this.abuelaPaterna = padre.getMadre();
			}
		}
	}

	public Mamifero getMadre() {
		return madre;
	}

	public void setMadre(Mamifero madre) {
		this.madre = madre;
		if (this.getMadre() != null) {
			if (madre.getPadre() != null) {
				this.abueloMaterno = madre.getPadre();
			}
			if (madre.getMadre() != null) {
				this.abuelaMaterna = madre.getMadre();
			}
		}
	}
	public Mamifero getAbueloMaterno() {return abueloMaterno;}
	public Mamifero getAbuelaMaterna() {return abuelaMaterna;}
	public Mamifero getAbueloPaterno() {return abueloPaterno;}
	public Mamifero getAbuelaPaterna() {return abuelaPaterna;}
	
	//@Override
	public boolean equals(Mamifero unMamifero) {
		return this.identificador == unMamifero.getIdentificador();
	}
	
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		if (((this.getPadre() != null) && (this.getPadre().equals(unMamifero))) || 
				((this.getMadre() != null) && (this.getMadre().equals(unMamifero))) || 
				((this.getAbueloPaterno() != null) && (this.getAbueloPaterno().equals(unMamifero))) || 
				((this.getAbuelaPaterna() != null) && (this.getAbuelaPaterna().equals(unMamifero))) || 
				((this.getAbueloMaterno() != null) && (this.getAbueloMaterno().equals(unMamifero))) || 
				((this.getAbuelaMaterna() != null) && (this.getAbuelaMaterna().equals(unMamifero)))) {
			return true;
		}
		return false;
	}
}
