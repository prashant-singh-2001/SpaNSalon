using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace SpaNSalon
{
    public partial class RegisterNewService : System.Web.UI.Page
    {
        SqlConnection con = Connect.conne();
        SqlCommand cmd;
        SqlDataReader dr;
        string savePath, sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["adu"] == null)
                Response.Redirect("AdminLoginForm.aspx");
            servIm.Visible = false;
        }

        private int getsid()
        {
            int sid = 0;    
            sql = "SELECT MAX(service_id) FROM servicesMst;";
            cmd= new SqlCommand(sql, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    sid = Convert.ToInt32(dr[0].ToString())+1;
                }
            }
            dr.Close();
            return sid;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sql = "INSERT INTO servicesMst(service_id,service_name,price,type,img_loc) VALUES( "+ getsid()+" ,'"+servname.Text+ "','" + price.Text + "','" + servtype.Text + "','"+servIm.ImageUrl.ToString().Substring(1)+"')";
            cmd = new SqlCommand(sql,con) ;
            int i=cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Recorded inserted Successfully!')</script>");
                Response.Redirect("AdminDash.aspx");
            }
            else
            { 
                Response.Write("<script>alert('Not Inserted!')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileEx = System.IO.Path.GetExtension(FileUpload1.FileName);
                savePath = "~/Images/banner_service/" + FileUpload1.FileName;
                if (fileEx.ToLower() != ".jpg" && fileEx.ToLower() != ".jpeg")
                {
                    Response.Write("<script>alert('Only file with extension jpg or jpeg are allowed')</script>");
                    FileUpload1.Focus();
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath(savePath));
                    servIm.ImageUrl = savePath;
                    servIm.Visible = true;
                    Response.Write("<script>alert('File Uploaded!')</script>");
                    FileUpload1.Visible = false;
                    Button2.Visible = false;
                    UploadedPic.Visible = true;
                    UploadedPic.Text = FileUpload1.FileName;
                    
                }
            }
            else
            {
                Response.Write("<script>alert('Please Select a Picture!')</script>");
            }
        }
    }
}