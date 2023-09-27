package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF1 = 5, dimF2 = 8, dimL1 = 0, dimL2 = 0, dni, edad;
        Persona matrizPersonas [][] = new Persona[dimF1][dimF2]; //dimF1 = Días, dimF2 = personas por día
        String nombre;
        
        //Primer elemento
        System.out.println("Ingrese el nombre del participante no." + dimL2 + ": ");
        nombre = Lector.leerString();
        dni = 1000 + GeneradorAleatorio.generarInt(1000);
        edad = 18 + GeneradorAleatorio.generarInt(50);
       
        //Simular proceso de inscripción (cargar matriz de personas)
        while (dimL1 < dimF1 && !(nombre.equals("ZZZ"))) {
            //Crear objeto persona
            Persona participante = new Persona(nombre, dni, edad);
            matrizPersonas[dimL1][dimL2] = participante; //Asignarlo a su respecto lugar en la matriz
            
            System.out.println(dimL2 < dimF2);
            
            if (dimL2 < dimF2-1) {
                dimL2++;
                } else {
                dimL2 = 0; dimF2++;
            }
            System.out.println("Ingrese el nombre del participante no." + dimL2 + ": ");
            nombre = Lector.leerString();
            dni = 1000 + GeneradorAleatorio.generarInt(1000);
            edad = 18 + GeneradorAleatorio.generarInt(50);
        }
        
        //Imprimir matriz
        int i, j;
        System.out.println(dimL1 + " " + dimL2);
        
        for (i = 0; i < dimL1; i++) {
            System.out.println("CASTING / DÍA: " + (i+1));
            for (j = 0; j < dimL2; j++)
                System.out.println("Persona entrevistada: " + matrizPersonas[i][j].toString()); //Leer el nombre de la persona
        }
    }
}
