package repaso_ej3;

/*
 De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante
el recital.
El constructor de recitales recibe el nombre de la banda
y la cantidad de temas que tendrá el recital. 
*/

public abstract class Recital {
    private String nombreBanda;
    private int cantidadTemas = 0;
    private int dimL = 0;
    private String [] temas; //Lista de temas

    public Recital(String nombreBanda, int cantidadTemas) {
        this.setNombreBanda(nombreBanda);
        this.cantidadTemas = cantidadTemas;
        this.temas = new String[this.cantidadTemas];
    }
            
    public String getNombreBanda() {
        return nombreBanda;
    }
    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    //Otros métodos
    /*
    i. Cualquier recital debe saber responder a los mensajes:
 agregarTema que recibe el  nombre de un tema y lo agrega a la lista de temas.
 actuar que imprime (por consola) para cada tema la leyenda “y ahora
tocaremos…” seguido por el nombre del tema.
    */
    public void agregarTema(String nombreTema) {
        if (this.dimL < this.cantidadTemas) {
            this.temas[dimL] = nombreTema;
            this.dimL++;
        } else {
            System.out.println("ERROR: No se pueden agregar mas temas");
        }
    }
    public void actuar() {
        for (int i = 0; i < this.dimL; i++)
            System.out.println("Y ahora tocaremos..." + this.temas[i]);
    }
    public abstract int calcularCosto();
}
