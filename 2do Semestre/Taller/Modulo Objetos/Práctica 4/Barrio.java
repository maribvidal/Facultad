package tema4;

public abstract class Barrio {
    //Variables que comparten tanto Personas como Trabajadores
    private String nombre;
    private int DNI;
    private int edad;
    
    //Constructor
    public Barrio(String nombre, int DNI, int edad){
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(edad);
    }
    
    //Getters
    public int getDNI(){
        return DNI;
    }
    public int getEdad(){
        return edad;
    }
    public String getNombre(){
        return nombre;
    }

    //Setters
    public void setDNI(int unDNI){
        DNI = unDNI;
    }
    public void setEdad(int unaEdad){
        edad = unaEdad;
    }
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    //toString
    public String toString(){ //“Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años"
        String aux = "Mi nombre es " + this.getNombre() + ", mi DNI es " + this.getDNI() + " y tengo " + this.getEdad() + " años.";
        return aux;
    }
}
