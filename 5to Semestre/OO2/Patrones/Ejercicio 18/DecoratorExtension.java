package unlp.oo2.patrones.ej18;

public class DecoratorExtension extends DecoratorFile {
	//
	public DecoratorExtension(IFile componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	public String prettyPrint() {
		String extension = this.getFile().getExtension();
		String cadena = this.getComponente().prettyPrint();
		return (cadena + " - " + extension);
	}
}
