package tp5.ejercicio2;

public class Jubilado {
	public String Nombre;
	public String Domicilio;
	
	public Jubilado(String nombre, String domicilio) {
		Nombre = nombre;
		Domicilio = domicilio;
	}
	
	public String toString() {
		return "[ " + this.Nombre + ", " + this.Domicilio + "]";
	}
}
