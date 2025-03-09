package tema3;

import PaqueteLectura.Lector;

public class Ej05Circulo {
    public static void main(String[] args) {
        double radio;
        String colorRelleno, colorLinea;
        Circulo circulo;
        
        System.out.println("Ingrese un radio: "); radio = Lector.leerDouble();
        System.out.println("Ingrese un color de relleno: "); colorRelleno = Lector.leerString();
        System.out.println("Ingrese un color de línea: "); colorLinea = Lector.leerString();
        circulo = new Circulo(radio, colorRelleno, colorLinea);
        
        System.out.println("Perímetro del círculo ingresado: " + circulo.calcularPerimetro());
        System.out.println("Area del círculo ingresado: " + circulo.calcularArea());
    }
}
