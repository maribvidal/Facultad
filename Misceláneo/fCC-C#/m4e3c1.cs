namespace freeCodeCamp;

public class Program
{
    static void Main(string[] args)
    {
        string pangram = "The quick brown fox jumps over the lazy dog";
        string[] words = pangram.Split(" ");
        for (int i = 0; i < words.Length; i++)
        {
            char[] wordCharArray = words[i].ToCharArray();
            Array.Reverse(wordCharArray);
            words[i] = new string(wordCharArray);
        }
        pangram = String.Join(" ", words);
        Console.WriteLine(pangram);
    }
}
