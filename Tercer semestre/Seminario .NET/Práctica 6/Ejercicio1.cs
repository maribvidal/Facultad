A[] vector = [new A(3), new B(5), new C(15), new D(41)];
foreach (A a in vector)
{
    a.Imprimir();
}

class A
{
    protected int _id; //protected --> extiende su acceso a las clases derivadas
    public A(int id) => _id = id;
    public virtual void Imprimir() => Console.WriteLine($"A_{_id}"); //virtual --> permite que las clases derivadas invaliden este método sobreescribiéndolo
}

class B : A //se hereda el comportamiento y los atributos de la clase A
{
    public B(int id) : base(id) { } //se invoca el constructor base con el parámetro id
    public override void Imprimir() //se sobreescribe el método de la clase base
    {
        Console.Write($"B_{_id} --> ");
        base.Imprimir(); //se invoca al método de la clase base
    }
}

class C : B
{
    public C(int id) : base(id) { }
    public override void Imprimir()
    {
        Console.Write($"C_{_id} --> ");
        base.Imprimir();
    }
}

class D : C
{
    public D(int id) : base(id) { }
    public override void Imprimir()
    {
        Console.Write($"D_{_id} --> ");
        base.Imprimir();
    }
}
