package unlp.oo2.patrones.ej18;

public class DecoratorTamaño extends DecoratorFile {
	//
	public DecoratorTamaño(IFile componente) {
		super(componente);
	}
	
	// INTERFAZ PÚBLICA
	public String prettyPrint() {
		String tamaño = String.valueOf(this.getFile().getTamaño());
		String cadena = this.getComponente().prettyPrint();
		return (cadena + " - " + tamaño);
	}
}
