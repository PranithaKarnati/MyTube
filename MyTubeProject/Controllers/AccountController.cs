using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MyTubeProject.Models;
using MyTubeProject.ViewModel;

namespace MyTubeProject.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new MyTubeEntities())
                {
                    var existEmailAddress = db.Users.Any(x => x.Username == model.EmailAddress);
                    if (existEmailAddress)
                    {
                        ModelState.AddModelError("ErrorMessage", "This email address is already exist");
                        return View(model);
                    }
                    var newUser = new User
                    {
                        Username = model.EmailAddress,
                        Password = model.Password,
                        CreatedBy = model.EmailAddress,
                        CreatedOn = DateTime.Now,
                        IsActive = true,
                        RoleId = 1,
                        Email = model.EmailAddress
                    };
                    db.Users.Add(newUser);
                    db.SaveChanges();
                    FormsAuthentication.SetAuthCookie(model.EmailAddress, true);
                    ResetCurrentUserSession(model.EmailAddress);
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                ModelState.AddModelError("ErrorMessage", "Please complete all the field");
                return View(model);
            }
            
        }

        public ActionResult CheckIfEmailAddressIsExist(string EmailAddress)
        {
            using (var db = new MyTubeEntities())
            {
                var existEmail = db.Users.Any(x => x.Username == EmailAddress);
                return Json(!existEmail , JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult LogOff()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            CurrentSession.CurrentUser = null;
            return RedirectToAction("Index", "Home");
        }

        public static void ResetCurrentUserSession(string userName = null)
        {
            if (string.IsNullOrEmpty(userName))
            {
                userName = System.Web.HttpContext.Current.User.Identity.Name;
            }

            using (var db = new MyTubeEntities())
            {
                var user = db.Users.FirstOrDefault(n => n.Username == userName);
                // modified for forgot password
                if (user == null)
                {
                    return;
                }
                // Generic of CurrentUser that can user across system
                CurrentSession.CurrentUser = user;
            }
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            using (var db = new MyTubeEntities())
            {
                var user = db.Users.Where(x => x.Username == model.UserName && x.Password == model.Password).FirstOrDefault();
                if (user == null)
                {
                    ModelState.AddModelError("ErrorMessage", "We can not find your combination");
                    return View(model);
                }
                FormsAuthentication.SetAuthCookie(user.Email, true);
                ResetCurrentUserSession(user.Email);
                return RedirectToAction("Index", "Home");
            }
        }
    }
}