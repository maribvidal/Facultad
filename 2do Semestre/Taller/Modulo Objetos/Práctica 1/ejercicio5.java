package tema1;

import PaqueteLectura.Lector;

public class Ej05Restaurante {
    public static void main(String[] args) {
        int i, j, numInput, topeClientes = 5, topeAspectos = 4;
        int [][] entrevista = new int [topeClientes][topeAspectos];
        
        //Cargar matriz de 5x4
        for (i = 0; i < topeClientes; i++) {
            System.out.println("CLIENTE NRO." + (i+1));
            for (j = 0; j < topeAspectos; j++) {
                //Leer un número del 1 al 10
                System.out.println("Califique del 1 al 10 la categoría nro." + j + ": ");
                numInput = Lector.leerInt();
                while (numInput < 1 || numInput > 10) { //Asegurarse que se lea un número correcto
                    System.out.println("Por favor ingrese un número que pertenezca al rango: ");
                    numInput = Lector.leerInt();
                }
                
                //Asignar número a posición
                entrevista[i][j] = numInput;
            }
        }
        
        //Sacar promedios de las calificaciones por aspecto
        int prom;
        for (j = 0; j < topeAspectos; j++) {
            prom = 0;
            for (i = 0; i < topeClientes; i++) {
                prom += entrevista[i][j];
            }
            prom = (prom / 5);
            System.out.println("El aspecto nro." + j + " recibió una calificación promedio de " + prom);
        }
    }
}
