package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	GeneradorAleatorio.iniciar();   
	
        int i, j, dimF = 5, valorTope = 30;
        int [][] tabla = new int [dimF][dimF];
        
        //Inicializar vector doble
        for (i = 0; i < dimF; i++)
            for (j = 0; j < dimF; j++)
                tabla[i][j] = GeneradorAleatorio.generarInt(valorTope);
    
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("CONTENIDO DE LA MATRIZ");
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimF; j++) {
                System.out.print("POS (" + i + ", " + j + "): " + tabla[i][j] + " / ");
            }
            System.out.println("");
        }
        System.out.println("");
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (j = 0; j < dimF; j++)
            suma += tabla[0][j]; //Sumar elementos de la FILA 1
        System.out.println("SUMA DE LOS ELEMENTOS DE LA FILA 1: " + suma);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] tabla2 = new int [dimF];
        for (i = 0; i < dimF; i++) {
            suma = 0;
            for (j = 0; j < dimF; j++) {
                suma += tabla[j][i]; //Sumar el elemento de la fila J de la columna I
            }
            tabla2[i] = suma; //Asignarlo a la tabla
        }
        
        for (i = 0; i < dimF; i++)
            System.out.print("POS (" + i + "): " + tabla2[i] + " / ");
        System.out.println("");
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int numInput, posF = -1, posC = -1;
        boolean encontrado = false;
        System.out.println("Lea un entero: ");
        numInput = Lector.leerInt();
        i = 0; //Poner I en 0
        while (i < dimF && !encontrado) {
            j = 0; //Inicializar J en 0 para leer otra vez
            while (j < dimF && !encontrado) {
                if (tabla[i][j] == numInput) { //Si se encontró el elemento, guardar fila y columna
                    encontrado = true;
                    posF = i;
                    posC = j;
                }
                j++;
            }
            i++;
        }
        
        if (encontrado) {
            System.out.println("El elemento se encontró en la posición (" + posF + ", " + posC + ")");
        } else {
            System.out.println("No se encontró el elemento");
        }
    }
}
