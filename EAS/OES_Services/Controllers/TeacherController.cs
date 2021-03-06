﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;
using OES_Services.Security;
using OES_Services.System_Algorithms;
using Microsoft.AspNet.Identity;

namespace OES_Services.Controllers
{

    public class Question
    {
        public Question() { }

        public Question(int id, string text, int time, int difficulty, int frequency, string thinkingSkills, int mark, int topic_Id)
        {
            Id = id;
            Topic_Id = topic_Id;
            Text = text;
            this.time = time;
            Difficulty = difficulty;
            this.frequency = frequency;
            ThinkingSkills = thinkingSkills;
            Mark = mark;
        }

        public int Id { set; get; }
        public int Topic_Id { set; get; }
        public string Text { set; get; }
        public int time { set; get; }
        public int Difficulty { set; get; }
        public int frequency { set; get; }
        public string ThinkingSkills { set; get; }
        public int Mark { set; get; }

    }
    public class CourseExam
    {
        public int Exam_ID;
        public string Exam_Type;
        public string Course_Name;
        public int Semster_ID;
        public int Course_ID;
    }

    public class TopicPercentage
    {
        public int ID;
        public double percentage;
    }

    public class Difficulty
    {
        public double VeryEasy;
        public double Easy;
        public double Avarage;
        public double Difficult;
        public double VeryDifficult;
    }

    public class ThinkingSkills
    {
        public double Recall;
        public double Analysis;
        public double Understanding;
        public double Compiling;
        public double CriticalThinking;
    }

    public class ExamInfo
    {

        public double QuestNum;
        public double ExamPeriod;
        public List<TopicPercentage> TopicPercentages;
        public Difficulty Difficulty;
        public ThinkingSkills ThinkingSkills;
        public int ExamID;

        public ExamInfo()
        {
            TopicPercentages = new List<TopicPercentage>();
            Difficulty = new Difficulty();
            ThinkingSkills = new ThinkingSkills();
        }
    }

    [RoutePrefix("api/Teacher")]
    public class TeacherController : ApiController
    {
        string  DESKEY = RSA_DESKey_Encryption.DecryptDESK_Key();
        List<KeyValuePair<double, double[,]>> ExamTree = new List<KeyValuePair<double, double[,]>>();



        [Route("TeacherCourse")]
        [HttpGet]
       public List<Course> TeacherCource()
        {
            String UserID = User.Identity.GetUserId();
            List<Course> tc = new List<Course>();

            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                tc = (from sc in entities.Semester_Courses
                      join c in entities.Courses on sc.Course_ID equals c.Course_ID
                      where sc.UserID == UserID
                      select c).ToList();

            }
            return tc;
        }


        [Route("Add_New_Question")]
        [HttpPost]
        public void Add_New_Question(Questions_Bank Nq)
        {
            Nq.Question = DES.Encrypt(Nq.Question, DESKEY);
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {

                entities.Questions_Bank.Add(Nq);
                entities.SaveChanges();
            }
        }

        [Route("Add_Answers")]
        [HttpPost]
        public void Add_Answers(List<Question_Answers> Answers)
        {

            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {


                int id = (from c in entities.Questions_Bank
                          orderby c.Question_ID descending
                          select c.Question_ID

                      ).Take(1).SingleOrDefault();




                for (int i = 0; i < Answers.Count(); i++)
                {
                    if (i == 0)
                        Answers[i].is_True = true;
                    else
                        Answers[i].is_True = false;
                }

                for (int i = 0; i < Answers.Count(); i++)
                    Answers[i].Question_ID = id;


                foreach (var item in Answers)
                {
                    item.Answer = DES.Encrypt(item.Answer,DESKEY);
                    entities.Question_Answers.Add(item);
                }

                entities.SaveChanges();

            }


        }


        [Route("Get_Topic/{CourseID:int}")]
        [HttpGet]
        public List<Topic> Get_Topic(int CourseID)
        {

            List<Topic> All_Topics = new List<Topic>();
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {

                var temp = (from c in entity.ILOS
                            where c.Course_ID == CourseID

                            select c.ILOS_ID).ToList();


                foreach (var item in temp)
                {
                    var temp2 = (from c in entity.ILOS_Topic
                                 where c.ILOS_ID == item
                                 select c).ToList();

                    foreach (var item2 in temp2)
                    {
                        var temp3 = (from c in entity.Topics
                                     where c.Topic_ID == item2.Topic_ID
                                     select c).FirstOrDefault();

                        All_Topics.Add(temp3);
                    }
                }
            }
            return All_Topics;
        }


        [UseSSL]
        [Route("Get_Courses")]
        [HttpGet]
        public List<Course> Get_Courses()
        {
            List<Course> All_Courses = new List<Course>();
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {
                All_Courses = (from c in entity.Courses
                               select c).ToList();



            }
            return All_Courses;
        }


