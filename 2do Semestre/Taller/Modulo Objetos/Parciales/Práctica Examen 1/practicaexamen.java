package practicaexamen;

/*
1) Queremos representar estanterías de libros. Una estantería mantiene sus libros organizados en N estantes cada uno con lugar para M libros. Un libro posee título, nombre de su primer autor y peso.
a) Implemente las clases de su modelo, con sus atributos y getters/setters adecuados.
 Provea constructores para iniciar: los libros a partir de toda su información; la estantería para N estantes y lugar para M libros por estante (inicialmente no debe tener libros cargados).

b) Implemente los siguientes métodos:
- almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al libro en la estantería. Asuma que dicho lugar está disponible.

- sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando su lugar disponible. Tenga en cuenta que el libro puede no existir.

- calcular: calcula y devuelve el libro más pesado de la estantería.

2) Realice un programa que instancie una estantería para 5 estantes y 3 libros por estante. 
Almacene 7 libros en la estantería. 
A partir de la estantería: saque un libro e informe su representación String; luego, informe el título del libro más pesado.
 */
public class PracticaExamen {
    public static void main(String[] args) {
        //Crear la estanteria (instanciarla y pasarle la referencia a una variable)
        Estanteria estanteria = new Estanteria(5, 3);
        
        //Crear los libros (lo mismo)
        Libro l1 = new Libro("Fahrenheit 451", "Ray Bradbury", 10);
        Libro l2 = new Libro("Anatomía del Estado", "Murray Rothbard", 2);
        Libro l3 = new Libro("Crítica de la Razón Pura", "Immanuel Kant", 30);
        Libro l4 = new Libro("La Biblia", "Jehova", 60);
        Libro l5 = new Libro("Cien Años de Soledad", "Gabriel Garcia Marquez", 35);
        Libro l6 = new Libro("Orgullo y prejuicio", "Jane Austen", 15);
        Libro l7 = new Libro("El Extranjero", "Albert Camus", 8);
        
        //Almacenarlos
        estanteria.almacenarLibro(l1, 0, 0);
        estanteria.almacenarLibro(l2, 0, 1);
        estanteria.almacenarLibro(l3, 0, 2);
        estanteria.almacenarLibro(l4, 2, 0);
        estanteria.almacenarLibro(l5, 2, 2);
        estanteria.almacenarLibro(l6, 3, 1);
        estanteria.almacenarLibro(l7, 4, 2);
        
        //Quitar un libro e informarlo
        Libro libroRecibido;
        libroRecibido = estanteria.sacarLibro("Orgullo y prejuicio");
        if (libroRecibido != null) //Tenga en cuenta que el libro puede no existir
            System.out.println(libroRecibido.toString());
        
        //Informar el título del libro mas pesado
        System.out.println(estanteria.calcular());
    }  
}
