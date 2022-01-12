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
   
    public class UrunController : Controller
    {
        DbTestStokEntities db = new DbTestStokEntities();
        // GET: Urun
        public ViewResult Index(int sayfa=1)
        {
            //var urunler = db.StokUrunlerr.ToList();
            var urunler = db.StokUrunlerr.ToList().ToPagedList(sayfa, 3);
            return View(urunler);
        }

        [HttpGet]
        public ActionResult UrunEkle()
		{
            List<SelectListItem> deger = (from i in db.StokKategori.ToList()
                                          select new SelectListItem
                                          {
                                              Text = i.KategoriAd,
                                              Value = i.KategoriID.ToString()
                                          }).ToList();
            ViewBag.katdgr = deger;
            return View();
		}
        [HttpPost]
        public ActionResult UrunEkle(StokUrunlerr u1)
		{

            //linq
            var kat = db.StokKategori.Where(m => m.KategoriID == u1.StokKategori.KategoriID).FirstOrDefault();
            u1.StokKategori = kat;
            db.StokUrunlerr.Add(u1);
            db.SaveChanges();
            return RedirectToAction("Index");
		}
        public ActionResult UrunSil(int id)
		{
            var Urun = db.StokUrunlerr.Find(id);
            db.StokUrunlerr.Remove(Urun);
            db.SaveChanges();
            return RedirectToAction("Index");
		}
        public ActionResult UrunGetir(int id)
		{
            var urun = db.StokUrunlerr.Find(id);

            List<SelectListItem> deger = (from i in db.StokKategori.ToList()
                                          select new SelectListItem
                                          {
                                              Text = i.KategoriAd,
                                              Value = i.KategoriID.ToString()
                                          }).ToList();
            ViewBag.katdgr = deger;

            return View("UrunGetir", urun);
		}
        public ActionResult UrunGuncelle(StokUrunlerr u1)
		{

            var urun = db.StokUrunlerr.Find(u1.UrunID);
            urun.UrunAd = u1.UrunAd;
           
            urun.Fiyat = u1.Fiyat;
            urun.Stok = u1.Stok;
            urun.Marka = u1.Marka;
            var kat = db.StokKategori.Where(m => m.KategoriID == u1.StokKategori.KategoriID).FirstOrDefault();
            urun.UrunKategori = kat.KategoriID;
            db.SaveChanges();
            return RedirectToAction("Index");
		}
        //Urun/Liste
        public ViewResult Liste()
        {
            return View();
        }
        public ViewResult ProductDetail()
        {
            return View();
        }
    }
}