package tema4;

public class MainVisorFiguras {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();

        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

        visor.guardar(c1);
        visor.guardar(r);
        visor.guardar(c2);

        visor.mostrar();
    }
}
