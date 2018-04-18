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


    [RoutePrefix("api/Student")]
    public class StudentController : ApiController
    {

        public List<Semester> s_list;


        class Semester_Courses
        {
            public string Year { get; set; }
            public int semester { get; set; }
            public string Course_Name { get; set; }
            public string Exam_Type { get; set; }
            public int Exam_Result { get; set; }
            public int Student_Practical { get; set; }

            public   int Course_ID { get; set; }


        }


        //for get student's mark for each year
        [Route("Get_Student_Courses")]
        [HttpGet]
       public string Get_Student_Courses()
        {
            string User_ID = User.Identity.GetUserId();
            List<Semester_Courses>  student_marks = new List<Semester_Courses>();

            using (EAS_DatabaseEntities entites = new EAS_DatabaseEntities())
            {


                var ALL_Course = from CR in entites.Course_Students where(CR.Student_ID== "07e90ee9-3ccc-40ec-8a39-0179fadfcfe9")
                                 from C in entites.Courses where( CR.Course_ID == C.Course_ID)


                                 from SR in entites.Semesters where( CR.Semster_ID == SR.Semster_ID)
                                 from Em in entites.Exams where (Em.Course_ID ==CR.Course_ID&&Em.Semster_ID==CR.Semster_ID)
                                 from SE in entites.Students_Exams where(SE.Exam_ID==Em.Exam_ID)
                                 select new
                                 {
                                     SR.C_Year,
                                     SR.Semester1,
                                     C.Course_Name,
                                     Em.Exam_Type,
                                     SE.Exam_Result,
                                     CR.Course_ID
                                 };



               


                foreach (var item in ALL_Course)
                {
                    Semester_Courses sc = new Semester_Courses();

                    sc.Year= item.C_Year;
                    sc.semester = item.Semester1;
                    sc.Course_Name = item.Course_Name;
                    sc.Exam_Type = item.Exam_Type;
                    sc.Exam_Result = (int)item.Exam_Result;
                    sc.Course_ID = item.Course_ID;
                    student_marks.Add(sc);

                }
                foreach (var item in student_marks)
                {
                   int Student_Practical=(int)(from c in entites.Course_Students
                     where c.Course_ID == item.Course_ID
                     select c.Student_Practical).FirstOrDefault();
                    item.Student_Practical = Student_Practical;
                }

                return "ss";


            }
        }

        [Route("Get_Semester")]
        [HttpGet]
        public List<Semester> Get_Student_Semester()
        {
             s_list = new List<Semester>();
            using (EAS_DatabaseEntities entites = new EAS_DatabaseEntities())
            {

              List<int> Semester_Id =  (from c in entites.Course_Students
                 where c.Student_ID == "07e90ee9-3ccc-40ec-8a39-0179fadfcfe9"
                 select c.Semster_ID).ToList();

                foreach (var item in Semester_Id)
                {
                    Semester s = new Semester();
                    s = (from c in entites.Semesters
                         where c.Semster_ID == item
                         select c).First();

                     s_list.Add(s);
                }
            }

            return s_list;

        }


    }
}
