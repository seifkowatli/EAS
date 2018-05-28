using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Database;

namespace OES_Services.Controllers
{
    public class RouteController : ApiController
    {


        public string Get()
        {
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                string role = "";
               
                if (User.IsInRole("Student"))
                {
                    role = "http://localhost:51103/Student/Index";
                    return role;

                }


                if (User.IsInRole("Admin"))
                {

                    role = "http://localhost:51103/Admin/Index#";

                    return role;
                }
                if (User.IsInRole("teacher"))
                {
                    role = "http://localhost:51103/Teacher/Index";
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

