using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLibrary;
using EntityFrameworkLibrary;

namespace ornek_proje_5.Controllers
{
    public class PartialController : Controller
    {
        // GET: Partial

        PageItem item = new PageItem();
        OrnekDBEntities db = new OrnekDBEntities();

        [HttpPost]
        public ActionResult GetUrunForm(FormCollection collection)
        {
            int UrunID = collection["UrunID"].ToInt();


            item.lstKategorilerIslem = db.Proc_Kategoriler_Islem("Liste", 0, 0, "", "", "").ToList();

            if (UrunID > 0)
            {
                item.lstUrunlerIslem = db.Proc_Urunler_Islem("Liste", UrunID, 0, "", "", "", "").ToList();
            }
            else
            {
                item.lstUrunlerIslem.Add(new Proc_Urunler_Islem_Result { urunID = 0, kategoriID = 0, urunResimUrl = ItemHelper.GetResimYokUrl });
            }

            return View(item);
        }



        public ActionResult GetUrunSil(int id)
        {

            item.lstUrunlerIslem = db.Proc_Urunler_Islem("Liste", id, 0, "", "", "", "").ToList();

            return View(item);
        }

        [HttpPost]
        public ActionResult GetKategoriForm(FormCollection collection)
        {
            int KategoriID = collection["KategoriID"].ToInt();



            if (KategoriID > 0)
            {
                item.lstKategorilerIslem = db.Proc_Kategoriler_Islem("Liste", KategoriID, 0, "", "", "").ToList();
            }
            else
            {
                item.lstKategorilerIslem.Add(new Proc_Kategoriler_Islem_Result { UstKategoriID = 0, kategoriID = 0, kategoriResimUrl = ItemHelper.GetResimYokUrl });
            }
            item.lstSelectList = db.Proc_Kategoriler_Islem("Liste", 0, 0, "", "", "").Select(x => new SelectListItem { Value = x.kategoriID.ToString(), Text = x.kategoriBaslik }).ToList();

            return View(item);
        }

        public ActionResult GetKategoriSil(int id)
        {

            item.lstKategorilerIslem = db.Proc_Kategoriler_Islem("Liste", id, 0, "", "", "").ToList();

            return View(item);
        }
        [HttpPost]
        public ActionResult GetMarkaForm(FormCollection collection)
        {
            int MarkaID = collection["MarkaID"].ToInt();
            if (MarkaID > 0)
            {
                item.lstMarkalarIslem = db.Proc_Markalar_Islem("Liste", MarkaID, "", "", "").ToList();
            }
            else
            {
                item.lstMarkalarIslem.Add(new Proc_Markalar_Islem_Result { markaBaslik = "", markaID = 0, markaResimUrl = ItemHelper.GetResimYokUrl });
            }
            item.lstSelectList = db.Proc_Markalar_Islem("Liste", 0, "", "", "").Select(x => new SelectListItem { Value = x.markaID.ToString(), Text = x.markaBaslik }).ToList();
            return View(item);
        }

        public ActionResult GetMarkaSil(int id)
        {
            item.lstMarkalarIslem = db.Proc_Markalar_Islem("Liste", id, "", "", "").ToList();
            return View(item);
        }
    }
}