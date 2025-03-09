package tp3;

public class RedAguaPotable {
	private double Caudal = 0;
	private String NombreCasa;
	
	public RedAguaPotable(String nombreCasa) {
		NombreCasa = nombreCasa;
	}
	
	public double getCaudal() {
		return Caudal;
	}
	public String getNombreCasa() {
		return NombreCasa;
	}
	public void setCaudal(double caudal) {
		Caudal = caudal;
	}
	public void setNombreCasa(String nombre) {
		NombreCasa = nombre;
	}
	
	public String toString() {
		return "[NOMBRE DE LA CASA: " + NombreCasa + " / Caudal: " + Caudal + " ]";
	}
}
