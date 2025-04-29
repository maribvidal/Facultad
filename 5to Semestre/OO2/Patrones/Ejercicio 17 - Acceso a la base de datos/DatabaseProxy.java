package ar.edu.unlp.info.oo2.accesobd;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DatabaseProxy implements DatabaseAccess {
	final int CESAR_OFFSET = 4;
	//
	private Map<String, String> datosUsuarios;
	private DatabaseRealAccess database;
	private EncriptadorSimple encriptador;
	private Sesion sesion;
	//
	
	public DatabaseProxy() {
		this.database = new DatabaseRealAccess();
		this.encriptador = new EncriptadorSimple();
		// Asumamos que el Proxy cuenta con acceso a 
		// los datos de los usuarios
		this.datosUsuarios = new HashMap<>();
		// Llenar con algunos datos
		this.datosUsuarios.put("voltaire", encriptador.cifrar("candido", CESAR_OFFSET));
		this.datosUsuarios.put("pascal", encriptador.cifrar("pensees", CESAR_OFFSET));
		this.datosUsuarios.put("descartes", encriptador.cifrar("metodo", CESAR_OFFSET));
		this.datosUsuarios.put("rosseau", encriptador.cifrar("emilio", CESAR_OFFSET));
	}
	
	// INTERFAZ PÚBLICA
	
	// Operaciones específicas del Proxy
	
	public boolean verificarUsuario(String nombreUsuario, String contraseña) {
		String contraseñaCodificada = encriptador.cifrar(contraseña, CESAR_OFFSET);
		
		boolean existeNombre = this.datosUsuarios.containsKey(nombreUsuario);
		boolean coincideContraseña = contraseñaCodificada.equals(this.datosUsuarios.get(nombreUsuario));
		
		return existeNombre && coincideContraseña;
	}
	
	public void nuevaSesion(Sesion sesion) { this.sesion = sesion; }
	
	// Operaciones implementadas
	
    public Collection<String> getSearchResults(String queryString) { 
    	if (this.sesion != null && this.sesion.estaAutorizado())
    		return database.getSearchResults(queryString);
    	return Collections.emptyList();
    }

    public int insertNewRow(List<String> rowData) {
    	if (this.sesion != null && this.sesion.estaAutorizado())
    		return database.insertNewRow(rowData);
    	return 0;
	}
}