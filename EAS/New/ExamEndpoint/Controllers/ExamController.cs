using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Client_Side.Controllers
{
    public class ExamController : Controller
    {
        // GET: Exam
        public ActionResult Exam_instructions()
        {
            return View();

        }

            public ActionResult Exam_Page()
            {
                return View();
            }
        }
}