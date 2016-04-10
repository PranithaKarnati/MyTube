using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyTubeProject.Models;
using MyTubeProject.ViewModel;

namespace MyTubeProject.Controllers
{
    public class VideoController : Controller
    {
        // GET: Video
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UploadVideo()
        {
            using (var db = new MyTubeEntities())
            {
                var channel = db.Channels.ToList();
                return View(channel);
            }
        }

        public ActionResult AddNewChannel(ChannelViewModel model)
        {
            using (var db = new MyTubeEntities())
            {
                var channel = new Channel
                {
                    UserId = CurrentSession.CurrentUser.Id,
                    Name = model.ChannelName,
                    Description = model.ChannelDescription,
                    IsActive = true,
                };
                db.Channels.Add(channel);
                db.SaveChanges();
                return Json(new { Success = true, NewChannel = new { Id = channel.Id, Name = channel.Name } });
            }
        }
    }
}