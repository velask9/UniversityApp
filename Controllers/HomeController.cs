using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolUserManagmentApp.Controllers
{
    public class HomeController : Controller
    {
        SchoolAppContext context = new SchoolAppContext();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(User log)
        {
            int user = context.Users.Where(x => x.Username == log.Username && x.Password == log.Password).Count();
            
            if (user == 1) 
            {
                return RedirectToAction("Dashboard");
            }
            else
            {
                return View();
            }
            
        }

        public ActionResult Dashboard() 
        {
            return View();
        }
    }
}