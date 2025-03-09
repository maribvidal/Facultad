package tema3;

public class Cliente {
    private String nombre;
    private String DNI;
    private int edad = 0;
    
    public Cliente(String nombre, String DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }
    
    //Getters
    public String getNombre() {
        return this.nombre;
    }
    
    public String getDNI() {
        return this.DNI;
    }
    
    public int getEdad() {
        return this.edad;
    }
    
    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Cliente{" + "nombre=" + nombre + ", DNI=" + DNI + ", edad=" + edad + '}';
    }
}
