using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using test3.Models.StokEntity;
using PagedList;
using PagedList.Mvc;
using test3.Models;
using System.Runtime.Remoting.Contexts;

namespace test3.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        DbTestStokEntities db = new DbTestStokEntities();
        public ViewResult Index(int sayfa = 1)
        {

			
         
            UrunModel model = new UrunModel();

            ViewBag.selamlar = model.Uruns = db.StokUrunlerr.ToList();

            var urunler = db.StokUrunlerr.ToList().ToPagedList(sayfa, 3);
            return View(urunler);

			/*List<UrunModel> urunler = new List<UrunModel>()
            {
              new UrunModel(){UrunId=1,UrunAdi="Elma",Aciklama="iyi",Fiyat=10,Aktif=true},
                new UrunModel(){UrunId=2,UrunAdi="Armut",Aciklama="iyi",Fiyat=10,Aktif=true},
                new UrunModel(){UrunId=3,UrunAdi="Portakal",Aciklama="iyi",Fiyat=10,Aktif=false},
                new UrunModel(){UrunId=4,UrunAdi="Süt",Aciklama="iyi",Fiyat=10,Aktif=true},
                new UrunModel(){UrunId=5,UrunAdi="Peynir",Aciklama="iyi",Fiyat=10,Aktif=false},
                new UrunModel(){UrunId=6,UrunAdi="Patates",Aciklama="iyi",Fiyat=10,Aktif=true},
            };
            return View(urunler);
        }
        public ViewResult Contact()
        {
            return View();
        }*/
		
         

        }
        public ActionResult Ara(string p)
        {
            var deger = from d in db.StokUrunlerr select d;
            if (!string.IsNullOrEmpty(p))
            {
                deger = deger.Where(m => m.UrunAd.Contains(p));
            }
            return View(deger.ToList());
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Getir(int id)
        {

            var urunler = db.StokUrunlerr.Find(id);
            return View("Getir",urunler);

        }



    }
} 