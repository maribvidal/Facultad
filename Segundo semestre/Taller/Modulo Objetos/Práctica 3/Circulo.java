package tema3;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    //Getters
    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }
    
    //Setters
    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    //Métodos de instancia que pide el punto
    public double calcularPerimetro() {
        double perimetro;
        perimetro = 2 * Math.PI * this.radio;
        return perimetro;
    }

    public double calcularArea() {
        double area;
        area = Math.PI * Math.pow(this.radio, 2);
        return area;
    }
    
    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + ", colorRelleno=" + colorRelleno + ", colorLinea=" + colorLinea + "}";
    }
}
