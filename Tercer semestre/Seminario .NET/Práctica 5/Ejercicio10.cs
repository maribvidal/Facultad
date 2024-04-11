class A

{
    private static int a; //Campo privado estático tipo entero
    private static readonly int b; //Campo privado estático de SOLO LECTURA tipo entero
    A() { } //Constructo vacío de tipo público de la clase
    public A(int i) : this() { } //Constructor público de la clase que pide un parámetro entero e invoca el constructor anterior
    static A() => b = 2; //Constructor estático que pide ???
    int c; //Variable pública entera sin inicializar
    public static void A1() => a = 1; //Constructor estático que le asigna 1 a la variable estática "a"
    public int A1(int a) => A.a + a; //Método de instancia que suma "a" con la variable estática "a" de la clase
    public static int A2; //Variable estática pública entera
    static int A3 => 3; //Propiedad estática pública de lectura
    private int A4() => 4; //Método privado de instancia que devuelve un 4
    public int A5 { get => 5; } //Propiedad de lectura pública que devuelve un 5
    int A6 { set => c = value; } //Propiedad de escritura pública que le asigna un valor entero a "c"
    public int A7 { get; set; } //Propiedad de lectura-escritura auto-implementada
    public int A8 { get; } = 8; //Variable pública entera de lectura inicializada con valor 8
    public int this[int i] => i; //Indizador público que devuelve el número entero que le pases como parámetro
}
