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
    public partial class AdminDash2 : System.Web.UI.Page
    {
        SqlConnection conn = Connect.conne();
        SqlCommand cmd;
        SqlDataReader dr;
        static string sql, empName, FullName, eMail, userAddress, employeeID , username, serviceid, un;

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["adu"] = null;
            Response.Redirect("AdminLoginForm.aspx");
        }

        static long cont;

        private String setName()
        {
            String adminname = null;
            sql = "SELECT first_name, last_name FROM admMst where username='" + un + "'";
            cmd = new SqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    adminname = dr[0].ToString() + " " + dr[1].ToString();
                }
            }
            dr.Close();
            cmd.Dispose();
            return adminname;
        }

        protected void btnDeny_Click(object sender, EventArgs e)
        {
            string com = "UPDATE servicingMst SET status='D' WHERE user_un='" + username + "' AND emp_un='" + employeeID + "' AND service_id='" + serviceid + "'";
            cmd = new SqlCommand(com, conn);
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
                Response.Redirect("AdminDash2.aspx");
            else
                Response.Write("<script>alert('There was some error in updating status! Please Retry!')</script>");

        }

        private void setSer(string sid)
        {
            string sql = "SELECT img_loc, service_name FROM servicesMst where service_id='"+sid+"'";
            cmd = new SqlCommand(sql,conn);
            dr=cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    servIm.ImageUrl = dr[0].ToString();
                    servName.Text=dr[1].ToString();
                }
            }
            dr.Close();
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            string com = "UPDATE servicingMst SET status='A' WHERE user_un='" + username + "' AND emp_un='" + employeeID + "' AND service_id='" + serviceid + "'";
            cmd =new SqlCommand(com,conn);
            int i=cmd.ExecuteNonQuery();
            if (i != 0)
                Response.Redirect("AdminDash2.aspx");
            else
                Response.Write("<script>alert('There was some error in updating status! Please Retry!')</script>");

        }

        private void fetchW()
        {
            
            cmd = new SqlCommand("select * from all_info where status='W'", conn);
            dr = cmd.ExecuteReader();
            
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    empName = dr.GetString(0) + " " + dr.GetString(1);
                    FullName = dr.GetString(6) + " " + dr.GetString(7);
                    eMail = dr.GetString(8);
                    cont = dr.GetInt64(9);
                    userAddress=dr.GetString(15) + ", " + dr.GetString(17) + ", " + dr.GetString(16) + ", " + dr.GetString(18);
                    employeeID = dr.GetString(12);
                    username = dr.GetString(14);
                    serviceid = dr[13].ToString();

                }
            }
            else 
            {
                Session["req"] = 0;
                Response.Redirect("AdminDash.aspx");
            }
            emp.Text=empName;
            uFullName.Text=FullName;
            umail.Text=eMail;
            address.Text = userAddress;
            ucontact.Text = cont.ToString();
            empID.Text = employeeID;
            dr.Close();
            cmd.Dispose();
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adu"] != null)
            {
                //Response.Write("<script>alert('Welcome, " + Session["adu"].ToString() + "')</script>");
                un=ue.Text = Session["adu"].ToString();
            }
            else
                Response.Redirect("AdminLoginForm.aspx");
            name.Text = setName();
            fetchW();
            setSer(serviceid);
        }
    }
}