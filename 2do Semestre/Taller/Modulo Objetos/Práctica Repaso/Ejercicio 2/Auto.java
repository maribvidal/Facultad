package repaso_ej2;

public class Auto {
    private String nombre;
    private String patente;

    public Auto(String nombre, String patente) {
        this.setNombre(nombre);
        this.setPatente(patente);
    }
    
    //Getters
    public String getNombre() {
        return nombre;
    }
    public String getPatente() {
        return patente;
    }

    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    //Otros métodos
    public String toString() {
        return "[DUEÑO: " + this.getNombre() + " / PATENTE: " + this.getPatente() + "]";
    }
}
