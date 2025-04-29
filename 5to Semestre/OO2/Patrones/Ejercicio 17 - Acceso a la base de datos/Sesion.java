package ar.edu.unlp.info.oo2.accesobd;

// Clase que representa una sesión a la base de datos

public class Sesion {
	// Para hacerla simple
	private boolean autorizado;
	private DatabaseProxy databaseProxy;
	
	//
	
	public Sesion(DatabaseProxy databaseProxy) {
		this.autorizado = false;
		this.databaseProxy = databaseProxy;
		this.databaseProxy.nuevaSesion(this);
	}
	
	// INTERFAZ PÚBLICA
	
	public void iniciarSesion(String nombreUsuario, String contraseña) {
		// Esta sentencia introduce acoplamiento
		this.autorizado = this.databaseProxy.verificarUsuario(nombreUsuario, contraseña);
	}
	
	public boolean estaAutorizado() { return this.autorizado; }
}