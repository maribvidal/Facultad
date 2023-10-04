package tema4;

public class Ej02Club {
    public static void main(String[] args){
        Jugador messi = new Jugador("Messi", 150, 20, 10, 10);
        Entrenador scaloni = new Entrenador("Scaloni", 50, 2, 10);
        
        System.out.println(messi.toString());
        System.out.println(scaloni.toString());
    }
}
