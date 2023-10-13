package repaso_ej4;

public class CoroHileras extends Coro {
    private int dimL_F;
    private int dimL_C;
    private Corista [][] matriz_coristas;
    private int [] vec_matriz; //Un vector para almacenar los indices de cada columna
    private int vec_indice = 0;
    
    public CoroHileras(Director director, int cantFilas, int cantColumnas) {
        super(director, cantFilas, cantColumnas);
        this.dimL_F = this.getCantFilas();
        this.dimL_C = this.getCantColumnas();
        //System.out.println(this.dimL_C);
        this.matriz_coristas = new Corista [this.dimL_F][this.dimL_C];
        
        //Inicializar la matriz en todos 0s
        this.vec_matriz = new int [this.dimL_F];
        for (int i = 0; i < this.dimL_F; i++)
            this.vec_matriz[i] = 0;
    }
    
    //Otros métodos
    @Override
    public void agregarCorista(Corista nuevoCorista) {
        if (this.vec_indice < this.dimL_F) {
            //System.out.println(this.vec_indice + " " + this.vec_matriz[this.vec_indice]); - DEBUG
            if (this.vec_matriz[this.vec_indice] < this.dimL_C) { //Comprobar si la matriz está llena
                this.matriz_coristas[this.vec_indice][this.vec_matriz[this.vec_indice]] = nuevoCorista;
                this.vec_matriz[this.vec_indice]++;
                if (this.vec_matriz[this.vec_indice] == this.dimL_C)
                    this.vec_indice++;
            }
        }
    }
    @Override
    public boolean estaLleno() {
        return (this.vec_indice == dimL_F);
    }
    @Override
    public boolean estaBienFormado() {
        boolean aux = true;
        int i = 0, j = 0, valColPas = 0, valColAct, valPriAct, valPriPas = 9999;
        
        //No estoy orgulloso de como escribí este while, pero al menos hace lo que debe hacer sin cometer errores
        while (i <= this.vec_indice && this.vec_matriz[this.vec_indice] > 0 && aux) { //Mientras i sea menor que el tope y, hasta ahora, el coro se encuentre "bien formado"...
            valPriAct = this.matriz_coristas[i][j].getTonoFundamental();
            valColPas = valPriAct; //Asignarle el mismo valor para iterar bien el segundo while
            if (valPriAct >= valPriPas) //Si el tono de la primera persona de esta columna es mayor que el de la columna pasada...
                aux = false;
            while (j < this.vec_matriz[i] && aux) { //Mientras j sea menor que el indice y, hasta ahora, el coro se encuentre "bien formado"...
                valColAct = this.matriz_coristas[i][j].getTonoFundamental();
                if (valColAct != valColPas) //Si el tono del corista actual es diferente del pasado...
                    aux = false;
                valColPas = valColAct;
                j++;
            }
            j = 0;
            valPriPas = valPriAct; //Asignarle al valPriPas el valor del valPriAct para llevar el registro
            i++;
        }
        return aux;
    }
    @Override
    public String mostrarCoristas() {
        String aux = "";
        for (int i = 0; i <= this.vec_indice; i++) {
            for (int j = 0; j < this.vec_matriz[i]; j++) {
                //System.out.println(this.vec_indice + " " + i + " " + this.vec_matriz[i] + " " + j); - DEBUG
                aux = aux + this.matriz_coristas[i][j].toString() + "\n";
            }
        }
        return aux;
    }
}
