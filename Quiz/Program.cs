namespace Quiz
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
        }
        static String[] GetTemas (string fileName)
        {
            List<String> list = new List<String>();
            StreamReader sr = new StreamReader(fileName);
            string cursor = sr.ReadLine();
            while (cursor != null) 
            {
                list.Add(cursor);               
            }
            return list.ToArray();
        }
        static string GetOption (int opcion, String[] temas)
        {
            return temas[opcion];
        }
        static void ShowOptions(String[] temas)
        {         
            int count = 1;
            foreach (String t in temas) 
            {
                Console.WriteLine($"{count} - {t}");
            }
            Console.WriteLine("E - Exit");
        }

    }
}