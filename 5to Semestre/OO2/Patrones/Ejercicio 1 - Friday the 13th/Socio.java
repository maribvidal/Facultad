package biblioteca;

public class Socio {
	private String nombre;
	private String legajo;
	private String email;


	public Socio(String nombre, String email, String legajo) {
		this.nombre = nombre;
		this.email = email;
		this.legajo = legajo;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLegajo() {
		return legajo;
	}
	public void setLegajo(String legajo) {
		this.legajo = legajo;
	}
	
	public String toString() {
		String cadena = "{\"legajo\":\"" + this.getLegajo() + "\"," + "\"nombre\":\"" +this.getNombre() + "\",\"email\":\"" + this.getEmail() + "\"}";
		return cadena;
	}
}
