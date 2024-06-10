package tp5.ejercicio2;

//Clase anémica
public class Persona {
	public boolean Tipo = false; //False: EMPLEADO | True: JUBILADO
	public String Nombre;
	public String Domicilio;
	public boolean Cobro = false;
	
    public Persona(boolean tipo, String nombre, String domicilio, boolean cobro) {
        this.setTipo(tipo);
        this.setNombre(nombre);
        this.setDomicilio(domicilio);
        this.setCobro(cobro);
    }
	
	public boolean getTipo() {
		return Tipo;
	}
	public void setTipo(boolean tipo) {
		Tipo = tipo;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getDomicilio() {
		return Domicilio;
	}
	public void setDomicilio(String domicilio) {
		Domicilio = domicilio;
	}
	public boolean getCobro() {
		return Cobro;
	}
	public void setCobro(boolean cobro) {
		Cobro = cobro;
	}
}
