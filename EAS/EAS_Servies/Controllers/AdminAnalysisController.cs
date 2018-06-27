using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;

namespace EAS_Servies.Controllers
{
    public class Topicpercent
    {
        public Topic TC;
        public  double TopicSuccessPercent;
        public double SuccessStudentNumber;
      

        public Topicpercent()
        {

            TC = new Topic();
            SuccessStudentNumber = 0;
        }
    }
    public class ILOSpercent
    {
        public ILO ilo;
        public double ILOpercent;
        public List<Topicpercent> Topics;

        public ILOSpercent()
        {
            ilo = new ILO();
            Topics = new List<Topicpercent>();

        }


    }
    public class ExamAnalysis
    {
        public List<ILOSpercent> CourseIlos;
        public double ESuccessRate;
        public Exam Examinformation;
        public int StudentNumber;
        public List<studentMarks> SMarks;

        public ExamAnalysis()
        {
            CourseIlos = new List<ILOSpercent>();
            Examinformation = new Exam();
            SMarks = new List<studentMarks>();


        }




    }

    public class studentMarks
    {
        public double Degree;
        public int StudentNumber;
        public double DegreePer;
        public studentMarks()
        {
            DegreePer = 0;
        }
    }

    public class CoursCATEGORIES
    {
        public int HIGH;
        public int GOOD;
        public int MEDIUM;
        public int LOW;
        public int POOR;



    }

    public class CourseAnalysis
    {

        public List<studentMarks> CSM;
        public CoursCATEGORIES CES;
        public double SuccessRate;
        public CourseAnalysis()
        {
            CSM = new List<studentMarks>();
            CES = new CoursCATEGORIES();

        }


    }

    [RoutePrefix("api/AdminAnalysis")]
    public class AdminAnalysisController : ApiController
    {

