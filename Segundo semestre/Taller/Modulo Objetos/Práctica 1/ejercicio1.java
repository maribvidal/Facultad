public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11; //Declarar dimensión física del vector
        int [] tabla2 = new int[DF]; // indices de 0 a (DF - 1) 11
        int i;
        for (i=0; i < DF; i++) 
            tabla2[i]=2*i;
        
        //Variable generadora de enteros aleatorios
        GeneradorAleatorio.iniciar();   //inicia el generador aleatorio
        int numRand = GeneradorAleatorio.generarInt(DF + 1); //Limitar el rango hasta la DF (10) + 1 (11)
        
        while (numRand != 11) {
            System.out.println("2 x " + numRand + " = " + tabla2[numRand]);
            numRand = GeneradorAleatorio.generarInt(DF + 1); //generar otro
        }
        System.out.println("SE LEYÓ UN 11 - TERMINANDO PROGRAMA");
    }
}
