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
    public partial class AdminSignupForm : System.Web.UI.Page
    {
        
        SqlConnection conn;        
        String username;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = Connect.conne();
           
            if (Session["adu"] != null)
                username = Session["adu"].ToString();
            else
            {
                Response.Write("<script>alert('Unauthorized Access!')</script>");
                Response.Redirect("~/AdminLoginForm.aspx");
            }
        }

        protected void btnSgnUp_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            reg();

        }
        
        public void reg()
        {
            try
            {
                if (confirm())
                {
                    SqlCommand cmd = new SqlCommand("insert into admMst(username, password, first_name, last_name,email,contact,security_ans) values(@username, @password, @first_name, @last_name,@email,@contact,@security_ans)", conn);
                    cmd.Parameters.AddWithValue("@first_name", txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@last_name", txtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@security_ans", txtSecurity.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Welcome "+txtFirstName.Text+" to the admin team!')</script>");
                    Response.Redirect("AdminLoginForm.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Passwords is not confirmed!!')</script>");
                    txtPassword.Focus();
                }
            }
            catch (SqlException e)
            {
                Response.Write("<script>alert('" + e.Message + " : " + e.StackTrace + "')</script>");
            }

        }
        
        private bool confirm()
        {
            if (txtPassword.Text.Trim() == txtPasswordConf.Text.Trim())
                return true;
            return false;
        }
        
        private void clr()
        {
            txtContact.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPasswordConf.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSecurity.Text = string.Empty;
            
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select username from admMst where username = @username", conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Response.Write("<script>alert('Username already exists!')</script>");
                txtUserName.Text = null;
                txtUserName.Focus();
            }
           

        }
    }
}