namespace Quiz
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            Console.WriteLine("Hola sóc l'Oriol");
            Console.WriteLine("vui anar a casa");
        }
        public static void GetPregunta(string pregunta) 
        {
            Console.Clear();
            bool trobat = false;
            Random r = new Random();
            StreamReader sr = new StreamReader($"{pregunta}.txt");
            int maxPreguntas = Convert.ToInt32(sr.ReadLine());
            int preguntaElegida = r.Next(1, maxPreguntas);
            int respuestaCorrecta;
            string cursor = sr.ReadLine();
            while (cursor != null && !trobat) 
            {
                if (Convert.ToInt32(cursor) == preguntaElegida)
                {
                    trobat = true;
                }
                else
                    cursor = sr.ReadLine();
            }
            if (!trobat) throw new Exception("An unexpected error has ocurred");
            else
            {
                respuestaCorrecta= Convert.ToInt32(cursor);
                for(int i = 0; i < 2; i++)
                {
                    cursor = sr.ReadLine();
                    Console.WriteLine(cursor);
                }
                Console.Write("Write the correct answer number:");
                int respuesta = Convert.ToInt32(Console.ReadLine());
                Console.Clear() ;
                if (respuestaCorrecta == respuesta)
                {
                    MsgNextScreen("YOU WON!!!!!!!!");
                }
                else
                {
                    MsgNextScreen("Try again...");
                }
                 
            }

        
        }

    }
}