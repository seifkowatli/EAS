using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OES_Services.Controllers
{
    public class SubjectController : ApiController
    {


        [HttpGet]
        public HttpResponseMessage GetAllSubjects()
        {
            try
            {
                using ( OES_DatabaseEntities1 ent = new OES_DatabaseEntities1())
                {

    
                    var SubjectsList = ent.Subjects.ToList();
                    if (SubjectsList == null)
                        return Request.CreateResponse(HttpStatusCode.NotFound, "There is no Subject in the Database");

                    else
                        return Request.CreateResponse(HttpStatusCode.OK, SubjectsList);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }



        
        public Subject GettSubjectById(int id)
        {    
               using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    return entities.Subjects.FirstOrDefault(e => e.ID == id);
                

                }   
        }



        [HttpGet]
        public HttpResponseMessage GetStudentSubjects(string id)
        {
            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    var Student = entities.AspNetUsers.FirstOrDefault(e => e.Id == id);
                    IEnumerable<User_Subject> SSubjectList;

                    if (Student == null)
                        return Request.CreateResponse(HttpStatusCode.NotFound, "The Student you Request is not existed");

                    else
                        SSubjectList = (from e in entities.User_Subject where e.User_ID == id select e).ToList();



                    List<Subject> subList = null;
                    foreach (var v in SSubjectList)
                    {
                        subList.Add(GettSubjectById(v.Subject_ID));
                    }

                    return Request.CreateResponse(HttpStatusCode.OK, subList);
                    
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }







        [HttpPost]
        public HttpResponseMessage AddSubject([FromBody]Subject Sub)
        {
            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    entities.Subjects.Add(Sub);
                    entities.SaveChanges();

                    var message = Request.CreateResponse(HttpStatusCode.Created, Sub);
                    message.Headers.Location = new Uri(Request.RequestUri + Sub.ID.ToString());
                    return message;
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }


        [HttpPut]
        public HttpResponseMessage Edit_SubjectInfo(int id, [FromBody]Subject Sub)
        {

            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    var entity = entities.Subjects.FirstOrDefault(e => e.ID == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Subject with the ID" + id.ToString() + "Not Found");

                    else
                    {
                        entity.Name = Sub.Name;


                        entities.SaveChanges();

                        return Request.CreateResponse(HttpStatusCode.OK);
                    }

                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }



        // DELETE: api/Subject/5
        [HttpDelete]
        public HttpResponseMessage DeleteSubject(int id)
        {
            try
            {
                using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
                {
                    var entity = entities.Subjects.FirstOrDefault(e => e.ID == id);

                    if (entity == null)
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The Subject with ID " + id.ToString() + " is not exist");

                    else
                    {
                        entities.Subjects.Remove(entity);
                        entities.SaveChanges();
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
