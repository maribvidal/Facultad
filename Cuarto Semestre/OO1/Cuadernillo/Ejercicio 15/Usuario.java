package ar.edu.unlp.oo1.ejercicio15;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	String nombre;
	List<Consumo> domicilio;
	
	public Usuario(String nombre) {
		this.nombre = nombre;
		this.domicilio = new ArrayList<Consumo>();
	}
	
	public void consumir(int cantidadKwh, int cantidadKVArh) {
		Consumo nuevoConsumo = new Consumo(cantidadKwh, cantidadKVArh);
		domicilio.add(nuevoConsumo);
	}
	
	public List<Consumo> getDomicilio() { return this.domicilio; }
}
