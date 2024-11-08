package ar.edu.unlp.info.oo1.ejercicio23;

import java.util.ArrayList;
import java.util.List;

public class Vendedor extends Persona {
	private List<Producto> productosEnVenta;
	
	public Vendedor(String nombre, String apellido, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.productosEnVenta = new ArrayList<Producto>();
	}
}
