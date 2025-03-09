public class Jugador {
	String apellido;
	String nombre;
	public Jugador (String nombre, String apellido) {
		this.nombre	 = nombre;
		this.apellido = apellido;
	}
	
	@Override
	public String toString() { return this.nombre + " " + this.apellido; }
}
