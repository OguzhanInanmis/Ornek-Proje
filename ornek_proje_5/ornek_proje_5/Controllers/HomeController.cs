using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLibrary;          //
using EntityFrameworkLibrary;   //

namespace ornek_proje_5.Controllers
{
    public class HomeController : Controller
    {
        PageItem item = new PageItem();
        OrnekDBEntities db = new OrnekDBEntities();

        public ActionResult Urunler()
        {
            item.lstUrunlerIslem = db.Proc_Urunler_Islem("Liste", 0, 0, "", "", "", "").ToList();
            return View(item);

        }
        public ActionResult Kategoriler()

        {
            item.lstKategorilerIslem = db.Proc_Kategoriler_Islem("Liste", 0, 0, "", "", "").ToList();
            return View(item);
        }
        public ActionResult Markalar()
        {
            item.lstMarkalarIslem = db.Proc_Markalar_Islem("Liste", 0, "", "", "").ToList();
            return View(item);
        }

        [HttpPost]
        public string UrunIslem(FormCollection collection, HttpPostedFileBase fileUrunResim)
        {
            string result = "";
            try
            {
                int UrunID = collection["UrunID"].ToInt();
                string type = collection["type"].ToString();
                if (type == "Kaydet")
                {
                    int KategoriID = collection["selectKategoriler"].ToInt();
                    string UrunKodu = collection["txtUrunKodu"].ToString();
                    string UrunBaslik = collection["txtUrunBaslik"].ToString();
                    string UrunAciklama = collection["txtUrunAciklama"].ToString();
                    string UrunResimUrl = collection["hdnUrunResim"].ToString();

                    UrunResimUrl = fileUrunResim.ToFileUploadKaydet("/Assets/Dosyalar/Urunler/Resim/", UrunResimUrl);

                    string process = "Yeni";
                    if (UrunID > 0)
                        process = "Guncelle";

                    Proc_Urunler_Islem_Result item = db.Proc_Urunler_Islem(process, UrunID, KategoriID, UrunKodu, UrunBaslik, UrunAciklama, UrunResimUrl).FirstOrDefault();

                }
                else if (type == "Sil")
                {

                    Proc_Urunler_Islem_Result item = db.Proc_Urunler_Islem("Sil", UrunID, 0, "", "", "", "").FirstOrDefault();

                }
                result = MessageHelper.SuccessMessage;
            }
            catch (Exception)
            {
                result = MessageHelper.ErrorMessage;
            }
            return result;
        }
        [HttpPost]
        public string KategoriIslem(FormCollection collection, HttpPostedFileBase fileKategoriResim)
        {
            string result = "";
            try
            {
                int KategoriID = collection["KategoriID"].ToInt();
                string type = collection["type"].ToString();
                if (type == "Kaydet")
                {
                    int UstKategoriID = collection["selectKategoriler"].ToInt();
                    string KategoriBaslik = collection["txtKategoriBaslik"].ToString();
                    string KategoriAciklama = collection["txtKategoriAciklama"].ToString();
                    string KategoriResimUrl = collection["hdnKategoriResim"].ToString();

                    KategoriResimUrl = fileKategoriResim.ToFileUploadKaydet("/Assets/Dosyalar/Kategoriler/Resim/", KategoriResimUrl);

                    string process = "Yeni";
                    if (KategoriID > 0)
                        process = "Guncelle";

                    Proc_Kategoriler_Islem_Result item = db.Proc_Kategoriler_Islem(process, KategoriID, UstKategoriID, KategoriBaslik, KategoriAciklama, KategoriResimUrl).FirstOrDefault();

                }
                else if (type == "Sil")
                {

                    Proc_Kategoriler_Islem_Result item = db.Proc_Kategoriler_Islem("Sil", KategoriID, 0, "", "", "").FirstOrDefault();

                }
                result = MessageHelper.SuccessMessage;
            }
            catch (Exception)
            {
                result = MessageHelper.ErrorMessage;
            }
            return result;
        }
        [HttpPost]
        public string MarkaIslem(FormCollection collection, HttpPostedFileBase fileMarkaResim)
        {
            string result = "";
            try
            {
                int markaID = collection["MarkaID"].ToInt();
                string type = collection["type"].ToString();
                if (type == "Kaydet")
                {
                    string markaBaslik = collection["txtMarkaBaslik"].ToString();
                    string markaAciklama = collection["txtMarkaAciklama"].ToString();
                    string markaResimUrl = collection["hdnMarkaResim"].ToString();

                    markaResimUrl = fileMarkaResim.ToFileUploadKaydet("/Assets/Dosyalar/Markalar/", markaResimUrl);

                    string process = "Yeni";
                    if (markaID > 0)
                        process = "Guncelle";

                    Proc_Markalar_Islem_Result item = db.Proc_Markalar_Islem(process, markaID, markaBaslik, markaAciklama, markaResimUrl).FirstOrDefault();
                }
                else if (type == "Sil")
                {
                    Proc_Markalar_Islem_Result item = db.Proc_Markalar_Islem("Sil", markaID, "", "", "").FirstOrDefault();
                }
                result = MessageHelper.SuccessMessage;
            }
            catch (Exception)
            {
                result = MessageHelper.ErrorMessage;
            }
            return result;

        }
    }


}
