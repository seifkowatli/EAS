using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;
using Microsoft.AspNet.Identity;
using OES_Services.Security;

namespace OES_Services.Controllers
{
    public class QuetstionAnswer
    {

        public string quetion { get; set; }
        public string Answer { get; set; }
    }
        public class Student_Exam_Details
    {
        public List<QuetstionAnswer> sa;
        public int Exam_Result { get; set; }

        public Student_Exam_Details()
        {

            sa = new List<QuetstionAnswer>();


        }

    }
    public class StudentAnswersExam
    {

     public   int Question_ID { get; set; }
     public int Exam_ID { get; set; }
     public string Student_Answer { get; set; }
    }

    [RoutePrefix("api/QuestionsCorrection")]
    public class Questions_CorrectionController : ApiController
    {
        [Route("correction")]
        [HttpPost]
        public void correction(List<StudentAnswersExam> SA)
        {
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {

               String UserID = User.Identity.GetUserId();


                int Result = 0; //to save all marks here 
                foreach (var item in SA)
                {
                    var t = DES.Encrypt(item.Student_Answer);
                    int AnswerID = (from c in entities.Question_Answers
                                    where c.Question_ID == item.Question_ID
                                    where c.Answer == t
                                    select c.Answer_ID).FirstOrDefault();


                    Student_Answers student_Answer = new Student_Answers();
                    student_Answer.AnswerID = AnswerID;
                    student_Answer.Question_ID = item.Question_ID;
                    student_Answer.Exam_ID = item.Exam_ID;
                    student_Answer.Student_ID = UserID;


                    string true_Answer = (from c in entities.Question_Answers

                                          where c.Question_ID == item.Question_ID
                                          where c.is_True == true
                                          select c.Answer).FirstOrDefault();

                    if (item.Student_Answer ==DES.Decrypt(true_Answer))
                    {
                        int q_Mark = (int)(from c in entities.Questions_Bank
                                           where c.Question_ID == item.Question_ID
                                           select c.Question_Mark).FirstOrDefault();

                        Result = Result + q_Mark;
                    }




                    entities.Student_Answers.Add(student_Answer);
                    entities.SaveChanges();


                }


                //    Update and insert Final Result In DataBase

                Random random = new Random();

                StudentsMark SM_temp = new StudentsMark();
                SM_temp.StudentID = UserID;
                SM_temp.CourseID=1;
                SM_temp.Midterm = Result;
                SM_temp.SemesterID = 1;
                SM_temp.Practical= random.Next(1,30);
                SM_temp.Final = -1;

                entities.StudentsMarks.Add(SM_temp);
                entities.SaveChanges();
                Students_Exams SExam = new Students_Exams();
                SExam.Exam_ID = 2;
                SExam.Exam_Result = Result;
                SExam.Student_ID = UserID;

                entities.Students_Exams.Add(SExam);
                entities.SaveChanges();
            }


        }


        [Route("Student_Exam_Details")]
        [HttpGet]
        public Student_Exam_Details Get_Student_Exam_Details()
        {
            String UserID = User.Identity.GetUserId();

            Student_Exam_Details SED = new Student_Exam_Details();
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                var temp= (from c in entities.Student_Answers
                           where c.Student_ID == UserID
                           where c.Exam_ID == 2
                           select c).ToList();

                foreach (var item in temp)
                {
                    QuetstionAnswer temp2 = new QuetstionAnswer();

                    temp2.quetion = (from c in entities.Questions_Bank
                                 where c.Question_ID == item.Question_ID
                                 select c.Question).FirstOrDefault();

                    temp2.quetion = DES.Decrypt(temp2.quetion);

                    temp2.Answer= (from c in entities.Question_Answers
                                   where c.Answer_ID == item.AnswerID
                                   select c.Answer).FirstOrDefault();

                    temp2.Answer = DES.Decrypt(temp2.Answer);

                    SED.sa.Add(temp2);
                }




                SED.Exam_Result = (int)(from c in entities.Students_Exams
                                        where c.Student_ID == UserID
                                        where c.Exam_ID == 2
                                        select c.Exam_Result).FirstOrDefault();

            }
            return SED;



        }
    }
}
