using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;

namespace EAS_Servies.Controllers
{
   public class studentMarks
    {
        public double Degree;
        public int StudentNumber;
    }
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
    public class ExamContent
    {
        public List<ILOSpercent> CourseIlos;
        public double SuccessRate;
        public Exam Examinformation;
        public int  StudentNumber;
        public List<studentMarks> SMarks;

        public ExamContent()
        {
            CourseIlos = new List<ILOSpercent>();
            Examinformation = new Exam();
            SMarks = new List<studentMarks>();

        }




    }

    [RoutePrefix("api/AdminAnalysis")]
    public class ExamAnalysisController : ApiController
    {

        [Route("ExamAnalysis/{ExamID:int}")]
        [HttpGet]
       public int ExamAnalysis(int ExamID)
        {
            ExamContent Examcontent = new ExamContent();
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


                Examcontent.Examinformation = (from c in entite.Exams
                                                 where c.Exam_ID == ExamID
                                                 select c
                                               ).FirstOrDefault();

                foreach( var MGroup in Marks_temp2 )
                  {
                    studentMarks a = new studentMarks();
                    a.Degree =(double) MGroup.Key;
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

                Examcontent.SuccessRate = ptemp2/ Examcontent.CourseIlos.Count;
              
                return 10;
                

            }

        }

    }
}
