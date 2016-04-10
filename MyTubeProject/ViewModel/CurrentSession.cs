using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using MyTubeProject.Controllers;
using MyTubeProject.Models;

namespace MyTubeProject.ViewModel
{
    public class CurrentSession
    {
        public static User CurrentUser
        {
            get
            {
                if (HttpContext.Current.Session["CurrentUser"] == null)
                {
                    AccountController.ResetCurrentUserSession();
                }

                return (User)HttpContext.Current.Session["CurrentUser"];
            }
            set
            {
                HttpContext.Current.Session["CurrentUser"] = value;
            }
        }
    }
}
