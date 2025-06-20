package parcial2025;

//Permitiendo que la clase pueda implementar una interfaz
//en caso de ser necesario

public class Paquete implements IPaquete {
	private String descripcion;
	private String destinatario;
	private String direccionDestino;
	private double valorDeclarado;
	//
	// El constructor se asume que está
	// no hace falta crearlo
	public Paquete(String descripcion, String 
			destinatario, String direccionDestino,
			double valorDeclarado) {
		this.descripcion = descripcion;
		this.destinatario = destinatario;
		this.direccionDestino = direccionDestino;
		this.valorDeclarado = valorDeclarado;
	}
	
	// INTERFAZ PÚBLICA

	public String getDescripcion() {
		return descripcion;
	}
	
	public String getDestinatario() {
		return destinatario;
	}
	
	public String getDireccionDestino() {
		return direccionDestino;
	}
	
	public double getValorDeclarado() {
		return valorDeclarado;
	}

	// El costo de envío es el 5% del valor declarado
	public double getCostoEnvio() {
		return (this.getValorDeclarado() * 0.05);
	}
}