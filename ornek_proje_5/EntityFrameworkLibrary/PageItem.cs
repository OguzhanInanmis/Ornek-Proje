using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;   //

namespace EntityFrameworkLibrary
{
    public class PageItem
    {
        public List<Proc_Markalar_Islem_Result> lstMarkalarIslem = new List<Proc_Markalar_Islem_Result>();
        public List<Proc_Urunler_Islem_Result> lstUrunlerIslem = new List<Proc_Urunler_Islem_Result>();
        public List<Proc_Kategoriler_Islem_Result> lstKategorilerIslem = new List<Proc_Kategoriler_Islem_Result>();
        public List<SelectListItem> lstSelectList = new List<SelectListItem>();
    }
}
