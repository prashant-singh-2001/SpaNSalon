using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaNSalon
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"]==null)
                Response.Write("<script>alert('Please login to book the service!')</script>");
        }        

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string i = ListView1.SelectedDataKey.Value.ToString();
            Session["serviceid"] = i;
            Response.Redirect("BookService.aspx");
        }

        protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string i = ListView2.SelectedDataKey.Value.ToString();
            Session["serviceid"] = i;
            Response.Redirect("BookService.aspx");

        }

        protected void ListView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string i = ListView3.SelectedDataKey.Value.ToString();
            Session["serviceid"]=i;
            Response.Redirect("BookService.aspx");
        }

        protected void ListView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string i = ListView4.SelectedDataKey.Value.ToString();
            Session["serviceid"] = i;
            Response.Redirect("BookService.aspx");
        }
    }
}