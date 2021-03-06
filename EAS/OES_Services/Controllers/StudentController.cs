﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;
using Microsoft.AspNet.Identity;

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
        public List<CourseWithMark> CWM;

        public SemesterCourses()
        {

            CWM = new List<CourseWithMark>();

        }

    }

    [RoutePrefix("api/Student")]
    public class StudentController : ApiController
    {

        [HttpGet]
        [Route("GetAllCourseMarks")]
        [Authorize]
        public List<SemesterCourses> GetAllCourseMarks()
        {
            String UserID = User.Identity.GetUserId();

            List<SemesterCourses> semestercourses = new List<SemesterCourses>();

            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                List<Semester> AllStudentSemester = new List<Semester>();


                var SemesterID = (from c in entities.Semester_Courses
                                  where c.UserID == UserID
                                  select c.Semster_ID).ToList();

                foreach (var item in SemesterID)
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

                    var CourseID = (from c in entities.Semester_Courses
                                    where c.Semster_ID == item.Semster_ID
                                    where c.UserID== UserID
                                    select c.Course_ID).ToList();



                    foreach (var item2 in CourseID)
                    {
                        CourseWithMark cwm = new CourseWithMark();

                        cwm.CourseName = (from c in entities.Courses
                                          where c.Course_ID == item2
                                          select c.Course_Name).FirstOrDefault();


                        cwm.StudentPractical = (int)(from c in entities.StudentsMarks
                                                     where c.CourseID== item2
                                                     where c.StudentID== UserID
                                                     where c.SemesterID==item.Semster_ID
                                                     select c.Practical).FirstOrDefault();

                        cwm.FinalMark = (int)(from c in entities.Exams
                                              from p in entities.Students_Exams
                                              where c.Exam_ID == p.Exam_ID
                                              where c.Exam_Type == "Final"
                                              where c.Course_ID == item2
                                              where c.Semster_ID == item.Semster_ID
                                              where p.Student_ID == UserID
                                              select p.Exam_Result).First();

                        cwm.MidMark = (int)(from c in entities.Exams
                                            from p in entities.Students_Exams
                                            where c.Exam_ID == p.Exam_ID
                                            where c.Exam_Type == "Midterm"
                                            where c.Course_ID == item2
                                            where c.Semster_ID == item.Semster_ID
                                            where p.Student_ID == UserID
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
