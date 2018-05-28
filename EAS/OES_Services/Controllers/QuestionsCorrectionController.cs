using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EAS_DataBase;
using Microsoft.AspNet.Identity;

namespace OES_Services.Controllers
{

    public class Student_Exam_Details
    {
        public List<Students_Answers> sa;
        public int Exam_Result { get; set; }

        public Student_Exam_Details()
        {

            sa = new List<Students_Answers>();


        }

    }

    [RoutePrefix("api/QuestionsCorrection")]
    public class QuestionsCorrectionController : ApiController
    {
        [Route("correction")]
        [HttpPost]
        public void correction(List<Students_Answers> SA)
        {
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {




                int Final_Result = 0; //to save all marks here 
                foreach (var item in SA)
                {
                    int true_Answer = (from c in entities.Question_Answers

                                          where c.Question_ID == item.Question_Id
                                          where c.is_trueAnswer == true
                                          select c.Answer_ID).FirstOrDefault();

                    if (item.Answer_Id == true_Answer)
                    {

                        int q_Mark = (int)(from c in entities.Questions_Bank
                                           where c.Question_ID == item.Question_Id
                                           select c.Question_Mark).FirstOrDefault();

                        Final_Result = Final_Result + q_Mark;
                    }
                    

                    item.Std_Id = User.Identity.GetUserId();//Get User ID From LogIn Section
                    entities.Students_Answers.Add(item);
                    entities.SaveChanges();



                }


                //    Update and insert Final Result In DataBase
                var SE = (from c in entities.Students_Exams
                          where c.Student_ID == "f723e108-ba10-407a-8cfc-4a85a8258f85"
                          where c.Exam_ID == 1

                          select c).FirstOrDefault();

                SE.Exam_Result = Final_Result;
                entities.SaveChanges();
            }


        }


        [Route("Student_Exam_Details")]
        [HttpGet]
        public Student_Exam_Details Get_Student_Exam_Details()
        {
            Student_Exam_Details SED = new Student_Exam_Details();
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {

                SED.sa = (from c in entities.Students_Answers
                          where c.Std_Id == "f723e108-ba10-407a-8cfc-4a85a8258f85"
                          where c.Exam_Id == 1
                          select c).ToList();



                SED.Exam_Result = (int)(from c in entities.Students_Exams
                                        where c.Student_ID == "f723e108-ba10-407a-8cfc-4a85a8258f85"
                                        where c.Exam_ID == 1
                                        select c.Exam_Result).FirstOrDefault();

            }
            return SED;



        }
    }
}
