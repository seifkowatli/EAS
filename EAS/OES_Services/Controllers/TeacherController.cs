using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EAS_DataBase;
using OES_Services.Security;

namespace OES_Services.Controllers
{
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
        public String Text;
        public String percentage;

    }
    public class Difficulty
    {
        public String VeryEasy;
        public String Easy;
        public String Avarage;
        public String Difficult;
        public String VeryDifficult;



    }
    public class ThinkingSkills
    {

        public String Crtical;
        public String Analysis;
        public String Practical;
        public String Theoratical;

    }
    public class ExamInfo
    {
        public String TotalGrade;
        public String ExamPeriod;
        public List<TopicPercentage> TopicPercentage;
        public Difficulty Difficulty ;
        public ThinkingSkills ThinkingSkills ;
        public int ExamID;

        public ExamInfo()
        {
            TopicPercentage = new List<TopicPercentage>();
            Difficulty =  new Difficulty ();
            ThinkingSkills = new ThinkingSkills();
        }




    }

    [RoutePrefix("api/Teacher")]
    public class TeacherController : ApiController
    {


        [Route("Add_New_Question")]
        [HttpPost]
        public void Add_New_Question(Questions_Bank Nq)
        {
            Nq.Question_Text= DES.Encrypt(Nq.Question_Text);
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


                Answers[0].is_trueAnswer = true;
                Answers[1].is_trueAnswer = false;
                Answers[2].is_trueAnswer = false;
                Answers[3].is_trueAnswer = false;


                Answers[0].Question_ID = id;
                Answers[1].Question_ID = id;
                Answers[2].Question_ID = id;
                Answers[3].Question_ID = id;



                foreach (var item in Answers)
                {
                    item.Answer_Text= DES.Encrypt(item.Answer_Text);
                    entities.Question_Answers.Add(item);
                }

                entities.SaveChanges();

            }


        }


        [Route("Get_ILOs/{CourseID:int}")]
        [HttpGet]
        public List<ILO>Get_ILOs(int CourseID)
        {
            
            List<ILO> All_ILOS = new List<ILO>();
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {

                var temp = (from c in entity.Topics
                            where c.Course_ID== CourseID

                            select c.Topic_ID).ToList();


                foreach (var item in temp)
                {
                   var temp2= (from c in entity.ILOS
                                where c.Topic_ID == item
                                select c).ToList();

                    foreach (var item2 in temp2)
                    {
                        All_ILOS.Add(item2);
                    }
                }
            }
            return All_ILOS;
            }



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

          
            List< CourseExam > CE_List   = new List<CourseExam>();


            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {  
                  var temp = from e in entity.Exams
                            join c in entity.Courses on e.Course_ID equals c.Course_ID
                            where e.Semster_ID == 1
                            select new { Exam_ID=e.Exam_ID, Exam_Type=e.Exam_Type, Course_Name = c.Course_Name, Semster_ID =e.Semster_ID, Course_ID=c.Course_ID};


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


        [Route("Get_Topics/{CourseID:int}")]
        [HttpGet]

        public List<Topic> Get_Topics(int CourseID)
        {
            List<Topic> All_Topics = new List<Topic>();
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {

                var temp = (from c in entity.Topics
                            where c.Course_ID == CourseID

                            select c.Topic_ID).ToList();


                foreach (var item in temp)
                {
                    var temp2 = (from c in entity.Topics
                                 where c.Topic_ID == item
                                 select c).ToList();

                    foreach (var item2 in temp2)
                    {
                        All_Topics.Add(item2);
                    }
                }
            }
            return All_Topics;


        }


        [Route("GetExamInformation")]
        [HttpPost]
        public void GetExamInformation(ExamInfo Exam)
        {


            ExamInfo a = Exam;


        }
    }


   
}