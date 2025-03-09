package repaso_ej2;

import PaqueteLectura.Lector;

public class Repaso_Ej2 {
    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento("East Beach", "Los Santos", "8.00", "21.00", 3, 3);
        
        //Crear autos
        Auto a1, a2, a3, a4, a5, a6;
        a1 = new Auto("Sweet Johnson", "GROVE4L");
        a2 = new Auto("Ryder", "SHERM");
        a3 = new Auto("Big Smoke", "A2TMFK");
        a4 = new Auto("The Truth", "ASSMAN");
        a5 = new Auto("The Truth", "ƎЯƎHTTUO");
        a6 = new Auto("Jizzy B", "HO 2 HO");
        
        //Insertar autos en el estacionamiento
        estacionamiento.insertarAuto(a1, 1, 0);
        estacionamiento.insertarAuto(a2, 1, 2);
        estacionamiento.insertarAuto(a3, 2, 1);
        estacionamiento.insertarAuto(a4, 0, 0);
        estacionamiento.insertarAuto(a5, 1, 1);
        estacionamiento.insertarAuto(a6, 2, 0);
        
        //Imprimir la representación del estacionamiento
        System.out.println(estacionamiento.toString());
        
        //Imprimir la cantidad de autos aparcados en la plaza 1 (0) de cada piso
        System.out.println("Autos estacionados en la plaza 1: " + estacionamiento.numAutosPorPlaza(0));
        
        //Buscar auto por patente e imprimirlo si se encuentra
        System.out.print("INGRESE UNA PATENTE: ");
        String inpPatente = Lector.leerString();
        System.out.println(estacionamiento.buscarAutoPorPatente(inpPatente));
    }
}
