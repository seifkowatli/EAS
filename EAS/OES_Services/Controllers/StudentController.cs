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

        public class Type
        {
            public int Final;
            public int Mid;
            public int Practical;



        }

        class Semester_Courses
        {
            public string Year { get; set; }
            public List<string> S_Courses;
            public List<Type> Student_Marks;

            public Semester_Courses()
            {

                S_Courses = new List<string>();
                Student_Marks = new List<Type>();

            }


        }


        //for get student course mark in each year
        [Route("Get_Student_Courses")]
        [HttpGet]
       public string Get_Student_Courses()
        {
            string User_ID = User.Identity.GetUserId();

            using (EAS_DatabaseEntities entites = new EAS_DatabaseEntities())
            {


                var ALL_Course = from sc in entites.Semester_Courses
                                 join c in entites.Courses on sc.Course_ID equals c.Course_ID
                                 join cs in entites.Course_Students on new {sc.Semster_ID,sc.Course_ID} equals new {cs.Semster_ID,cs.Course_ID }
                                 join sr in entites.Semesters on cs.Semster_ID equals sr.Semster_ID
                                 join Em2 in entites.Exams on cs.Semster_ID equals Em2.Semster_ID
                                 join Em in entites.Students_Exams on new { Em2.Semster_ID, Em2. } equals new { Em.Exam_Result, Em.Exam_ID }

                                 // join SE in entites.Students_Exams on Em.Exam_ID equals SE.Exam_ID

                                    where cs.Semster_ID="1"
                                 select new
                                 {
                                     sr.C_Year,
                                     sr.Semester1,
                                     c.Course_Name,
                                     Em.Exam_Type,
                                     SE.Exam_Result,
                                     cs.Student_Practical
                                 };





         
                foreach (var item in ALL_Course)
                {
                    string ss = item.C_Year;
                }

                return "ss";


            }
        }




    }
}
