﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Portal_EndPoint.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Result()
        {
            return View();
        }

        public ActionResult ShowSubject()
        {
            return View();
        }

        public ActionResult Admin()
        {
            return View();
        }

        public ActionResult Student()
        {
            return View();
        }
        public ActionResult Teacher()
        {
            return View();
        }


    }
}