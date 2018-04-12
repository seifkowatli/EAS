using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Portal.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
       
        public  ActionResult Info()
        {

            return View();
        }

        public ActionResult Marks()
        {
            return View();
        }
    }
}