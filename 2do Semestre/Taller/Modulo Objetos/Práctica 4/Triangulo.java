package tema4;

public class Triangulo extends Figura {
    private int lado1;
    private int lado2;
    private int lado3;
    
    public Triangulo(String unCR, String unCL, int lado1, int lado2, int lado3) {
        super(unCR, unCL); //Constructor de la superclase
        this.setLado1(lado1);
        this.setLado2(lado2);
        this.setLado3(lado3);
    }
    
    //Getters
    public int getLado1() {
        return lado1;
    }
    public int getLado2() {
        return lado2;
    }
    public int getLado3() {
        return lado3;
    }
    
    //Setters
    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }
    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }
    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }
    
    //Otros métodos
    @Override //La superclase Figura obliga a escribir un método con el mismo nombre
    public double calcularPerimetro() {
        double calculo = (this.getLado1() + this.getLado2() + this.getLado3());
        return calculo;
    }
    
    @Override
    public double calcularArea() {
        double aux = (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
        double calculo = Math.sqrt(aux * (aux - this.getLado1()) * (aux - this.getLado2()) * (aux - this.getLado3()));
        return calculo;
    }
    
    @Override
    public String toString() {
        String aux = super.toString(); //Obtener el texto del toString de la superclase Figura
        String texto = aux + " Lado 1: " + this.getLado1() + 
                             " Lado 2: " + this.getLado2() +
                             " Lado 3: " + this.getLado3();
        return texto;
    }
}
