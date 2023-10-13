package repaso_ej4;

public abstract class Coro {
    private Director director;
    private int cantCoristas;
    private int cantFilas;
    private int cantColumnas;
    
    public Coro(Director director, int cantCoristas) { //Primer constructor
        this.setDirector(director);
        this.cantCoristas = cantCoristas;
    }
    
    public Coro(Director director, int cantFilas, int cantColumnas) { //Segundo constructor
        this.setDirector(director);
        this.cantFilas = cantFilas;
        this.cantColumnas = cantColumnas;
    }

    public Director getDirector() {
        return director;
    }
    public void setDirector(Director director) {
        this.director = director;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }
    public int getCantFilas() {
        return cantFilas;
    }
    public int getCantColumnas() {
        return cantColumnas;
    }
    
    public String toString() {
        String aux = " // INFORMACIÓN DEL CORO // \n";
        aux = aux + director.toString() + "\n";
        aux = aux + this.mostrarCoristas();
        return aux;
    }
    
    //Otros métodos
    public abstract void agregarCorista(Corista nuevoCorista);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    public abstract String mostrarCoristas();
}
