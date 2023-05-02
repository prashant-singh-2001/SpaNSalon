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
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conn;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = Connect.conne();
        }

        protected void btnLGN_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("select username, password from userMst where username=@username AND password =@password;", conn);
                    if (conn.State == ConnectionState.Closed)
                        conn.Open();
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["username"] = dr[0].ToString();
                            if (Session["serviceid"] != null)
                                Response.Redirect("BookService.aspx");
                            Response.Write("<script>alert('Successfully Loged IN!')</script>");
                            Response.Redirect("Dash1.aspx");
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
                catch (Exception)
                {

                    Response.Write("<script>alert('Error!')</script>");
                }
            }
            else
            {

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