using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OES_Services.Controllers
{
    public class ResultController : ApiController
    {

        [HttpGet]
        public HttpResponseMessage GettSubjectById(string id)
        {
            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    var Result = entities.STD_Result.FirstOrDefault(e => e.STD_Id == id);


                    if (Result == null)
                        return Request.CreateResponse(HttpStatusCode.NotFound, "Three are no Result to This Student.... The Student did't Apply To the Exam ");

                    else
                        return Request.CreateResponse(HttpStatusCode.OK, Result);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

    }
}
