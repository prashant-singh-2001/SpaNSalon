using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SpaNSalon;
using System.Data;
using System.Data.SqlClient;

namespace SpaNSalon
{
    public partial class EmployeeDash : System.Web.UI.Page
    {
        SqlConnection con = Connect.conne();
        SqlCommand cmd;
        SqlDataReader dr;
        string sql, un, oc;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["employeeID"] == null)
                Response.Redirect("EmployeeLogin.aspx");
            else
                un = Session["employeeID"].ToString();
            username.Text=un;
            emp.Text = setName();
            oc = getoc(un);
            if (oc == "Y")
                occ.Text = "Occupied : Yes";
            else
                occ.Text = "Occupied : No";

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["employeeID"] = null;
            Response.Redirect("EmployeeLogin.aspx");
        }

        protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string s1=ListView2.SelectedDataKey[0].ToString();
            string s2=ListView2.SelectedDataKey[1].ToString();
            string s3=ListView2.SelectedDataKey[2].ToString();
            sql = "UPDATE servicingMst SET status='A' WHERE user_un='" + s1 + "' AND emp_un='" + s2 + "' AND service_id='" + s3 + "'";
            cmd= new SqlCommand(sql,con);
            int i=cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("EmployeeDash.aspx");
            }
            else
                Response.Write("<script>alert('Please Retry!')</script>");
        }

        protected void changeOccupied_Click(object sender, EventArgs e)
        {
            if(oc=="Y")
                sql = "UPDATE empMst SET occupied='N' WHERE username='"+un+"'";
            else
                sql = "UPDATE empMst SET occupied='Y' WHERE username='"+un+"'";
            cmd=new SqlCommand(sql,con);
            int i=cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Redirect("EmployeeDash.aspx");
            else
                Response.Write("<script>alert('There was some error! Contact Admin!')</script>");
            }

        private string getoc(string en)
        {
            sql = "SELECT occupied FROM empMst where username='" + en + "'";
            cmd = new SqlCommand(sql, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    oc = dr[0].ToString();
                }
            }
            dr.Close();
            return oc;
        }

        private String setName()
        {
            String empname=null;
            sql = "SELECT first_name, last_name FROM empMst where username='"+un+"'";
            cmd = new SqlCommand(sql, con);
            dr=cmd.ExecuteReader();
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
    }
}