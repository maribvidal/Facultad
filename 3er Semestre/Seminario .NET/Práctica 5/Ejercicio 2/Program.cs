using teoria5;

new Cuenta();
new Cuenta();
List<Cuenta> cuentas = Cuenta.GetCuentas();

cuentas[0].Depositar(50);
cuentas.RemoveAt(0);
Console.WriteLine(cuentas.Count);

cuentas = Cuenta.GetCuentas();
Console.WriteLine(cuentas.Count);
cuentas[0].Extraer(30);
