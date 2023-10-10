package practicaexamen;

/**
Una estantería mantiene sus libros organizados en N estantes cada uno con lugar para M libros. 
* la estantería para N estantes y lugar para M libros por estante.
* METODOS
* almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al libro en la estantería. 
* Asuma que dicho lugar está disponible.
* sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando su lugar disponible. 
* Tenga en cuenta que el libro puede no existir.
* calcular: calcula y devuelve el libro más pesado de la estantería.
 */
public class Estanteria {
    private int cantEstantes; //DimF
    private int cantLibros; //DimF2
    private Libro [][] matriz_libros;
    
    public Estanteria(int cantEstantes, int cantLibros) {
        this.setCantEstantes(cantEstantes);
        this.setCantLibros(cantLibros);
        this.matriz_libros = new Libro [this.getCantEstantes()][this.getCantLibros()]; //(inicialmente no debe tener libros cargados)
    }
    
    //Métodos que pide el inciso B
    public void almacenarLibro(Libro unLibro, int nroEstante, int nroLugar){ //Se asume que el lugar está disponible
        this.matriz_libros[nroEstante][nroLugar] = unLibro;
    }
    public Libro sacarLibro(String titulo){
        int i = 0, j = 0;
        boolean encontrado = false;
        Libro libroBuscado = null;
        
        while (i < this.getCantEstantes() && !encontrado){
            while (j < this.getCantLibros() && !encontrado){
                if (this.matriz_libros[i][j] != null){
                    if (this.matriz_libros[i][j].getTitulo().equals(titulo)){
                        encontrado = true;
                        libroBuscado = this.matriz_libros[i][j];
                        this.matriz_libros[i][j] = null;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        
        return libroBuscado;
    }
    public Libro calcular(){
        double pesoMax = 0;
        Libro libroBuscado = null;
        
        for (int i = 0; i < this.getCantEstantes(); i++){
            for (int j = 0; j < this.getCantLibros(); j++){
                if (this.matriz_libros[i][j] != null){ //El libro puede no existir, para ahorrarnos un "nullPointerException"
                    if (this.matriz_libros[i][j].getPeso() > pesoMax){
                        libroBuscado = this.matriz_libros[i][j];
                        pesoMax = this.matriz_libros[i][j].getPeso();
                    }
                }
            }
        }
        
        return libroBuscado;
    }
    //Setters y Getters
    public int getCantEstantes() {
        return this.cantEstantes;
    }
    public void setCantEstantes(int cantEstantes) {
        this.cantEstantes = cantEstantes;
    }

    public int getCantLibros() {
        return this.cantLibros;
    }
    public void setCantLibros(int cantLibros) {
        this.cantLibros = cantLibros;
    }
}
