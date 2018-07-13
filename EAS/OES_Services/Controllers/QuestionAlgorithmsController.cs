using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
using Database;
using OES_Services.Security;

namespace OES_Services.Controllers
{
    [RoutePrefix("api/QuestionAlgorithms")]
    //[Authorize]
    public class QuestionAlgorithmsController : ApiController
    {
        string DESKEY = RSA_DESKey_Encryption.DecryptDESK_Key();

        public class Student_Question
        {

            public int Question_ID;
            public String Question_Text;
            public String Question_Answer1;
            public String Question_Answer2;
            public String Question_Answer3;
            public String Question_Answer4;
            public string Expected_Time;
            
        }


        static public int[] list = { 5, 4, 3, 2, 1 };
        static List<int> temp = new List<int>();
        static public List<int> qestions_list = new List<int>();
        static public bool qestions_list_null = true;
        static List<int> id = new List<int>();
        static Questions_Bank Next_Question = new Questions_Bank();
        static List<Question_Answers> Question_Answer = new List<Question_Answers>();
        static List<Questions_Bank> Selected_Question = new List<Questions_Bank>();
       

        static List<int> All_result = new List<int>();
        static Random rnd = new Random();
        static int big_number = 0;
        static List<int> small_number = new List<int>();

        



        public static List<List<int>> Grandy(int n)
        {
            List<List<int>> result = new List<List<int>>();

            if (n != 1 && n != 2)
            {
                for (int i = (int)n - 1; i > (n / 2); i--)
                {
                    for (int j = (int)(n / 2); j > 0; j--)
                    {
                        if ((i + j) == n)
                        {
                            List<int> t = new List<int>();

                            t.Add(i);
                            t.Add(j);

                            result.Add(t);

                        }

                    }
                }

                if (result.Count != 0)
                {
                    int r = rnd.Next(result.Count());

                    foreach (var item in result[r])
                    {
                        All_result.Add(item);
                    }



                    big_number = result[r].FirstOrDefault();
                    small_number.Add(result[r].LastOrDefault());


                }
            }
            else
                big_number = n;

            return result;

        }



        static List<int> GApply(int n)
        {

            Grandy(n);
            return All_result;
        }


        //select Primary Difficulty
        static public int randome()
        {


            int result = 0;

            do
            {
                //result = list[(new Random()).Next(5)];
                result = list[(new Random()).Next(2)];



                if (temp.Count == 5)
                    if (temp.Count == 2)
                        temp.Clear();

                if (result != 0 && !temp.Contains(result))
                {
                    temp.Add(result);
                    break;

                }

            }
            while (temp.Count != 5);
            return result;

        }


        //Create Question Stack
        static List<int> Select_difficulty()
        {
            int a = randome();
            List<int> temp = new List<int>();
            bool first_dificilty = true;
            do
            {


                if (first_dificilty)
                {
                    All_result.Add(a);
                    GApply(a);
                    first_dificilty = false;

                }
                else
                {

                    foreach (var item in small_number)
                        All_result.Add(item);
                    GApply(big_number);

                }

                if (All_result.Count() != 0)
                {
                    foreach (var item in All_result)
                        temp.Add(item);
                    All_result.Clear();
                }

            } while (big_number != 2 && big_number != 1);


            big_number = 0;
            small_number.Clear();
            return temp;


        }





        static public void Question_Algorithm()
        {
            if (qestions_list_null == true)
            {

                qestions_list = Select_difficulty();
                qestions_list_null = false;
            }


        }
        [HttpGet]
        [Route("LoadQuestions")]
        public List<Student_Question> LoadQuestions()
        {
         
            Question_Algorithm();
            List<Student_Question> qes1 = new List<Student_Question>();
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                //all questions with difficlty
                Selected_Question = (from c in entities.Questions_Bank
                                     where c.Difficulty_Level == 1

                                     select c).ToList();



               

                var query = entities.Questions_Bank.Join(entities.Question_Answers,

                    r => r.Question_ID,p => p.Question_ID,
                    (r, p) => new { r.Question_ID, r.Question, p.Answer }
                   
                    );



                // Next_Question = Selected_Question.Where((w => w.Question_Frequency == Selected_Question.Min(t => t.Question_Frequency))).FirstOrDefault();


                Student_Question qes;

                foreach (var item1 in Selected_Question)
                {
                    qes = new Student_Question();

                    qes.Question_ID = item1.Question_ID;
                    qes.Question_Text = DES.Decrypt( item1.Question, DESKEY);
                    qes.Expected_Time = item1.Expected_Time;
                    Question_Answer = (from c in entities.Question_Answers
                                       where c.Question_ID == item1.Question_ID
                                       select c).ToList();

                    List<string> Answers = new List<string>();
                    foreach (var item in Question_Answer)
                    {

                        Answers.Add(item.Answer);


                    }
                    qes.Question_Answer1 = DES.Decrypt(Answers[0], DESKEY); //Decrypt answer 
                    qes.Question_Answer2 =DES.Decrypt(Answers[1], DESKEY);
                    qes.Question_Answer3 =DES.Decrypt(Answers[2], DESKEY);
                    qes.Question_Answer4 = DES.Decrypt(Answers[3], DESKEY);
                    qes1.Add(qes);



                }
                var tt = entities.Questions_Bank.FirstOrDefault(x => x.Question_ID == Next_Question.Question_ID);

                if (tt != null)
                {

                    tt.Question_Frequency++;
                    entities.SaveChanges();

                }
                if (!id.Contains(Next_Question.Question_ID))
                    id.Add(Next_Question.Question_ID);

                if (qestions_list.Count >= 1)
                    qestions_list.RemoveAt(0);

                if (qestions_list.Count == 0)
                    qestions_list_null = true;

                

                return qes1;





            }


        }




    }
}
