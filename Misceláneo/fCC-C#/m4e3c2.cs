namespace freeCodeCamp;

public class Program
{
    static void Main(string[] args)
    {
        string orderStream = "B123,C234,A345,C15,B177,G3003,C235,B179";

        string[] orderIDs = orderStream.Split(",");
        Array.Sort(orderIDs);
        foreach (string orderID in orderIDs)
        {
            Console.Write(orderID);
            if (orderID.Length != 4)
                Console.Write("\t- Error");
            Console.WriteLine();
        }
    }
}
