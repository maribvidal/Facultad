package tema4;

public class Persona extends Barrio {    
    //Constructor heredado
    public Persona(String nombre, int DNI, int edad){
        super(nombre, DNI, edad);
    }
    
    public String toString(){
        String aux = super.toString(); //Recibir toString de la superclase 
        return aux;
    }
}
