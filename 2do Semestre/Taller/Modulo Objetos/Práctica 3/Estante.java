package tema3;

public class Estante {
    private int cantidadMaxima = 10;
    private Libro [] libros = new Libro [cantidadMaxima]; //Vector para los libros
    private int cantidadLibros = 0; //Esencialmente un dimensión lógica
    
    //Constructor vacío
    public Estante() {
    }
    
    //Método i
    public int consultarLibrosAlmacenados() {
        return this.cantidadLibros;
    }
    
    //Método ii
    public boolean consultarSiLleno() {
        return (this.cantidadLibros == this.cantidadMaxima); //Devolver TRUE solo si la cantidad de libros es igual a 20
    }
    
    //Método iii
    public void agregarLibro(Libro unLibro) {
        if (this.cantidadLibros < this.cantidadMaxima) { //Primero preguntar si se alcanzó la cantidad máxima
            this.libros[this.cantidadLibros] = unLibro; //Asignar libro a cierta posición
            this.cantidadLibros++; //Incrementar la cantidad de libros
        } else {
            System.out.println("ERROR: No es posible agregar otro libro al estante");
        }
    }
    
    //Método iv
    public Libro buscarLibro(String titulo) {
        //Inicializar variables con alcance local
        int i = 0;
        boolean encontrado = false;
        
        //Buscar si se encuentra el libro en el vector
        while (i < this.cantidadLibros && !encontrado) { //Mientras I sea menor que la cantidad de libros que tenga almacenado el vector Y no se haya encontrado el libro con dicho título...
            if (this.libros[i].getTitulo().equals(titulo)) { //Si el título del libro del elemento actual del vector COINCIDE con aquel pasado por parámetro entonces...
                encontrado = true; //Terminar bucle
            } else {
                i++; //Seguir con el bucle
            }
        }
        
        if (encontrado) {
            return this.libros[i]; //Devolverlo
        } else {
            System.out.println("ERROR: No se encuentra dentro del estante un libro con tal título");
            return null; //Devolver null
        }
    }

    public String toString() {
        String texto = "Este estante tiene " + this.cantidadLibros + " libros adentro suyo.";
        return texto;
    }
}
