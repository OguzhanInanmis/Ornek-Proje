using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;        //
using System.IO;        //

namespace BusinessLibrary
{
    public static class FileUploadHelper
    {
        public static string ToFileUploadKaydet(this object o, string KlasorYol, string DosyaYol)    // this object o
        {
            string ExistFolder = "";
            for (int i = 1; i < KlasorYol.Split('/').Length - 1; i++)   // döngü split
            {
                ExistFolder += "/" + KlasorYol.Split('/')[i] + "/";
                if (!Directory.Exists(HttpContext.Current.Server.MapPath(ExistFolder)))
                {
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath(ExistFolder));
                }
            }

            HttpPostedFileBase Fu = (o as HttpPostedFileBase);  //
            string FileName = Guid.NewGuid().ToString();
            string FileNameExtension = "";
            try
            {
                if (Fu != null)
                {
                    FileNameExtension = System.IO.Path.GetExtension(Fu.FileName);
                    Fu.SaveAs(HttpContext.Current.Server.MapPath(KlasorYol) + FileName + FileNameExtension);
                    return KlasorYol + FileName + FileNameExtension;
                }
                else
                {
                    return KlasorYol;
                }
            }
            catch
            {
                FileName = "";
                FileNameExtension = "";
                return DosyaYol;
            }
        }
    }
}
