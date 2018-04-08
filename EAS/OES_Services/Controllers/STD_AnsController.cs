using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OES_Services.Controllers
{
    public class STD_AnsController : ApiController
    {

        [HttpGet]
        public IEnumerable<Student_Ans> GetSTD_Ans(string STD_id)
        {

            using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
            {


                var std = entities.AspNetUsers.FirstOrDefault(e => e.Id == STD_id);



                if (std == null)
                    return null;

                else

                    return (from e in entities.Student_Ans where e.STD_Id == STD_id select e).ToList();
                


            }



        }


        [HttpPost]
        public HttpResponseMessage AddSTD_Ans([FromBody]Student_Ans Ans)
        {
            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    entities.Student_Ans.Add(Ans);
                    entities.SaveChanges();

                    var message = Request.CreateResponse(HttpStatusCode.Created, Ans);
                    message.Headers.Location = new Uri(Request.RequestUri + Ans.STD_Id.ToString());
                    return message;
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

    }
}
