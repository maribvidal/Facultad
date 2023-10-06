package tema4;

public abstract class Estacion {
    private String nombre;
    private String latitud;
    private String longitud;
    
    public Estacion(String nombre, String latitud, String longitud){
        this.setNombre(nombre);
        this.setLatitud(latitud);
        this.setLongitud(longitud);
    }
    
    //Getters
    public String getNombre(){
        return nombre;
    }
    public String getLatitud(){
        return latitud;
    }
    public String getLongitud(){
        return longitud;
    }
    
    //Setters
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setLongitud(String longitud){
        this.longitud = longitud;
    }
    public void setLatitud(String latitud){
        this.latitud = latitud;
    }

    @Override
    public String toString() {
        return nombre + " (" + latitud + " - " + longitud + "):";
    }
}
