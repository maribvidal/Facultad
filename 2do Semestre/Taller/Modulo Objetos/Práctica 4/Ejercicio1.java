package tema4;

public class Ej01Figuras {
    public static void main(String[] args){
        Triangulo triangulo = new Triangulo("Rojo", "Azul", 1, 2, 3);
        Circulo circulo = new Circulo("Verde", "Amarillo", 6);
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        circulo.despintar();
        System.out.println(circulo.toString());
    }
}
