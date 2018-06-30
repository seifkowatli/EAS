using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OES_Services.System_Algorithms
{
    public class CSP_Functions
    {

        public static double[] GetRelaventtRatios(double[] Ratios, double Total)
        {
            // creating a temporary array to hold the number of question in each topic
            double[] newRatios = new double[Ratios.Length];


            // calculating the nuber of questions for each topic
            for (int i = 0; i < newRatios.Length; i++)
            {
                newRatios[i] = Math.Ceiling(Ratios[i] * Total);
            }

            int invoke = 0;
            // making sure that the sum of number of topics questions is equal to the overall questions number
            while (newRatios.Sum() != Total)
            {
                double max = newRatios.Max();
                newRatios[newRatios.ToList().IndexOf(max)] = max = 1;
                ++invoke;

                if (invoke == Total)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Error!! .... The Ratios you entered do add up to 100%");
                    return null;
                }
            }

            return newRatios;
        }

        public static double[] GetRelaventtRatios(double[] Numbers, double Ratio, double Total)
        {
            // creating a temporary array to hold the number of question in each topic
            double[] newRatios = new double[Numbers.Length];


            // calculating the nuber of questions for each topic
            for (int i = 0; i < newRatios.Length; i++)
            {
                newRatios[i] = Math.Ceiling(Numbers[i] * Ratio);
            }

            int invoke = 0;


            while (newRatios.Sum() != Total)
            {
                double max = newRatios.Max();
                newRatios[newRatios.ToList().IndexOf(max)] = max - 1;
                ++invoke;


                Console.WriteLine("Invoke Number {0}", invoke);

                //if (invoke == Ratio)
                //{
                //    Console.ForegroundColor = ConsoleColor.Red;
                //    Console.WriteLine("Error!! .... The Ratios you entered do add up to 100%");
                //    return null;
                //}
            }

            return newRatios;
        }

        public static void Add2TwoD(ref double[,] TwoD_Arr, double[] OneD_Arr, int Index)
        {
            for (int i = 0; i < OneD_Arr.Length; i++)
                TwoD_Arr[Index, i] = OneD_Arr[i];

        }

        public static int CheckandGetCount(double[,] Ratios)
        {
            double TSsum = 0;
            double Diffsum = 0;

            for (int i = 0; i < Ratios.GetLength(1); i++)
                TSsum += Ratios[0, i];

            for (int i = 0; i < Ratios.GetLength(1); i++)
                Diffsum += Ratios[1, i];

            if (TSsum != Diffsum)
                throw new System.ArgumentException("The sum of Questions in Thinking Skills and the Difficulty \n are not the same");
            return (int)TSsum;
        }

        public static string GetTS(int key)
        {
            if (key == 0)
                return "Recall";
            if (key == 1)
                return "Analysis";
            if (key == 2)
                return "Understanding";
            if (key == 3)
                return "Compiling";
            if (key == 4)
                return "CriticalThinking";

            return null;

        }

        public static double GetRowSum(int rowNumber, double[,] Arr)
        {
            double sum = 0;
            for (int i = 0; i < Arr.GetLength(1); i++)
                sum += Arr[rowNumber, i];

            return sum;
        }

        public static int[,] GetRandmQuest(double[,] Ratios)
        {
            Random r1 = new Random();
            Random r2 = new Random();
            int n = 0;
            int TempTS = 0;
            int TempDiff = 0;
            int TQ_Count = CheckandGetCount(Ratios);

            int[,] T_Questions = new int[TQ_Count, 2];

            int threshold = Ratios.GetLength(1) - 1;
            int call = 0;
            for (int i = 0; i < TQ_Count; i++)
            {

                while (true)
                {
                    n = r1.Next(0, threshold);

                    if (Ratios[0, n] != 0)
                    {
                        TempTS = n;
                        Ratios[0, n]--;
                        Console.WriteLine("call number {0}", ++call);
                        break;
                    }

                    if (GetRowSum(0, Ratios) == 0)
                        break;

                }

                while (true)
                {
                    n = r2.Next(0, threshold);

                    if (Ratios[1, n] != 0)
                    {
                        TempDiff = n;
                        Ratios[1, n]--;
                        Console.WriteLine("call number {0}", ++call);
                        break;
                    }
                    if (GetRowSum(1, Ratios) == 0)
                        break;
                }

                T_Questions[i, 0] = TempTS;
                T_Questions[i, 1] = TempDiff;
            }

            Console.WriteLine("We made it");
            return T_Questions;
        }


    }
}