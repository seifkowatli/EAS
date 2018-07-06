using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;

namespace EAS_Servies.Controllers
{

    [RoutePrefix("api/TeacherAnalysis")]

    public class TeacherAnalysisController : ApiController
    {
        public class CourseAnalysis
        {
            public string CourseName;
            public int MaxMark;
            public int MinMark;
            public int AvrageMark;
            public int CourseStudents;



    }

        [Route("TeacherCourseAnalysis/{CourseID:int}")]
        [HttpGet]
        public  CourseAnalysis TeacherCourseAnalysis(int CourseID)
        {
            CourseAnalysis CA = new CourseAnalysis();
            using (EAS_DatabaseEntities entite = new EAS_DatabaseEntities())
            {
                CA.CourseName = (from c in entite.Courses
                                 where c.Course_ID == CourseID
                                 select c.Course_Name).FirstOrDefault();

                var StudentList = (from c in entite.StudentsMarks
                                   where c.CourseID == CourseID
                                   select c).ToList();
                CA.CourseStudents = StudentList.Count;


                var temp = StudentList.GroupBy(r => r.Final + r.Midterm + r.Practical);
                CA.MaxMark = StudentList.Max(r => r.Final + r.Midterm + r.Practical);
                CA.MinMark = StudentList.Min(r => r.Final + r.Midterm + r.Practical);

                int result = 0;

                foreach (var item in temp)
                {
                    
                    result=result + item.Key;
                    CA.AvrageMark=(result / StudentList.Count);


                }

                return CA;

            }

        }

    }
}
