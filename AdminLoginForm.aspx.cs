using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SpaNSalon;

namespace SpaNSalon
{
    public partial class AdminLoginForm : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = Connect.conne();
        }

        protected void btnLGN_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
                login();
            else
                Response.Write("<script>alert('Please enter Username and Password!')</script>");
        }
        
        private void login()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select username, password from admMst where username=@username AND password =@password;", conn);
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["adu"] = dr.GetValue(0).ToString();
                        Response.Redirect("AdminDash.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Login unsuccessfull!')</script>");
                    txtUserName.Text = string.Empty;
                    txtPassword.Text = string.Empty;
                    txtUserName.Focus();
                }

            }
            catch (Exception e)
            {

                Response.Write("<script>alert('Error!')</script>");
            }

        }
        
        private bool IsFormValid()
        {
            if (txtUserName.Text == string.Empty)
            {
                Response.Write("<script>alert('Username is Empty!')</script>");
                txtUserName.Text = string.Empty;
                txtUserName.Focus();
                return false;
            }
            if (txtPassword.Text == string.Empty)
            {
                Response.Write("<script>alert('Please provide password!')</script>");
                txtPassword.Text = string.Empty;
                txtPassword.Focus();
                return false;
            }
            return true;
        }

    }
}