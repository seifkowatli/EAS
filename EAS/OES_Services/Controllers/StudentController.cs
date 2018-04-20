using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EAS_DataBase;

namespace OES_Services.Controllers
{
    /// <summary>
    /// Controller  for get students marks in all semesters 
    /// </summary>
    public class CourseWithMark
    {
        public string CourseName { get; set; }
        public int FinalMark { get; set; }
        public int MidMark { get; set; }
        public int StudentPractical { get; set; }

    }

 public class SemesterCourses
    {
        public Semester semester { get; set; }
        public  List<CourseWithMark> CWM;

       public SemesterCourses()
        {

            CWM = new List<CourseWithMark>();

        }

    }
    public class StudentController : ApiController
    {

        [HttpGet]
      public List<SemesterCourses>  GetAllCourse()
        {
            List<SemesterCourses> semestercourses = new List<SemesterCourses>();

            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                List<Semester> AllStudentSemester = new List<Semester>();


                var SemesterID = (from c in entities.Course_Students
                                  where c.Student_ID == "07e90ee9-3ccc-40ec-8a39-0179fadfcfe9"
                                  select c.Semster_ID).ToList();

                foreach(var item in SemesterID)
                {
                    

                   var semester = (from c in entities.Semesters
                                   where c.Semster_ID == item
                                   select c).FirstOrDefault();


                    if (!AllStudentSemester.Contains(semester))
                        AllStudentSemester.Add(semester);
                }

                foreach (var item in AllStudentSemester)
                {
                    SemesterCourses sc = new SemesterCourses();
                   
                    sc.semester = item;

                    var CourseID = (from c in entities.Course_Students
                                    where c.Semster_ID == item.Semster_ID
                                    select c.Course_ID).ToList();



                    foreach (var item2 in CourseID)
                    {
                        CourseWithMark cwm = new CourseWithMark();

                        cwm.CourseName = (from c in entities.Courses
                                          where c.Course_ID == item2
                                          select c.Course_Name).FirstOrDefault();


                        cwm.StudentPractical = (int)(from c in entities.Course_Students
                                                     where c.Course_ID == item2
                                                     select c.Student_Practical).FirstOrDefault();

                       cwm.FinalMark = (int)(from c in entities.Exams
                                    from p in entities.Students_Exams
                                    where c.Exam_ID==p.Exam_ID
                                    where c.Exam_Type == "Final"
                                    where c.Course_ID==item2
                                    where c.Semster_ID==item.Semster_ID
                                    select p.Exam_Result).First();

                        cwm.MidMark = (int)(from c in entities.Exams
                                              from p in entities.Students_Exams
                                              where c.Exam_ID == p.Exam_ID
                                              where c.Exam_Type == "Midterm"
                                              where c.Course_ID == item2
                                              where c.Semster_ID == item.Semster_ID
                        select p.Exam_Result).First();



                        sc.CWM.Add(cwm);
                        
                        


                    }
                    semestercourses.Add(sc);


                }



            }
            return semestercourses;

        }
    }
}
