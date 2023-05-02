using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using UniqueKey;

namespace SpaNSalon
{
    public partial class ProvideUsername : System.Web.UI.Page
    {
        SqlConnection conn;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = Connect.conne();
            Session.RemoveAll();
        }

        protected void btnNex_Click(object sender, ImageClickEventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select username,security_ans from userMst where username=@username", conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (dr[1].ToString() == txtSecAns.Text.Trim())
                    {
                        Session["username"]=dr[0].ToString();
                        Response.Redirect("~/RecoverPassword.aspx");
                    }
                    else 
                    {
                        Response.Write("<script>alert('The security answer is wrong!')</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Enter valid username!')</script>");
            }
        }
    }
}