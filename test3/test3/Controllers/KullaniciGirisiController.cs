using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using test3.Models.StokEntity;
namespace test3.Controllers
{
    public class KullaniciGirisiController : Controller
    {
        // GET: KullaniciGirisi
        DbTestStokEntities db = new DbTestStokEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(StokKullaniciGirisi T)
        {
            var bilgiler = db.StokKullaniciGirisi.FirstOrDefault(x => x.Mail == T.Mail && x.Sifre == T.Sifre);
            if (bilgiler != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
        }
        public ActionResult SatısAnasayfa()
        {
            return View();
        }
    }
}