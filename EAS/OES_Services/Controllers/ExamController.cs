using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace OES_Services.Controllers
{
    public class ExamController : ApiController
    {

        // GET: api/Exam
        [HttpGet]
        public HttpResponseMessage GetExamsList()
        {
            using (OES_DatabaseEntities1 ent = new OES_DatabaseEntities1())
            {
                var ExamsList = ent.Exams.ToList();

                if (ExamsList == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, "There is no Exams Yet");
                else
                    return Request.CreateResponse(HttpStatusCode.OK, ExamsList);

            }
        }
        

        [HttpGet]
        public HttpResponseMessage GetExamOnCertainData(DateTime ExDate)
        {

            using (OES_DatabaseEntities1 ent = new OES_DatabaseEntities1())
            {
                var entity = ent.Exams.FirstOrDefault(e => e.Exam_Date == ExDate.ToString());

                if (entity != null)
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                else
                    return Request.CreateResponse(HttpStatusCode.NotFound, "There are no Exams on" + ExDate.ToString());

            }
        }


        // POST: api/Exam
        [HttpPost]
        public HttpResponseMessage AddExam([FromBody]Exam Ex)
        {
            try
            {
                using (OES_DatabaseEntities1 OES_QuestionBank = new OES_DatabaseEntities1())
                {
                    OES_QuestionBank.Exams.Add(Ex);
                    OES_QuestionBank.SaveChanges();

                    var message = Request.CreateResponse(HttpStatusCode.Created, Ex);
                    message.Headers.Location = new Uri(Request.RequestUri + Ex.Id.ToString());
                    return message;
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }



        // PUT: api/Exam/5
        [HttpPut]
        public HttpResponseMessage EditExam(int id, [FromBody]Exam Ex)
        {
            try
            {
                using (OES_DatabaseEntities1 ents = new OES_DatabaseEntities1())
                {
                    var entity = ents.Exams.FirstOrDefault(e => e.Id == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Exam You Request Not Found");

                    else
                    {
                       
                        entity.Semester = Ex.Semester;
                        entity.Exam_Date = Ex.Exam_Date;                
                        ents.SaveChanges();

                        return Request.CreateResponse(HttpStatusCode.OK);
                    }

                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }

        // DELETE: api/Exam/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (OES_DatabaseEntities1 ents = new OES_DatabaseEntities1())
                {
                    var entity = ents.Exams.FirstOrDefault(e => e.Id == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Exam not exist");

                    else
                    {
                        ents.Exams.Remove(entity);
                        ents.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
