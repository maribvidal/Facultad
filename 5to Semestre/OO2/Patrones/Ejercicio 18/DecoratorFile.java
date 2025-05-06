package unlp.oo2.patrones.ej18;

public abstract class DecoratorFile implements IFile {
	private IFile component;
	//
	public DecoratorFile(IFile component) {
		this.component = component;
	}
	
	// INTERFAZ PÚBLICA
	
	public abstract String prettyPrint();
	public FileOO2 getFile() { return this.component.getFile(); }
	protected IFile getComponente() { return this.component; }
}
