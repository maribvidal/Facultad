package tema3;

import PaqueteLectura.Lector;

public class Ej03Estantes {
    public static void main(String[] args) {
        Estante estante = new Estante();
        Libro libro; //Solo declarar variable para mantener la referencia
        Autor libAutor; //Solo declarar variable para mantener la referencia
        String autNombre, libTitulo, libEditorial, libISBN, input = "";
        
        //Cargar estante hasta que se encuentre lleno
        while (!(input.equals("NO")) && (estante.consultarSiLleno() == false)) { //Mientras INPUT no sea igual a "NO" y el estante no se encuentre lleno...
            //Cargar un autor
            System.out.println("Nombre del autor del libro: "); autNombre = Lector.leerString();
            libAutor = new Autor(autNombre); //Enviar a la clase el mensaje de creación y guardar referencia
            
            //Cargar un libro  
            System.out.println("Título del libro: "); libTitulo = Lector.leerString();
            System.out.println("Editorial del libro: "); libEditorial = Lector.leerString();
            System.out.println("ISBN del libro: "); libISBN = Lector.leerString();
            libro = new Libro(libTitulo, libEditorial, libAutor, libISBN); //Envíar a la clase el mensaje de creación y guardar referencia
            
            //Agregar libro al estante
            estante.agregarLibro(libro);
            
            //Preguntarle al usuario si desea seguir leyendo
            if (!estante.consultarSiLleno())
                System.out.println(""); //Dejar espacio
                System.out.println("¿Desea agregar otro libro al estante? (SI/NO): "); input = Lector.leerString();
        }
        System.out.println("terminó el while");
        
        //Buscar el libro "Mujercitas"
        Libro mujercitas = new Libro();
        mujercitas = estante.buscarLibro("Mujercitas");
        if (mujercitas != null) {
            System.out.println("El autor del libro Mujercitas es " + mujercitas.getAutor());
        }
    }
}

/*
    Punto C: ¿Qué modificaría en la clase definida para ahora permitir estantes que almacenen como máximo N libros? ¿Cómo instanciaría el estante?
    RESP: Para que se pueda cambiar el máximo de libros que pueda almacenar cada instancia de la clase, pondría una variable "cantidadMaxima" como dimF del vector que se pudiera modificar dentro del comportamiento del objeto.
        El estante probablemente lo instanciaria como "Estante( cantidad de libros a almacenar)", osea que en el constructor solo pondría la variable cantidadMáxima.
*/
