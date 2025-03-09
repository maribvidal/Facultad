using teoria9;

int[] vector = [1, 2, 3, 4, 5];
vector.Donde(i => i > 3)
      .Seleccionar<int, int>(i => i * 10)
      //.Seleccionar(i => $"({i})")
      .ForEach(st => Console.WriteLine(st));
