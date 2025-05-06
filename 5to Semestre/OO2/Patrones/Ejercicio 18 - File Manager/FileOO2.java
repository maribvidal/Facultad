package unlp.oo2.patrones.ej18;

import java.time.LocalDate;
import java.util.List;

public class FileOO2 implements IFile {
	private String nombre;
	private String extension;
	private int tamaño; // en bytes
	private LocalDate fechaCreacion;
	private LocalDate fechaModificacion;
	private List<String> permisos;
	
	//
	
	public FileOO2(String nombre, String extension, int tamaño, LocalDate fechaCreacion, LocalDate fechaModificacion,
			List<String> permisos) {
		this.nombre = nombre;
		this.extension = extension;
		this.tamaño = tamaño;
		this.fechaCreacion = fechaCreacion;
		this.fechaModificacion = fechaModificacion;
		this.permisos = permisos;
	}
	
	// INTERFAZ PÚBLICA
	
	public String prettyPrint() {
		return this.nombre;
	}
	
	// Implementado para poder conseguir el
	// archivo mas fácil en los Decorator
	public FileOO2 getFile() {
		return this;
	}
	
	// Getters

	public String getNombre() { return nombre; }
	public String getExtension() { return extension; }
	public int getTamaño() { return tamaño; }
	public LocalDate getFechaCreacion() { return fechaCreacion; }
	public LocalDate getFechaModificacion() { return fechaModificacion; }
	public List<String> getPermisos() { return permisos; }
}
