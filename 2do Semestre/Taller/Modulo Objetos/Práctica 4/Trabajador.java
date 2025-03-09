package tema4;

public class Trabajador extends Barrio {
    //Atributo propio
    private String oficio;
    
    //Constructor
    public Trabajador(String nombre, int DNI, int edad, String oficio){
        super(nombre, DNI, edad);
        this.setOficio(oficio);
    }

    //Getters
    public String getOficio(){
        return oficio;
    }

    //Setters
    public void setOficio(String oficio){
        this.oficio = oficio;
    }
    
    //toString
    public String toString(){
        String aux = super.toString();
        aux = aux + " Soy " + this.getOficio() + ".";
        return aux;
    }
}
