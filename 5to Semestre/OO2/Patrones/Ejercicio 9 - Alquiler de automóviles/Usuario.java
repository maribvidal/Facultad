package unlp.oo2.patrones.ej9;

import java.util.List;
import java.util.ArrayList;

public class Usuario {
	private String nombre;
	private List<AutoEnAlquiler> autosEnAlquiler;
	
	public Usuario(String nombre) {
		this.nombre = nombre;
		this.autosEnAlquiler = new ArrayList<AutoEnAlquiler>();
	}
	
	public void alquilarAuto(AutoEnAlquiler unAuto) {
		this.autosEnAlquiler.add(unAuto);
	}
}