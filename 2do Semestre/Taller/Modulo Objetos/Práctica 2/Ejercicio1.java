package tema2;

import PaqueteLectura.Lector;

public class Ej01CrearPersona {
    public static void main(String[] args) {
        String nombre;
        int dni, edad;
        
        System.out.println("Ingrese un nombre: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese un DNI: ");
        dni = Lector.leerInt();
        System.out.println("Ingrese una edad: ");
        edad = Lector.leerInt();
        
        Persona persona = new Persona(nombre, dni, edad);
        System.out.println(persona.toString());
    }
}
