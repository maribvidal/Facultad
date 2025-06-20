package parcial2025;

// Permitiendo que la clase pueda implementar
// una interfaz en caso de ser necesario

public interface IPaquete {
	public String getDescripcion();
	public String getDestinatario();
	public String getDireccionDestino();
	public double getValorDeclarado();
	public double getCostoEnvio();
}