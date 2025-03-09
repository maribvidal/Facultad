package tema3;

public class Triangulo {
    //ESTADO INTERNO DEL OBJETO
    private double lado1;
    private double lado2; 
    private double lado3;
    private String colorRelleno = "Blanco"; //Se inicializa esta variable
    private String colorLinea = "Negro"; //Se inicializa también esta
    
    public Triangulo(double lado1, double lado2, double lado3) { //Constructor que pide solo lo necesario
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    //COMPORTAMIENTO DEL OBJETO
    //Getters
    public double getLado1() {
        return this.lado1; 
    }
    
    public double getLado2() {
        return this.lado2; 
    }
    
    public double getLado3() {
        return this.lado3; 
    }
    
    public String getColorRelleno() {
        return this.colorRelleno; 
    }
    
    public String getColorLinea() { //Devolución de datos
        return this.colorLinea;
    }
    
    //Setters
    public void setLado1(double unLado) { //Envío de datos
        this.lado1 = unLado;
    }
    
    public void setLado2(double unLado) {
        this.lado2 = unLado;
    }
    
    public void setLado3(double unLado) {
        this.lado3 = unLado;
    }
    
    public void setColorRelleno(String unColorRelleno) {
        this.colorRelleno = unColorRelleno;
    }
    
    public void setColorLinea(String unColorLinea) {
        this.colorLinea = unColorLinea;
    }
    
    //Otros métodos de instancia - operan sobre el ESTADO INTERNO del OBJETO
    public double calcularPerimetro() { //El perímetro es la suma (de la longitud) de sus lados
        double calculo = this.lado1 + this.lado2 + this.lado3;
        return calculo;
    }
    
    public double calcularArea() { //El área se calcula usando la fórmula proveida por la práctica
        double aux = (this.lado1 + this.lado2 + this.lado3) / 2;
        double calculo = Math.sqrt(aux * (aux - this.lado1) * (aux - this.lado2) * (aux - this.lado3));
        return calculo;
    }

    public String toString() {
        String texto = "Este triangulo (de lados " + this.lado1 + ", " + this.lado2 + " y " + this.lado3 + ") tiene su línea de color " + this.colorLinea + " y su relleno de color " + this.colorRelleno + "";
        return texto;
    }
}
