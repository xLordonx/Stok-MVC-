using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using test3.Models.StokEntity;
namespace test3.Controllers
{
    public class PersonelGirisiController : Controller
    {
        // GET: PersonelGirisi
        DbTestStokEntities db = new DbTestStokEntities();
        public ActionResult Index()
		{
            return View();
		}
        [HttpPost]
        public ActionResult Index(StokPersonelGiris T)
        {
            var bilgiler = db.StokPersonelGiris.FirstOrDefault(x => x.Mail == T.Mail && x.Sifre == T.Sifre);
            if (bilgiler != null)
            {
                return RedirectToAction("Index", "Kategori");
            }
            else
            {
                return View();
            }
        }
        
       
    }
}