using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyTubeProject.Models;

namespace MyTubeProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (var db = new MyTubeEntities())
            {

                return View();
            }
        }

        public ActionResult Register(string username, string password, string emailAddress)
        {
            using (var db = new MyTubeEntities())
            {
                var newUser = new User
                {
                    Username = username,
                    Password = password,
                    Email = emailAddress,
                    CreatedOn = DateTime.Now,
                    CreatedBy = username,
                    IsActive = true,
                    RoleId = 1,
                };
                db.Users.Add(newUser);
                db.SaveChanges();
                return View();
            }
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
    }
}