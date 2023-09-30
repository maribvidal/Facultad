package tema2;

import PaqueteLectura.Lector;

public class Ejercicio5 {
    public static void main(String[] args) {
        int partido_dimF = 20, partidosAlcanzados = 0;
        Partido vectorPartidos [] = new Partido[partido_dimF];
        String nombreCorte = "ZZZ";
        
        //Cargar los datos de un partido
        String equipoLocal, equipoVisitante;
        int golesLocal, golesVisitante;
        
        //Leer nombre del contrincante
        System.out.println("Nombre del equipo visitante: ");
        equipoVisitante = Lector.leerString();
        
        while ((partidosAlcanzados < partido_dimF) && !(equipoVisitante.equals(nombreCorte))) {
            //Leer resto del objeto
            System.out.println("Cant. de goles del equipo visitante: ");
            golesVisitante = Lector.leerInt();
            System.out.println("Nombre del equipo local: ");
            equipoLocal = Lector.leerString();
            System.out.println("Cant. de goles del equipo local: ");
            golesLocal = Lector.leerInt();
            
            //Meter partido dentro del vector
            Partido partidoTemp = new Partido(equipoLocal, equipoVisitante, golesLocal, golesVisitante);
            vectorPartidos[partidosAlcanzados] = partidoTemp;
            partidosAlcanzados++; //Incrementar cantidad leída
            
            //Cargar otro partido
            System.out.println("Nombre del equipo visitante: ");
            equipoVisitante = Lector.leerString();
        }
        
        //Informar partidos
        int i, riverGanadas = 0, bocaGoles = 0;
        for (i = 0; i < partidosAlcanzados; i++) { //Inciso 1
            System.out.println("{" + vectorPartidos[i].getLocal() + 
                    " " + vectorPartidos[i].getGolesLocal() + 
                    " VS " + vectorPartidos[i].getVisitante() +
                    " " + vectorPartidos[i].getGolesVisitante() + "}");
            
            if (vectorPartidos[i].hayGanador()) { //Inciso 2
                if (vectorPartidos[i].getGanador().equals("River"))
                    riverGanadas++;
            }
            
            if (vectorPartidos[i].getLocal().equals("Boca")) //Inciso 3
                bocaGoles += vectorPartidos[i].getGolesLocal();
        }
        
        //Informar lo de River y Boca
        System.out.println("River ganó " + riverGanadas + " partidos");
        System.out.println("Boca en total metió " + bocaGoles + " goles jugando de local");
    }
}
