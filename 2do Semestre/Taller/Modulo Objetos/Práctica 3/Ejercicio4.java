package tema3;

import PaqueteLectura.Lector;

public class Ej04 {
    public static void main(String[] args) {
        int i, cliEdad, n = 5;//numero habitaciones 
        String cliNombre, cliDNI;
        Hotel hotel = new Hotel(n);
        Cliente c;
        
        for (i = 0; i < (n - 2); i++) {
            //Leer información del cliente
            System.out.println("Nombre del cliente: ");
            cliNombre = Lector.leerString();
            System.out.println("DNI del cliente: ");
            cliDNI = Lector.leerString();
            System.out.println("Edad del cliente: ");
            cliEdad = Lector.leerInt();
            
            //Crear cliente
            c = new Cliente(cliNombre, cliDNI, cliEdad);
            
            //Meter cliente al hotel
            hotel.meterCliente(i, c);
        }
        
        //Mostrar el hotel
        System.out.println(hotel.toString());
        
        //Aumentar el precio de todas las habitaciones y mostrar hotel nuevamente
        hotel.aumentarPrecio(50);
        System.out.println(hotel.toString());
    }
}
