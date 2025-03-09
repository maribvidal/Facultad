package tema4;

public class Ej03Barrio {
    public static void main(String[] args) {
        String nombre1 = "Milton", nombre2 = "Kevin", oficio = "Freelancer";
        int DNI1 = 151334811, DNI2 = 1439221995, edad1 = 94, edad2 = 60;
        Persona persona = new Persona(nombre1, DNI1, edad1);
        Trabajador trabajador = new Trabajador(nombre2, DNI2, edad2, oficio);
        
        System.out.println(persona.toString());
        System.out.println(trabajador.toString());
    }
}
