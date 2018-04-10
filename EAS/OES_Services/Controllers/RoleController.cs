using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OES_Services.Controllers
{
    public class RoleController : ApiController
    {


        public string Get()
        {
            using (OES_DatabaseEntities1 entities = new OES_DatabaseEntities1())
            {
                string role = "";


                if (User.IsInRole("Student"))
                {
                    role = "http://localhost:51103/Student/Marks";
                    return role;

                }
                if (User.IsInRole("Admin"))
                {

                    role = "http://localhost:51103/Admin/AddUser";

                    return role;
                }
                if (User.IsInRole("teacher"))
                {
                    role = "http://localhost:51103/Teacher/AddQuestion";
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

