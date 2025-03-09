package repaso_ej4;

public abstract class Persona {
    private String nombre;
    private String DNI; //Lo pongo como DNI para mas facilidad
    private int edad;

    public Persona(String nombre, String DNI, int edad) {
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(edad);
    }
    
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }
    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    //Otros métodos
    public String toString() {
        String aux = "[NOMBRE: " + this.getNombre() + " / DNI: " + this.getDNI() + " / EDAD: " + this.getEdad() + " ";
        return aux;
    }
}
