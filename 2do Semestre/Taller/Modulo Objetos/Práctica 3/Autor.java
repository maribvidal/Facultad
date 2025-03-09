package tema3;

public class Autor {
    //ESTADO INTERNO
    private String nombre;
    private String biografia = "";
    private String origen = "";
    
    public Autor(String nombre) { //Constructor del objeto
        this.nombre = nombre;
    }
    
    //Getters
    public String getNombre() {
        return this.nombre;
    }
    
    public String getBiografia() {
        return this.biografia;
    }
    
    public String getOrigen() {
        return this.origen;
    }
    
    //Setters
    public void setNombre(String unNombre) {
        this.nombre = unNombre;
    }
    
    public void setBiografia(String unaBiografia) {
        this.nombre = unaBiografia;
    }

    public void setOrigen(String unOrigen) {
        this.nombre = unOrigen;
    }
    
    //El método toString
    @Override
    public String toString() {
        String texto = "El autor " + this.nombre + " nació en " + this.origen + " / Biografía: " + this.biografia;
        return texto;
    }
}