        //Get Cours Exam after Admin Added the Exams for course
        [Route("CourseExams")]
        [HttpGet]
        public List<CourseExam> CourseExams()
        {


            List<CourseExam> CE_List = new List<CourseExam>();


            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {
                var temp = from e in entity.Exams
                           join c in entity.Courses on e.Course_ID equals c.Course_ID
                           where e.Semster_ID == 1
                           select new { Exam_ID = e.Exam_ID, Exam_Type = e.Exam_Type, Course_Name = c.Course_Name, Semster_ID = e.Semster_ID, Course_ID = c.Course_ID };


                foreach (var item in temp)
                {
                    CourseExam CE = new CourseExam();
                    CE.Course_Name = item.Course_Name;
                    CE.Exam_ID = item.Exam_ID;
                    CE.Exam_Type = item.Exam_Type;
                    CE.Semster_ID = (int)item.Semster_ID;
                    CE.Course_ID = item.Course_ID;
                    CE_List.Add(CE);

                }
            }
            return CE_List;


        }


        //[Route("Get_Topics/{CourseID:int}")]
        //[HttpGet]

        //public List<Topic> Get_Topics(int CourseID)
        //{
        //    List<Topic> All_Topics = new List<Topic>();
        //    using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
        //    {

        //        var temp = (from c in entity.Topics
        //                    where c.Course_ID == CourseID

        //                    select c.Topic_ID).ToList();


        //        foreach (var item in temp)
        //        {
        //            var temp2 = (from c in entity.Topics
        //                         where c.Topic_ID == item
        //                         select c).ToList();

        //            foreach (var item2 in temp2)
        //            {
        //                All_Topics.Add(item2);
        //            }
        //        }
        //    }
        //    return All_Topics;


        //}


        [Route("GetExamInformation")]
        [HttpPost]
        public void GetExamInformation(ExamInfo Exam)
        {
            ExamInfo ei = Exam;
            double[] Topics_Ratios = new double[ei.TopicPercentages.Count()];

            for (int i = 0; i < ei.TopicPercentages.Count(); i++)
            {
                Topics_Ratios[i] = ei.TopicPercentages[i].percentage;
            }

            double[] TopicsQuestCount = CSP_Functions.GetRelaventtRatios(Topics_Ratios, ei.QuestNum);

            double[] TS_Ratios = {
                ei.ThinkingSkills.Recall ,
                ei.ThinkingSkills.Analysis ,
                ei.ThinkingSkills.Understanding ,
                ei.ThinkingSkills.Compiling ,
                ei.ThinkingSkills.CriticalThinking
            };
            double[] Difficulty_Ratios = {
                ei.Difficulty.VeryDifficult,
                ei.Difficulty.Easy ,
                ei.Difficulty.Avarage,
                ei.Difficulty.Difficult ,
                ei.Difficulty.VeryDifficult
            };

            for (int i = 0; i < TopicsQuestCount.Length; i++)
            {
                double id = ei.TopicPercentages[i].ID;
                double[,] temp = new double[TS_Ratios.Length, Difficulty_Ratios.Length];

                double[] tempTS = CSP_Functions.GetRelaventtRatios(TS_Ratios, TopicsQuestCount[i]);
                double[] tempDiff = CSP_Functions.GetRelaventtRatios(Difficulty_Ratios, TopicsQuestCount[i]);

                CSP_Functions.Add2TwoD(ref temp, tempTS, 0);
                CSP_Functions.Add2TwoD(ref temp, tempDiff, 1);

                ExamTree.Add(new KeyValuePair<double, double[,]>(id, temp));
            }

        }

        [Route("GetCSPQuestions")]
        [HttpGet]
        public HttpResponseMessage GetCSPQuestions()
        {
            try
            {
                if (ExamTree == null)
                    Request.CreateResponse(HttpStatusCode.MethodNotAllowed, "There are no Exam info you can't request This methode");


                List<Question> MyQuestions = new List<Question>();
                using (EAS_DatabaseEntities e = new EAS_DatabaseEntities())
                {

                    for (int i = 0; i < ExamTree.Count(); i++)
                    {
                        double t_id = ExamTree[i].Key;
                        int[,] t_quest = CSP_Functions.GetRandmQuest(ExamTree[i].Value);

                        for (int j = 0; j < t_quest.GetLength(0); i++)
                        {
                            var temp = (from t in e.Questions_Bank
                                        where t.Question_ID == t_id
                                        && t.Thinking_Skills == CSP_Functions.GetTS(t_quest[j, 1])
                                        && t.Difficulty_Level == (int)t_quest[j, 0]
                                        select t).FirstOrDefault();


                            MyQuestions.Add(new Question()
                            {
                                Id = temp.Question_ID,
                                Text = DES.Decrypt(temp.Question,DESKEY),
                                time = int.Parse(temp.Expected_Time),
                                Difficulty = int.Parse(temp.Expected_Time),
                                frequency = (int)temp.Question_Frequency,
                                ThinkingSkills = temp.Thinking_Skills,
                                Mark = (int)temp.Question_Mark,
                                Topic_Id = (int)temp.Topic_ID
                            });

                        }


                    }

                    if (MyQuestions != null)
                        return Request.CreateResponse(HttpStatusCode.OK, MyQuestions);
                    else
                        return Request.CreateResponse(HttpStatusCode.NotFound, "There are no Questions in the Database That Match the Current ExamTree");
                }


            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
            }


        }


    }

}