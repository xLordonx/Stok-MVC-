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
    public class KategoriController : Controller
    {
        DbTestStokEntities db = new DbTestStokEntities();
        // GET: Kategori
        public ActionResult Index(int sayfa=1)
        {
            var kat = db.StokKategori.ToList().ToPagedList(sayfa, 3);
           // var kat = db.StokKategori.ToList();

            return View(kat);
        }
        [HttpGet] //reflash ve benzeri şeylerde çalışsın 
        public ActionResult KategoriEkle()
        {
          
            return View();
        }


        [HttpPost] //Tıklandığında çalışssın 
        public ActionResult KategoriEkle(StokKategori ka1)
		{
			if (!ModelState.IsValid)
			{
                return View("KategoriEkle");
			}
            db.StokKategori.Add(ka1);
            db.SaveChanges();
           
            return RedirectToAction("Index");
		}
        public ActionResult KategoriSil(int id)
		{
            var kategori = db.StokKategori.Find(id);
            db.StokKategori.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");

		}
        public ActionResult KategoriGetir(int id)
		{
            var kategorigetir = db.StokKategori.Find(id);
            return View("KategoriGetir", kategorigetir);
		}
        public ActionResult KategoriGuncelle(StokKategori k1)
		{
            var kat = db.StokKategori.Find(k1.KategoriID);
            kat.KategoriAd = k1.KategoriAd;
            db.SaveChanges();
            return RedirectToAction("Index");
		}
    
	}
}