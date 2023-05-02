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
    public partial class AdminDash5 : System.Web.UI.Page
    {
        SqlConnection con = Connect.conne();
        SqlCommand cmd;
        SqlDataReader dr;
        string sql, un;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adu"] != null)
            {

                un = username.Text = Session["adu"].ToString();
            }
            else
                Response.Redirect("AdminLoginForm.aspx");
            if ((int)Session["req"] == 0)
            {
                Response.Write("<script>alert('No waiting request found!')</script>");
                Session["req"] = -1;
            }
            Admin.Text = setName();
        }

        private String setName()
        {
            String empname = null;
            sql = "SELECT first_name, last_name FROM admMst where username='" + un + "'";
            cmd = new SqlCommand(sql, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    empname = dr[0].ToString() + " " + dr[1].ToString();
                }
            }
            dr.Close();
            cmd.Dispose();
            return empname;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["adu"] = null;
            Response.Redirect("AdminLoginForm.aspx");
        }
    }
}