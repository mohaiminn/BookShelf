using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyApp.Models;

namespace EbookWebApp.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        
        // GET: Home
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult LogIn()
        {
            return View();
        }
        public ActionResult loginIndex()
        {
            return View();
        }
        public ActionResult Competetion()
        {
            return View();
        }
        


    }
}