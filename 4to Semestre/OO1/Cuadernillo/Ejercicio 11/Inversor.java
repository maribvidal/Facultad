package ar.edu.unlp.oo1.ejercicio11;

import java.util.*;

public class Inversor {
	String nombre;
	List<IInversion> inversiones;
	
	public Inversor(String nombre) {
		this.nombre = nombre;
		this.inversiones = new ArrayList<IInversion>();
	}
	
	public void agregarInversion(IInversion inversion) {
		this.inversiones.add(inversion);
	}
	
	public double valorActual() {
		return inversiones.stream().mapToDouble(i -> i.valorActual()).sum();
	}
}
