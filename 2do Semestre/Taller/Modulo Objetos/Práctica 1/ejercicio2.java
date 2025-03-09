package tema1;

import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int DIMF = 15;
        double [] jugadores = new double[DIMF]; //Vector de dato tipo double
        int i, cant = 0; //Declarar variable i para usar en cualquier lugar. Variable para guardar la cantidad de jugadores.
        double aux, prom = 0; //Para leer. Para calcular el promedio (inicializar en 0).
        
        //Cargar vector
        for (i = 0; i < DIMF; i++) {
            System.out.println("Ingrese la altura del jugador no." + (i+1) + ": ");
            aux = Lector.leerDouble(); //Leer un double
            jugadores[i] = aux; //Asignar valor en la pos i de la tabla
            prom = prom + aux; //Ir acumulando los promedios en una variable
        }
        
        prom = (prom / DIMF); //Dividir promedio por la cantidad de jugadores
        System.out.println("ALTURA PROMEDIO DE LOS JUGADORES: " + prom);
        
        //Imprimir vector
        for (i = 0; i < DIMF; i++) {
            System.out.println("jugador[" + i + "] = " + jugadores[i]);
            if (jugadores[i] > prom) {
                System.out.println("Tiene una altura mayor a la del promedio (dist. del promedio: " + (jugadores[i] - prom) + ")");
                cant++;
            }
        }
        
        System.out.println("CANTIDAD DE JUGADORES CUYA ALTURA SUPERA EL PROMEDIO: " + cant);
    }
}
