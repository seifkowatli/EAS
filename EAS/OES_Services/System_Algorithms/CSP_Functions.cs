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

    }
}