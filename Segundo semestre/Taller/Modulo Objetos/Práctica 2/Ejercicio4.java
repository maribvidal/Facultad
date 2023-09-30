package tema2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF1 = 5, dimF2 = 8, dimL1 = 0, dimL2 = 0, dni, edad, dia, aux, i, j;
        Persona matrizPersonas [][] = new Persona[dimF1][dimF2]; //dimF1 = Días, dimF2 = personas por día
        int matrizTurnosDia [] = new int[dimF2]; //Vector para tomar la cuenta de los turnos ocupados por día
        String nombre;
        
        //Inicializar matriz turnos en 0
        for (i = 0; i < dimF2; i++)
            matrizTurnosDia[i] = 0;
        
        //Primer elemento
        System.out.println("Ingrese el nombre del participante: ");
        nombre = Lector.leerString();
        dni = 1000 + GeneradorAleatorio.generarInt(1000);
        edad = 18 + GeneradorAleatorio.generarInt(50);
        System.out.println("Ingrese el día en el que quiera anotarse: ");
        dia = Lector.leerInt();
        
        int cupos = 0; //Para mantener la cuenta de los cupos
        
        while (cupos < 40 && !(nombre.equals("ZZZ"))) {
            aux = 0;
            
            //Asegurarse que el día leído esté dentro del rango (debe ir del 0 al 4)
            while (dia < 0 || dia > 4) {
                System.out.println("Ingrese un día que pertenezca al rango por favor: ");
                dia = Lector.leerInt();
            }
            
            //Asegurarse que el día tenga turnos libres
            if (matrizTurnosDia[dia] < dimF2) {
                Persona participante = new Persona(nombre, dni, edad);
                aux = matrizTurnosDia[dia];
                System.out.println("Turno " + aux + " del día " + dia + " ha sido ocupado!");
                matrizPersonas[dia][aux] = participante;
                matrizTurnosDia[dia]++; //Incrementar el contador por día
                cupos++; //Incrementar cupo
            } else {
                System.out.println("No se pudo encontrar un lugar libre en el vector");
            }
            
            //Leer otra persona
            System.out.println("Ingrese el nombre del participante: ");
            nombre = Lector.leerString();
            dni = 1000 + GeneradorAleatorio.generarInt(1000);
            edad = 18 + GeneradorAleatorio.generarInt(50);
            System.out.println("Ingrese el día en el que quiera anotarse: ");
            dia = Lector.leerInt();
        }
        //Imprimir matriz
        for (i = 0; i < dimF1; i++) {
            aux = matrizTurnosDia[i];
            System.out.println("CASTING / DÍA: " + (i+1));
            for (j = 0; j < aux; j++) {
                System.out.println("Persona entrevistada: " + matrizPersonas[i][j].toString()); //Leer el nombre de la persona
            }
        }
    }
}
