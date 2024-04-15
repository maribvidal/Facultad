---------------------- INCISO A ----------------------
A[] vector = [new C(1), new D(2), new B(3), new D(4), new B(5)];
foreach (A a in vector)
{
    if (!(a is C))
     a.Imprimir();
}

---------------------- INCISO B ----------------------
A[] vector = [new C(1), new D(2), new B(3), new D(4), new B(5)];
foreach (A a in vector)
{
    if (a.GetType() == typeof(B)) 
     a.Imprimir();
}
