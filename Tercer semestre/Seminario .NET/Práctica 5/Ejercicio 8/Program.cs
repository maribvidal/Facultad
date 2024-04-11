using teoria5;

DateTime mismaFecha = new DateTime(2000, 6, 12);
ListaDePersonas lista = new ListaDePersonas();
Persona sujeto1 = new Persona();
Persona sujeto2 = new Persona();
Persona sujeto3 = new Persona();
Persona sujeto4 = new Persona();
sujeto1[0] = "aA"; sujeto1[1] = 'M'; sujeto1[2] = 123; sujeto1[3] = mismaFecha;
sujeto2[0] = "aB"; sujeto2[1] = 'M'; sujeto2[2] = 234; sujeto2[3] = mismaFecha;
sujeto3[0] = "aC"; sujeto3[1] = 'F'; sujeto3[2] = 345; sujeto3[3] = mismaFecha;
sujeto4[0] = "D"; sujeto4[1] = 'F'; sujeto4[2] = 456; sujeto4[3] = mismaFecha;  

lista.Agregar(sujeto1);
lista.Agregar(sujeto2);
lista.Agregar(sujeto3);
lista.Agregar(sujeto4);

//Probar código
Persona unaPersona = lista[345];
unaPersona.Imprimir();
List<string> unaLista = lista['a'];
foreach (string nom in unaLista)
{
    Console.WriteLine(nom);    
}
