int[] vector = [1, 2, 3, 4, 5];
vector.Print("Valores iniciales: ");
var vector2 = vector.Seleccionar(n => n * 3);
vector2.Print("Valores triplicados: ");
vector.Seleccionar(n => n * n).Print("Cuadrados: ");
