namespace Quiz
{
    internal class Program
    {
        static void Main(string[] args)
        {
            StartUp();
        }
        /// <summary>
        /// This function is called at the beginning of the program and prompts the user to input a number corresponding to any of the
        /// quiz's topics
        /// </summary>
        public static void StartUp()
        {
            Console.Clear();
            Console.Write("┌────────────────────────────────────────────────────────────────────────┐\r\n");
            Console.Write("│                                                                        │\r\n");
            Console.Write("│ WELCOME TO THE QUIZ! PLEASE SELECT YOUR TOPIC NUMBER AND PRESS RETURN  │\r\n");
            Console.Write("│                                                                        │\r\n");
            Console.Write("└────────────────────────────────────────────────────────────────────────┘\r\n");
            Console.WriteLine("1-ASTRONOMY");
            Console.WriteLine("2-CALENDAR");
            Console.WriteLine("3-POP MUSIC");
            Console.WriteLine("4-HISTORY");
            Console.WriteLine("5-PROGRAMMING LANGUAGES");
            Console.WriteLine("6-LANGUAGE LEARNING");
            Console.WriteLine("7-GEOGRAPHY");
            Console.WriteLine("8-MATH");
            Console.WriteLine("9-SPORTS");
            Console.WriteLine("10-DAM 1ST AT MONTILIVI");
            Console.WriteLine("11-STAR TREK");
            Console.WriteLine("12-VIDEOGAME HISTORY");
            string topic = Console.ReadLine();
            try
            {
                PlayGame(topic);
            }
            catch (Exception ex)
            {
                Console.Clear();
                Console.WriteLine("Oops! Something went wrong! Want to try again?");
                EndOrRetry();
            }
        }
        /// <summary>
        /// Given a string containing the number topic this function asks the user a random question within it
        /// </summary>
        /// <param name="topic">A string containing the topic number</param>
        public static void PlayGame(string topic) 
        {
            Console.Clear();
            Random r = new Random();
            StreamReader sr = new StreamReader($"{topic}.txt");
            int maxPreguntas = Convert.ToInt32(sr.ReadLine());
            int preguntaElegida = r.Next(0, maxPreguntas);
            int respuestaCorrecta;
            string cursor = sr.ReadLine();
            //Reads for the randomly selected line
            for(int i = 0; i<preguntaElegida*6; i++)
            {
                cursor = sr.ReadLine();
            }
            Console.Clear();
            Console.WriteLine(cursor);
            cursor = sr.ReadLine();
            //Saves the correct answer number
            respuestaCorrecta = Convert.ToInt32(cursor);
            //Displays all the possible answers in the multiple question
            for(int i = 0; i < 4; i++)
            {
                cursor = sr.ReadLine();
                Console.WriteLine(cursor);
            }
            Console.Write("Write the correct answer number:");
            int respuesta = Convert.ToInt32(Console.ReadLine());
            Console.Clear();
            if (respuesta == respuestaCorrecta)
                Console.WriteLine("Correct!");
            else
                Console.WriteLine("Wrong answer!");
            EndOrRetry();
        }
        /// <summary>
        /// Ends the game by prompting the user to retry or end the program
        /// </summary>
        public static void EndOrRetry()
        {
            Console.WriteLine("Press any key to EXIT");
            Console.WriteLine("Press RETURN to go back to topic selection");
            ConsoleKeyInfo tecla = Console.ReadKey();
            End(tecla.Key);
        }
        public static void End(ConsoleKey tecla)
        {

                if (tecla == ConsoleKey.Enter)
                    StartUp();
                else
                {

                    Console.Clear();
                Console.Write("┌────────────────────────────────────────────────────────────────────────┐\r\n");
                Console.Write("│                                                                        │\r\n");
                Console.Write("│                        THANKS FOR PLAYING!                             │\r\n");
                Console.Write("│                                                                        │\r\n");
                Console.Write("└────────────────────────────────────────────────────────────────────────┘\r\n");
                Environment.Exit(1);
                }
        }
    }
}