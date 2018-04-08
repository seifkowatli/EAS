using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OES_Services.Controllers
{

    [RoutePrefix("api/Authintecation")]
    public class AuthintecationController : ApiController
    {


        [Route("STD_Auth")]
        [Authorize(Roles = "Student")]
        [HttpGet]
        public void STD_Auth()
        { }

        [Route("Admin_Auth")]
        [Authorize(Roles = "Admin")]
        [HttpGet]

        public void Admin_Auth()
        {
        }

        [Route("teacher_Auth")]
        [Authorize(Roles = "teacher")]
        [HttpGet]
        public void teacher_Auth()
        {


        }

    }
}
