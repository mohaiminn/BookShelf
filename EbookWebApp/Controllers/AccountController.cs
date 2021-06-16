using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Mvc;
using MyApp.Models;
using App.Db.DbOperations;
using System.Web.Security;
using App.Db;


namespace EbookWebApp.Controllers
{
    public class AccountController : Controller
    {
        EbookWebEntities db = new EbookWebEntities();
        AccountsDbOperations user = new AccountsDbOperations();
        
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UsersModel model)
        {
            var checkLogin=db.Users.Where(x=>x.Username.Equals(model.Username)&&x.Password.Equals(model.Password)).FirstOrDefault();
            if (checkLogin!=null)
            {
                FormsAuthentication.SetAuthCookie("userName", false);
                return RedirectToAction("loginindex", "Home");
            }
            else
            {
                ViewBag.error = "Wrong username or password";
                return View();
            }
        }

        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(UsersModel model)
        {
            if (ModelState.IsValid)
            {
                if (db.Users.Any(x=>x.Username==model.Username))
                {
                    ViewBag.InvalidUserName = "This Username has already been taken!";
                    return View();
                }
                int id = user.Signup(model);
                return RedirectToAction("login");
            }
            return View();
        }
        public ActionResult Logout()
        {   
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}