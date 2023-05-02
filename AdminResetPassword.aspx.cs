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
    public partial class AdminResetPassword : System.Web.UI.Page
    {
        SqlConnection conn;
        String username;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = Connect.conne();
            if (Session["adminusername"] != null)
                username = Session["adminusername"].ToString();
            else
            {
                Response.Write("<script>alert('Unauthorized Access!')</script>");
                Response.Redirect("~/Index.aspx");
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (PasswordConfirms())
                reset();
            else
            {
                txtPasswordConf.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtPassword.Focus();
            }

        }
        
        private bool PasswordConfirms()
        {
            return txtPassword.Text.Trim() == txtPasswordConf.Text.Trim();
        }
        
        private void reset()
        {
            SqlCommand cmd = new SqlCommand("UPDATE admMst SET password = @password WHERE username=@username;", conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
            int c = cmd.ExecuteNonQuery();
            if (c > 0)
            {
                Response.Write("<script>alert('Password successfully changed! Login Please')</script>");
                Response.Redirect("~/AdminLoginForm.aspx");
            }
            else
            {
                Response.Write("<script>alert('Their was some error! Please try another time!')</script>");
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}