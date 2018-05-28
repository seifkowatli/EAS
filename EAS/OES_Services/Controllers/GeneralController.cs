using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;
using Microsoft.AspNet.Identity;
using Owin;
using System.Web.Security;
using OES_Services.Models;

namespace OES_Services.Controllers
{

    [RoutePrefix("api/General")]
    public class GeneralController : ApiController
    {

        [Route("GetUserInformatin")]
        [HttpGet]
        public ApplicationUser GetUserInformatin()
        {
           string UserID =User.Identity.GetUserId();
            ApplicationUser user = new ApplicationUser();

            ApplicationDbContext context = new ApplicationDbContext();

            user = (from _User in context.Users
                    where _User.Id == UserID
                    select _User).FirstOrDefault();

           return user;

        }



    }
}
