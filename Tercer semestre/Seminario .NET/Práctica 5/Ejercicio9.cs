using teoria5;

Auto a = new Auto();
a.Marca = "Ford";
Console.WriteLine(a.Marca);
class Auto
{
    private string marca; //Este campo no fue definido en ningún momento del código
    public string Marca //Propiedad de lectura-escritura
    {
        set
        {
            Marca = value; //Se le intenta asignar un valor al campo de la propiedad. Debería ser "marca"
        }
        get
        {
            return marca; //Se intenta retornar el valor del campo privado "marca" (que nunca fue asignado)
        }
    }
}
