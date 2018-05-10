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
    }

}