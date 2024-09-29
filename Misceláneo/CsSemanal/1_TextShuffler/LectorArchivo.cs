namespace textShuffler;

public class LectorArchivo
{
    public void Leer(FileInfo file)
    {
        StreamReader streamReader = file.OpenText();

        using (streamReader)
        {
            string line = "";
            while ((line = streamReader.ReadLine()) != null)
            {
                Console.WriteLine(line);
                UtilityClass.GetSpacebar();
            }
        }
    }
}
