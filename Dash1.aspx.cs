using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SpaNSalon
{
    public partial class Dummy : System.Web.UI.Page
    {
        static String fn, ln, email, uname;

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Index.aspx");
        }

        private void fetch(string u)
        {
            SqlConnection con = Connect.conne();
            SqlCommand cmd = new SqlCommand("select first_name,last_name,email,username  from userMst where username='"+u+"'", con);
           
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    fn = dr[0].ToString();
                    ln = dr[1].ToString();
                    email = dr[2].ToString();
                    uname = dr[3].ToString();
                }
            }
            
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                uname = Session["username"].ToString();
                fetch(uname);
            }
            else { Response.Redirect("LoginForm.aspx"); }
            
            nami.Text = fn + " " + ln;
            mil.Text = email;
            unit.Text = uname;
        }
    }
}