using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using test3.Models.StokEntity;
using PagedList;
using PagedList.Mvc;

namespace test3.Controllers
{
    public class MusteriController : Controller
    {
        DbTestStokEntities db = new DbTestStokEntities();

        // GET: Musteri
        public ActionResult Index(int sayfa =1)
        {
            // var mus = db.StokMusteriBilgi.ToList();
            var mus = db.StokMusteriBilgi.ToList().ToPagedList(sayfa, 3);

            return View(mus);
        }
        [HttpGet]
        public ActionResult MusteriEkle()
		{
            return View();
		}
        [HttpPost]
        public ActionResult MusteriEkle(StokMusteriBilgi m1)
		{
            if (!ModelState.IsValid)
            {
                return View("MusteriEkle");
            }
            db.StokMusteriBilgi.Add(m1);
            db.SaveChanges();
            return View();
		}
        public ActionResult MusteriSil(int id)
		{
            var musteri = db.StokMusteriBilgi.Find(id);
            db.StokMusteriBilgi.Remove(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
		}
        public ActionResult MusteriGetir(int id)
		{
            var musteri = db.StokMusteriBilgi.Find(id);
            return View("MusteriGetir", musteri);
		}
        public ActionResult MusteriGuncelle(StokMusteriBilgi m1)
		{
            var musteri = db.StokMusteriBilgi.Find(m1.MusteriID);
            musteri.MusteriAd = m1.MusteriAd;
            musteri.MusteriSoyad = m1.MusteriSoyad;
            musteri.MusteriAdres = m1.MusteriAdres;
            db.SaveChanges();
            return RedirectToAction("Index");

		}
    }
}