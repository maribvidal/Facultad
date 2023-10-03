package tema3;

import PaqueteLectura.Lector;

public class Ej01Triangulos {
    public static void main(String[] args) {
        double inpLado1, inpLado2, inpLado3;
        String inpColorRel, inpColorLinea;
        
        //Leer datos del ordenador
        System.out.println("Ingrese la longitud del primer lado: ");
        inpLado1 = Lector.leerDouble();
        System.out.println("Ingrese la longitud del segundo lado: ");
        inpLado2 = Lector.leerDouble();
        System.out.println("Ingrese la longitud del tercer lado: ");
        inpLado3 = Lector.leerDouble();
        System.out.println("Ingrese un color para la línea: ");
        inpColorLinea = Lector.leerString();
        System.out.println("Ingrese un color para el relleno: ");
        inpColorRel = Lector.leerString();
        System.out.println("");
        
        //Crear instancia de clase Triangulo
        Triangulo triangulo = new Triangulo(inpLado1, inpLado2, inpLado3);
        triangulo.setColorLinea(inpColorLinea);
        triangulo.setColorRelleno(inpColorRel);
        
        //Imprimir información del triángulo
        System.out.println(triangulo.toString());
        System.out.println("El perímetro del triangulo es: " + triangulo.calcularPerimetro());
        System.out.println("El área del triangulo es: " + triangulo.calcularArea());
    }
}
