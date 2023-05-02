using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpaNSalon
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Serv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Services.aspx");
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string i = ListView1.SelectedDataKey.Value.ToString();
            Session["serviceid"] = i;
            Response.Redirect("BookService.aspx");
        }
    }
}