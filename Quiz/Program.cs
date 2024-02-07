namespace Quiz
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string pregunta = "10";
            GetPregunta( pregunta );
        }
        public static void GetPregunta(string pregunta) 
        {
            Console.Clear();
            Random r = new Random();
            StreamReader sr = new StreamReader($"{pregunta}.txt");
            int maxPreguntas = Convert.ToInt32(sr.ReadLine());
            int preguntaElegida = r.Next(0, maxPreguntas);
            int respuestaCorrecta;
            string cursor = sr.ReadLine();
            for(int i = 0; i<preguntaElegida*5; i++)
            {
                cursor = sr.ReadLine();
            }
            Console.Clear();
            Console.WriteLine(cursor);
            cursor = sr.ReadLine();
            respuestaCorrecta = Convert.ToInt32(cursor);
            for(int i = 0; i < 3; i++)
            {
                cursor = sr.ReadLine();
                Console.WriteLine(cursor);
            }
            Console.Write("Write the correct answer number:");
            int respuesta = Convert.ToInt32(Console.ReadLine());
            Console.Clear() ;
            if (respuestaCorrecta == respuesta)
            {
               Console.WriteLine("YOU WON!!!!!!!!");
            }
            else
            {
                Console.WriteLine("Try again...");
            }
             

        
        }

    }
}