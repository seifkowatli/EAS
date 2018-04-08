using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Client_Side.Controllers
{
   
    public class HomeController : Controller
    {
        public ActionResult Home_Page()
        {
            return View();
        } 
    }
}