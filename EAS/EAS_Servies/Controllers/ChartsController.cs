using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;



namespace EAS_Servies.Controllers
{
    public class StudentMark
    {
        public string Id { get; set; }
        public int Mark { get; set; }

    }
    public class Mark_Count {

        public int Mark {get;set;}
        public int Count { get; set; }



    }
    [RoutePrefix("api/Charts")]
    public class ChartsController : ApiController
    {
        [Route("GetStudentMarks/{CourseID:int}")]
        [HttpGet]
        public List< Mark_Count> GetStudentMarks(int CourseID)
        {
            List<StudentMark> StudenstMarks = new List<StudentMark>();
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {
                var SM = (from c in entity.Course_Students
                          where c.Semster_ID == 1
                          where c.Course_ID == CourseID
                          from e in entity.Exams
                          where e.Course_ID == c.Course_ID
                          where e.Semster_ID == c.Semster_ID
                          from EM in entity.Students_Exams
                          where EM.Exam_ID==e.Exam_ID
                          where EM.Student_ID==c.Student_ID
                          select  new { c.Student_ID, c.Student_Practical, EM.Exam_Result}).ToList();


              

                for (int i=0;i < SM.Count();i++)
                {
                    StudentMark sm = new StudentMark();
                    sm.Id = SM[i].Student_ID;

                    for (int j=i+1;j<SM.Count();j++)
                    {
                        if (SM[i].Student_ID == SM[j].Student_ID)
                        {
                            sm.Mark = (int)SM[i].Student_Practical + (int)SM[i].Exam_Result + (int)SM[i + 1].Exam_Result;
                            StudenstMarks.Add(sm);
                            break;
                        }
                    }



                }
                var result = StudenstMarks.GroupBy(s => s.Mark).Select(g => new { Mark = g.Key, Count = g.Count(), });

                List<Mark_Count> Marks = new List<Mark_Count>();

                foreach (var item in result)
                {
                    Mark_Count r = new Mark_Count();

                     r.Mark = item.Mark;
                     r.Count = item.Count;
                    Marks.Add(r);
                }

                return Marks;
            }
           

        }
    }
}
