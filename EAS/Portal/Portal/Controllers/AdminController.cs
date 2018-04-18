using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
 
namespace Portal.Controllers
{
    public class AdminController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

       
        public ActionResult Statistics()
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

        public ActionResult AllCourses()
        {
            return View();
        }


        public ActionResult AllUsers()
        {
            return View();
        }

        public ActionResult AddQuestion()
        {
            return View();
        }

        public ActionResult AddExam()
        {
            return View();
        }

        public ActionResult AllExams()
        {
            return View();
        }
    }
}