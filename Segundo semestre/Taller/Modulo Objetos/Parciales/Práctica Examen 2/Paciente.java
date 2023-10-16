package repasoparcial;

public class Paciente {
    private String nombre;
    private boolean tieneObraSocial;
    private double costoSesion;

    public Paciente(String nombre, boolean tieneObraSocial, double costoSesion) {
        this.setNombre(nombre);
        this.setTieneObraSocial(tieneObraSocial);
        this.setCostoSesion(costoSesion);
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTieneObraSocial(boolean tieneObraSocial) {
        this.tieneObraSocial = tieneObraSocial;
    }

    public double getCostoSesion() {
        return costoSesion;
    }
    public void setCostoSesion(double costoSesion) {
        this.costoSesion = costoSesion;
    }

    @Override
    public String toString() {
        return "{" + "nombre=" + nombre + ", tieneObraSocial=" + tieneObraSocial + ", costoSesion=" + costoSesion + '}';
    }
}
