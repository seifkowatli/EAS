using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Portal.Controllers
{
    public class AdminController : Controller
    {
      
        public ActionResult Courses()
        {
            return View();
        }

        public ActionResult AddCourse()
        {
            return View();
        }

        public ActionResult AddUser()
        {
            return View();
        }


    }
}