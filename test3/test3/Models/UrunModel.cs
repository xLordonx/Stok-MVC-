using System;
using System.Collections.Generic;
using System.Linq;
using test3.Models.StokEntity;
using PagedList;
using PagedList.Mvc;

namespace test3.Models
{

	public class UrunModel
	{
		
	
	
		
		public List<StokUrunlerr> Uruns { get; set; }
		public PagedList.IPagedList<StokUrunlerr> Sayfa { get; set; }
		public StokUrunlerr Turun{ get; set;}
		

		/*public int UrunId { get; set; }
		public string UrunAdi { get; set; }
		public string Aciklama { get; set; }
		public double Fiyat { get; set; }
		public bool Aktif { get; set; }*/
	
	}
	public class Urunler
	{
		public List<UrunModel> UrunCesit { get; set; }
	}
}