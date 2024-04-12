using teoria5;

ListaDePersonas lista = new ListaDePersonas();

DateTime unaFecha = new DateTime(2000, 6, 12);
DateTime otraFecha = new DateTime(2004, 1, 2);
DateTime terceraFecha = new DateTime(2002, 3, 4);

Persona sujeto1 = new Persona();
Persona sujeto2 = new Persona();
Persona sujeto3 = new Persona();
Persona sujeto4 = new Persona();

sujeto1[0] = "Maria"; sujeto1[1] = 'F'; sujeto1[2] = 123; sujeto1[3] = unaFecha;
sujeto2[0] = "Manuel"; sujeto2[1] = 'M'; sujeto2[2] = 234; sujeto2[3] = otraFecha;
sujeto3[0] = "Carlos"; sujeto3[1] = 'M'; sujeto3[2] = 345; sujeto3[3] = terceraFecha;
sujeto4[0] = "Clara"; sujeto4[1] = 'F'; sujeto4[2] = 456; 

lista.Agregar(sujeto1);
lista.Agregar(sujeto2);
lista.Agregar(sujeto3);
lista.Agregar(sujeto4);

//Probar código
Persona unaPersona = lista[456];
unaPersona?.Imprimir();

//Obtener lista de personas que llevan una 'M' en su nombre
List<string> unaLista = lista['M'];
foreach (string nom in unaLista)
    Console.WriteLine(nom);    
