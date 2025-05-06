package unlp.oo2.patrones.ej18;

public class DecoratorPermisos extends DecoratorFile {
	//
	public DecoratorPermisos(IFile componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	public String prettyPrint() {
		String permisos = this.getFile().getPermisos().toString();
		String cadena = this.getComponente().prettyPrint();
		return (cadena + " - " + permisos);
	}
}
