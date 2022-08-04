using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLibrary
{
    public static class VariableConvertHelper
    {
        public static int ToInt(this object o)  // this object o
        {
            try
            {
                return o is DBNull || o == null || string.IsNullOrEmpty(o.ToString()) ? 0 : Convert.ToInt32(o.ToString().Replace("-", ""));
            }
            catch
            {
                return 0;
            }
        }
    }
}
