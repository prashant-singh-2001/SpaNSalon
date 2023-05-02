using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SpaNSalon
{
    public class Connect
    {
        public static SqlConnection conne()
        {
            SqlConnection conne = new SqlConnection(ConfigurationManager.ConnectionStrings["MajorProjectConnectionString"].ConnectionString);
            if(conne.State==ConnectionState.Closed)
                conne.Open();
            
            return conne;
        }
    }
}