        [Route("ExamAnalysis/{ExamID:int}")]
        [HttpGet]
       public ExamAnalysis ExamAnalysis(int ExamID)
        {
            ExamAnalysis Examcontent = new ExamAnalysis();
            List<int> TopicID = new List<int>();
            int Topic_Marks = 0;
            double TopicStudentResult = 0;//most be more than 50% to success
            double ptemp = 0;
            double ptemp2 = 0;


            using (EAS_DatabaseEntities entite = new EAS_DatabaseEntities())
            {
                var Marks_temp = (from c in entite.Students_Exams
                                  where c.Exam_ID == ExamID
                                  select c
                                ).ToList();

                var Marks_temp2 = Marks_temp.GroupBy(r => r.Exam_Result);

                foreach (var MGroup in Marks_temp2)
                {
                    studentMarks a = new studentMarks();
                    a.Degree = (double)MGroup.Key;
                    a.StudentNumber = MGroup.Count();
                    Examcontent.SMarks.Add(a);

                }

                var ExamQuestions = from Exam in entite.ExamQuestions
                                    join question in entite.Questions_Bank on Exam.Question_ID equals question.Question_ID
                                    join ILo in entite.ILOS_Topic on question.Topic_ID equals ILo.Topic_ID
                                   
                                     where Exam.Exam_ID == ExamID
                                     
                                    select new
                                    {
                                        ILO_ = ILo.ILOS_ID,
                                        Topic_ = ILo.Topic_ID

                                    };

                Examcontent.Examinformation = (from c in entite.Exams
                                               where c.Exam_ID == ExamID
                                               select c
                                              ).FirstOrDefault();

               


                var Temp1 = ExamQuestions.GroupBy(g => g.ILO_);

                foreach(var group_ in Temp1)
                {
                    ILOSpercent ILOSpercent_ = new ILOSpercent();
                    ILOSpercent_.ilo = (from c in entite.ILOS
                                        where c.ILOS_ID == group_.Key
                                        select c
                                      ).FirstOrDefault();

                    foreach (var T in group_)
                    {
                        
                        if (!TopicID.Contains(T.Topic_))
                        {
                            TopicID.Add(T.Topic_);
                            Topicpercent tp = new Topicpercent();

                            tp.TC = (from c in entite.Topics
                                     where c.Topic_ID == T.Topic_
                                     select c
                                          ).FirstOrDefault();

                           var StudentlistID = (from SE in entite.Students_Exams
                                             where SE.Exam_ID == ExamID
                                             select SE.Student_ID).ToList();



                            Examcontent.StudentNumber = StudentlistID.Count;


                              var ExamTopic = (from c in entite.Student_Answers
                                                 join question in entite.Questions_Bank on c.Question_ID equals question.Question_ID
                                                 join topic_ in entite.Topics on question.Topic_ID equals topic_.Topic_ID
                                                 where c.Exam_ID == ExamID
                                                 where topic_.Topic_ID == T.Topic_


                                                 select new
                                                 {
                                                     questionID = question.Question_ID,
                                                     quetionMark = question.Question_Mark

                                                 }).Distinct();

                            foreach (var q in ExamTopic)
                            {
                                Topic_Marks = Topic_Marks + (int)q.quetionMark;
                            }

                            foreach (var studentId in StudentlistID)
                            {

                                foreach (var q in ExamTopic)
                                {
                                    var TrueAnsweId = (from c in entite.Question_Answers
                                                       where c.Question_ID == q.questionID
                                                       select c.Answer_ID
                                                        ).FirstOrDefault();
                                    var studentAnswerId = (from c in entite.Student_Answers
                                                           where c.Exam_ID == ExamID
                                                           where c.Student_ID == studentId
                                                           where c.Question_ID==q.questionID
                                                           select c.AnswerID).FirstOrDefault();
                                    if (TrueAnsweId == studentAnswerId)
                                        TopicStudentResult = TopicStudentResult + (int) q.quetionMark;


                                }

                                if ((TopicStudentResult / Topic_Marks) * 100 >= 50)
                                {
                                    tp.SuccessStudentNumber++;
                                }
                                TopicStudentResult = 0;
                            }
                            
                            tp.TopicSuccessPercent = (tp.SuccessStudentNumber / (StudentlistID.Count)) * 100;
                            
                            Topic_Marks = 0;

                            ILOSpercent_.Topics.Add(tp);

                        }
                    }
                    foreach (var Topic  in ILOSpercent_.Topics)
                    {
                        ptemp = ptemp + Topic.TopicSuccessPercent;
                    }

                    ILOSpercent_.ILOpercent = ptemp/ ILOSpercent_.Topics.Count;
                    ptemp = 0;
                    Examcontent.CourseIlos.Add(ILOSpercent_);

                }


                foreach (var ILO in Examcontent.CourseIlos)
                {
                    ptemp2 =ptemp2 + ILO.ILOpercent;
                }

                Examcontent.ESuccessRate = ptemp2/ Examcontent.CourseIlos.Count;
              
                return Examcontent;
                

            }

        }


        [Route("A_CourseAnalysis/{CourseID:int}")]
        [HttpGet]
        public CourseAnalysis A_CourseAnalysis(int CourseID)
        {
            CourseAnalysis CA = new CourseAnalysis();
            double count = 0;

            using (EAS_DatabaseEntities entite = new EAS_DatabaseEntities())
            {
                var StudentList = (from c in entite.StudentsMarks
                                   where c.CourseID == CourseID
                                   select c).ToList();

                var temp = StudentList.GroupBy(r => r.Final + r.Midterm + r.Practical);



                foreach (var Sms in temp)
                {
                    

                    studentMarks s = new studentMarks();

                    s.Degree = Sms.Key;
                    s.StudentNumber = Sms.Count();
                    s.DegreePer = ((double)Sms.Count() / StudentList.Count) * 100;
                    CA.CSM.Add(s);
                }
                    
                foreach(var item in StudentList)
                {
                    var finalgrad = (item.Practical + item.Midterm + item.Final);

                    if (finalgrad >= 90)

                        CA.CES.HIGH++;

                    else if (finalgrad >= 80 && finalgrad < 90)
                        CA.CES.MEDIUM++;
                    else if (finalgrad >= 70 && finalgrad < 80)

                        CA.CES.LOW++;
                    else
                        CA.CES.POOR++;


                }


                foreach (var item in StudentList)
                { 
                    var finalgrad = (item.Practical + item.Midterm + item.Final);
                    if (finalgrad >= 50)
                        count++;

                }

                CA.SuccessRate = (count / StudentList.Count) * 100;

            }

            return CA;
        }
    }
}
