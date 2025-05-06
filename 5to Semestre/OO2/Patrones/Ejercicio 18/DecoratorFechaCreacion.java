package unlp.oo2.patrones.ej18;

public class DecoratorFechaCreacion extends DecoratorFile {
	//
	public DecoratorFechaCreacion(IFile componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	public String prettyPrint() {
		String fechaCreacion = this.getFile().getFechaCreacion().toString();
		String cadena = this.getComponente().prettyPrint();
		return (cadena + " - " + fechaCreacion);
	}
}
