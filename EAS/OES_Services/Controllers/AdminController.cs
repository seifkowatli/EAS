﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;
using System.Data.Entity;
using OES_Services.Models;

namespace OES_Services.Controllers
{
    public class StudentMark
    {
        public string Id { get; set; }
        public int Mark { get; set; }

    }
    public class Mark_Count
    {

        public int Mark { get; set; }
        public int Count { get; set; }



    }
    public class Users_With_Role
    {
        public string UserId { get; set; }
        public string F_Name { get; set; }
        public string L_Name { get; set; }
        public string Role { get; set; }
    }

    [RoutePrefix("api/Admin")]
    public class AdminController : ApiController
    {
        [Route("Add_Course")]
        [HttpPost]
        public void Add_Course(Course c)
        {

            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {

                entities.Courses.Add(c);
                entities.SaveChanges();
            }


        }




        [Route("Add_Semester_Course")]
        [HttpPost]
        public void Add_Course_Teacher(Semester_Courses SC)
        {



            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                entities.Semester_Courses.Add(SC);
                entities.SaveChanges();
            }


        }
        [Route("Add_ILOS")]
        [HttpPost]
        public void Add_ILOS(List<ILO> T)
        {
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {

                int Course_ID = (from c in entities.Courses
                                 orderby c.Course_ID descending
                                 select c.Course_ID).Take(1).SingleOrDefault();

                foreach (var item in T)
                {
                    item.Course_ID = Course_ID;
                    entities.ILOS.Add(item);
                }
                entities.SaveChanges();


            }
        }


        //for get all teachers when we add new course 
        [Route("Get_Teachers")]
        [HttpGet]
        public List<Users_With_Role> Get_Teachers()
        {


            ApplicationDbContext context = new ApplicationDbContext();
            List<Users_With_Role> UR = new List<Users_With_Role>();

            var usersWithRoles = (from user in context.Users
                                  select new
                                  {
                                      UserId = user.Id,
                                      F_Name = user.F_Name,
                                      L_Name = user.L_Name,

                                      RoleNames = (from userRole in user.Roles
                                                   join role in context.Roles on userRole.RoleId
                                                   equals role.Id
                                                   where role.Name == "teacher"
                                                   select role.Name).ToList()
                                  }).ToList().Select(p => new

                                  {
                                      UserId = p.UserId,
                                      F_Name = p.F_Name,
                                      L_Name = p.L_Name,
                                      Role = string.Join(",", p.RoleNames)
                                  });

            foreach (var item in usersWithRoles)
            {
                if (item.Role == "teacher")
                {
                    Users_With_Role A = new Users_With_Role();
                    A.UserId = item.UserId;
                    A.F_Name = item.F_Name;
                    A.Role = item.Role;
                    A.L_Name = item.L_Name;
                    UR.Add(A);
                }
            }

            return UR;
        }



        [Route("Get_Courses")]
        [HttpGet]
        public List<Course> Get_Courses()
        {


            using (EAS_DatabaseEntities entity=new EAS_DatabaseEntities())
            {
                List<Course> ALLCourses = new List<Course>();

                ALLCourses = (from c in entity.Courses select c).ToList();
                return ALLCourses;

            }


        }


        //Create New Exam 
        [Route("CreateExam")]
        [HttpPost]
        public void CreateExam(Exam NewExam)
        {
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {
                entity.Exams.Add(NewExam);
                entity.SaveChanges();

            }


        }



        [Route("AddNewExam")]
        [HttpPost]
        public void AddNewExam(Exam NewExam)
        {

            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {

                entity.Exams.Add(NewExam);
                entity.SaveChanges();

            }

        }
        //  Course Marks Chart
            [Route("CourseMarks/{CourseID:int}")]
            [HttpGet]
            public List<Mark_Count> GetStudentMarks(int CourseID)
            {
                List<StudentMark> StudenstMarks = new List<StudentMark>();
                using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
                {
                    var SM = (from c in entity.StudentsMarks
                              where c.SemesterID == 1
                              where c.CourseID == CourseID
                              select c).ToList();

                    foreach (var item in SM)
                    {
                        StudentMark sm = new StudentMark();
                        sm.Id = item.StudentID;
                        sm.Mark = item.Midterm + item.Final + item.Practical;
                        StudenstMarks.Add(sm);

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


        [Route("GetCourseExams/{CourseID:int}")]
        [HttpGet]
        public List<Exam> GetCourseExams(int CourseID)
        {
            using (EAS_DatabaseEntities entity = new EAS_DatabaseEntities())
            {
                List<Exam> C_Exams = new List<Exam>();

                C_Exams = (from e in entity.Exams
                           where e.Course_ID == CourseID
                           select e).ToList();

                return C_Exams;
            }

        }

    }
}
