package unlp.oo2.patrones.ej13;

public class Componente implements IComponente {
	private String nombre;
	private int precio;
	
	//
	
	public Componente(String nombre, int precio) {
		this.nombre = nombre;
		this.precio = precio;
	}
	
	// INTERFAZ PÚBLICA
	
	public int obtenerPrecio() { return this.precio; }
}