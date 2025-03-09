package repaso_ej4;

public class CoroSemicircular extends Coro {
    private int dimL;
    private int indice = 0;
    private Corista [] vec_coristas;
    
    public CoroSemicircular(Director director, int cantCoristas) {
        super(director, cantCoristas);
        this.dimL = this.getCantCoristas();
        this.vec_coristas = new Corista [this.dimL];
    }
    
    //Otros métodos
    public void agregarCorista(Corista nuevoCorista) {
        if (this.indice < this.dimL) {
            this.vec_coristas[this.indice] = nuevoCorista;
            this.indice++;
        } else {
            System.out.println("ERROR: El coro está lleno");
        }
    }
    public boolean estaLleno() {
        return (indice == dimL); //Comparar el valor de la variable indice con la dimL para averiguar si se llenó o no
    }
    public boolean estaBienFormado() {
        boolean aux = true;
        int valorPasado = 9999, valorActual, i = 0;
        while (i < indice && aux) { //Mientras i sea menor que indice y, hasta ahora, el coro se encuentre "bien formado"...
            valorActual = this.vec_coristas[i].getTonoFundamental(); //Obtener el valor de tono del corista actual
            //System.out.println("Valor actual: " + valorActual + " / Valor pasado: " + valorPasado);
            if (valorActual >= valorPasado) //Si el valorActual es mayor o igual al valorPasado (lo que significa que no está ordenado de mayor a menor)
                aux = false;
            valorPasado = valorActual;
            i++;
        }
        return aux;
    }
    
    public String mostrarCoristas() {
        String aux = "";
        for (int i = 0; i < this.indice; i++) //Agregar coristas
            aux = aux + this.vec_coristas[i].toString() + "\n";
        return aux;
    }
}
