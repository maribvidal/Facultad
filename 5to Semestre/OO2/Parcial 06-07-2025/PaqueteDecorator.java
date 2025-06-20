package parcial2025;

public abstract class PaqueteDecorator implements IPaquete {
	protected IPaquete paquete;
	//
	public PaqueteDecorator(IPaquete paquete) {
		this.paquete = paquete;
	}
	
	// INTERFAZ PÚBLICA
	
	public abstract String obtenerDescExtra();
	public abstract double obtenerCostoExtra();
	
	public String getDescripcion() {
		return this.paquete.getDescripcion() + this.obtenerDescExtra();
	}
	
	public String getDestinatario() {
		return this.paquete.getDestinatario();
	}
	
	public String getDireccionDestino() {
		return this.paquete.getDireccionDestino();
	}
	
	public double getValorDeclarado() {
		return this.paquete.getValorDeclarado();
	}
	
	public double getCostoEnvio() {
		return this.obtenerCostoExtra() + this.paquete.getCostoEnvio();
	}
}