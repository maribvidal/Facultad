package tema1;

import PaqueteLectura.Lector;

public class Ej04Oficinas {
    public static void main(String[] args) {
        int i, j, nroPiso, nroOficina, topePiso = 8, topeOficina = 4;
        int [][] edificio = new int[topePiso+1][topeOficina+1]; //Le sumamos 1 a cada campo para que la matriz se recorra como 1..8 y 1..4
        
        //Inicializar matriz
        for (i = 1; i < topePiso+1; i++)
            for (j = 1; j < topeOficina+1; j++)
                edificio[i][j] = 0;
        
        //Llegada de personas al edificio
        System.out.println("Lea un número de piso: ");
        nroPiso = Lector.leerInt();
        while (nroPiso != 9) {
            System.out.println("Lea un número de oficina: ");
            nroOficina = Lector.leerInt();
            edificio[nroPiso][nroOficina] += 1; //Incrementar la cantidad de personas que se encuentran en tal lugar
            System.out.println("Lea un número de piso: ");
            nroPiso = Lector.leerInt();
        }
        
        //Imprimir matriz entera
        for (i = 1; i < topePiso+1; i++) {
            for (j = 1; j < topeOficina+1; j++)
                System.out.println("Piso: " + i + " / Oficina: " + j + " / GENTE: " + edificio[i][j]);
        }
    }
}
