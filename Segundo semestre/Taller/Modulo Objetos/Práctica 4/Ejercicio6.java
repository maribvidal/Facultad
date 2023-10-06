package tema4;

public class Ej06Estacion {
    public static void main(String[] args){
        SistemaMes sistmes = new SistemaMes("La Plata", "32.42 S", "70 O", 10, 1990);
        SistemaAño sistaño = new SistemaAño("La Plata", "32.42 S", "70 O", 10, 1990);
        sistmes.registrarTemp(15000, 2);
        sistaño.registrarTemp(16000, 1995);
        System.out.println(sistmes.toString());
        System.out.println("");
        System.out.println(sistaño.toString());
        
        //Falta punto F
    }
}
