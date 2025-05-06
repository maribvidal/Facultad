package unlp.oo2.patrones.ej18;

public class DecoratorFechaModificacion extends DecoratorFile {
	//
	public DecoratorFechaModificacion(IFile componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	public String prettyPrint() {
		String fechaModificacion = this.getFile().getFechaModificacion().toString();
		String cadena = this.getComponente().prettyPrint();
		return (cadena + " - " + fechaModificacion);
	}
}
