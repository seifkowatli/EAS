using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace OES_Services.Controllers
{
    public class QuestionController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage AddQuestion([FromBody]Question q)
        {
            try
            {
                using (OES_DatabaseEntities1 OES_QuestionBank = new OES_DatabaseEntities1())
                {
                    OES_QuestionBank.Questions.Add(q);
                    OES_QuestionBank.SaveChanges();

                    var message = Request.CreateResponse(HttpStatusCode.Created, q);
                    message.Headers.Location = new Uri(Request.RequestUri + q.Id.ToString());
                    return message;
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }


        [HttpPut]
        public HttpResponseMessage EditQuestion(int id, [FromBody]Question q)
        {
            try
            {
                using (OES_DatabaseEntities1 OES_QuestionBank = new OES_DatabaseEntities1())
                {
                    var entity = OES_QuestionBank.Questions.FirstOrDefault(e => e.Id == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Question You Request Not Found");

                    else
                    {
                        entity.Q_Text = q.Q_Text;

                        OES_QuestionBank.SaveChanges();

                        return Request.CreateResponse(HttpStatusCode.OK);
                    }

                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }


        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (OES_DatabaseEntities1 OES_QuestionBank = new OES_DatabaseEntities1())
                {
                    var entity = OES_QuestionBank.Questions.FirstOrDefault(e => e.Id == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Question not exist");

                    else
                    {
                        OES_QuestionBank.Questions.Remove(entity);
                        OES_QuestionBank.SaveChanges();
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
