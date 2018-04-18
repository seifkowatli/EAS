using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EAS_DataBase;
namespace OES_Services.Controllers
{


    [RoutePrefix("api/Teacher")]
    public class TeacherController : ApiController
    {


        [Route("Add_New_Question")]
        [HttpPost]
        public void Add_New_Question(Questions_Bank Nq)
        {

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

                

                foreach(var item in Answers)
                {

                    entities.Question_Answers.Add(item);
                }
                
                entities.SaveChanges();

            }


        }
    }
}
