/*
Un libro posee título, nombre de su primer autor y peso.
 */
package practicaexamen;

public class Libro {
    private String titulo;
    private String nombre;
    private double peso;

    //Constructor
    public Libro(String titulo, String nombre, double peso) {
        this.setTitulo(titulo);
        this.setNombre(nombre);
        this.setPeso(peso);
    }
    
    //Getters y Setters
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPeso() {
        return peso;
    }
    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", nombre=" + nombre + ", peso=" + peso + '}';
    }
}
