package unlp.oo2.patrones.ej6;

public class Usuario {
	private String nombre;
	// ¿Iría en getNombre()?
	private String apellido; 
	private String email;

	public Usuario(String nombre, String apellido, String email) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
	}

	// Getters
	public String getNombre() { return this.nombre; }
	public String getEmail() { return this.email; }
}