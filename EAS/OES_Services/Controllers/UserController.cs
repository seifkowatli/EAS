using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.AspNet.Identity;


namespace OES_Services.Controllers
{

    [RoutePrefix("api/User")]
    public class UserController : ApiController
    {

        //[HttpPut]
        //public HttpResponseMessage EditUserInfo(int id, [FromBody]AspNetUser User)
        //{
        //    try
        //    {
        //        using (OES_AccoutsEntities entities = new OES_AccoutsEntities())
        //        {
        //            var entity = entities.AspNetUsers.FirstOrDefault(e => e.Id == id.ToString());

        //            if (entity == null)
        //                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "The User With the ID" + id.ToString() + " Not Found");

        //            else
        //            {
        //                entity.F_Name = User.F_Name;
        //                entity.L_Name = User.L_Name;
        //                entity.Email = User.Email;
        //                entity.PhoneNumber = User.PhoneNumber;

        //                entities.SaveChanges();

        //                return Request.CreateResponse(HttpStatusCode.OK);
        //            }

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
        //    }

        //}


        public string GetUserID()
        {
            return User.Identity.GetUserId();
        }


        [HttpGet]
        [Route("api/User/Get")]
        public string Get()
        {
            using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
            {
                // AspNetUsers user = new AspNetUsers();
                // user = entities.AspNetUsers.FirstOrDefault(e => e.UserName == UserName);
                //if (user == null)
                //    return "null" ;
                //return user.Id;

                string role = "2";
                if (User.IsInRole("Student"))
                {
                    role = "http://google.com";
                    return role;

                }
                if (User.IsInRole("Admin"))
                {

                    role = "http://facebook.com";

                    return role;
                }
                if (User.IsInRole("teacher"))
                {
                    role = "http://youtube.com";
                    return role;
                }
                else
                {
                    return role;
                }

            }
        }

    }
}
