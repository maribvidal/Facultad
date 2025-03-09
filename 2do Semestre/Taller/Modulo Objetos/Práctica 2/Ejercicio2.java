package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02VectorPersonas {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre;
        int i, cantMayores = 0, dniMenor = 999999, dni, edad, dimF = 15, dimL = 0;
        Persona [] vectorPersonas = new Persona [dimF]; //Vector de objetos de clase Persona
        Persona personaConElMenorDNI = new Persona(); //Crear un objeto persona y dejarlo vacío para luego usarlo como receptor de la persona con menor DNI
        
        do {
          System.out.println("Generando persona... (" + (dimL+1) + ")");
          nombre = GeneradorAleatorio.generarString(10);
          dni = 10000 + GeneradorAleatorio.generarInt(100);
          edad = GeneradorAleatorio.generarInt(100);
          Persona blank = new Persona(nombre, dni, edad);
          System.out.println(blank.toString());
          
          vectorPersonas[dimL] = blank;
          dimL++;
        } while (dimL < dimF && edad != 0);
        
        for (i = 0; i < dimF; i++) {
            if (vectorPersonas[i].getEdad() > 65) //Obtener la cantidad de personas mayores de 65 años
                cantMayores++;
            if (vectorPersonas[i].getDNI() < dniMenor) { //Obtener la persona con el menor DNI
                dniMenor = vectorPersonas[i].getDNI();
                personaConElMenorDNI = vectorPersonas[i];
            }
        }
        
        System.out.println("Hubo un total de " + cantMayores + " personas mayores de 65 años");
        System.out.println(personaConElMenorDNI.toString());
    }
}
