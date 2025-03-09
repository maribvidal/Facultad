package ar.edu.unlp.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class Propietario extends Persona {
	ArrayList<Propiedad> propiedades;
	
	public Propietario(String nombre, String direccion, String DNI) {
		super(nombre, direccion, DNI);
		propiedades = new ArrayList<Propiedad>();
	}
	
	// Acá no me molesto en hacer validación, pero quizás debería haber
	public void agregarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public void quitarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public List<Propiedad> getPropiedades() { return this.propiedades; }
	
	public double calcularIngresos(DateLapse periodo) {
		// Si no hay propiedades, entonces se devolverá 0
		double ingresosBrutos = (this.getPropiedades() != null ? this.getPropiedades().stream().mapToDouble(prop -> prop.consultarIngresosPeriodo(periodo)).sum() : 0);
		
		return (ingresosBrutos * 0.75);
	}
}
