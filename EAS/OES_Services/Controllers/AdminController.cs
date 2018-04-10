using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EAS_DataBase;

namespace OES_Services.Controllers
{
    public class AdminController : ApiController
    {
        
        [HttpGet]
        public void Add_Course(Course c)
        {
            Course a = new Course();
            a.Course_Name = "a";
            a.Credit_Hours = 3;
            a.Course_Description = "bb";
            using (EAS_DatabaseEntities entities = new EAS_DatabaseEntities())
            {
                
                entities.Courses.Add(a);
                entities.SaveChanges();
            }



        }
    }
}
