using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SpaNSalon;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace SpaNSalon
{
    public partial class BookService : System.Web.UI.Page
    {
        SqlConnection conn = Connect.conne();
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        string uid, sid;
        static DateTime dt;
        string eid;

        private void setUser(string un )
        {
            cmd = new SqlCommand("select * from userMst where username='" + un + "'", conn);
            dr= cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    uid=dr[0].ToString();
                    user_name.Text = dr[0].ToString();
                    firstName.Text = dr[2].ToString();
                    lastName.Text = dr[3].ToString();
                    email.Text = dr[4].ToString();
                }
            }
            else
                Response.Write("<script>alert('There was some errror! Please retry after sometime!')</script>");
            dr.Close();
            cmd.Dispose();
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["serviceid"] == null)
                Response.Redirect("Services.aspx");
            if (Session["username"] == null)
                Response.Redirect("LoginForm.aspx");
            string un = Session["username"].ToString();
            int i = Convert.ToInt32(Session["serviceid"].ToString());
            setUser(un);
            setService(i);
            if(!IsPostBack)
                setSates();
            
        }

        private void setService(int i)
        {
            cmd = new SqlCommand("select * from servicesMst where service_id='" + i + "'", conn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    sid=dr[0].ToString();
                    ServiceCost.Text = dr[2].ToString();
                    ServiceName.Text = dr[1].ToString();
                    pimage.ImageUrl= dr[4].ToString();
                }
            }
            else
                Response.Write("<script>alert('There was some errror! Please retry after sometime!')</script>");
            dr.Close();
            cmd.Dispose();
        }
        
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            eid = getempid();
            if(eid==null)
            {
                Response.Write("Sorry, currently we are full! Please try after sometime!");
                return;
            }
            if (!serviceUnavailable())
            {
                string sql = "INSERT INTO servicingMst(user_un ,emp_un ,service_id ,date_req ,pincode ,line1 ,line2 ,city ,state ,status) " +
                    "VALUES ('" + uid + "','" + eid + "','" + sid + "','" + dt.ToString("yyyy/MM/dd") + "','" + pin.Text + "','" + line1.Text + "','" + line2.Text + "','" + city.Text + "','" + state.Text + "','W')";
                cmd = new SqlCommand(sql, conn);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>alert('Successfully Booked')</script>");
                    Response.Redirect("Dash1.aspx");
                }
                else
                    Response.Write("<script>alert('Error occured! Please try after sometime!')</script>");
                Response.Redirect("Services.aspx");
            }
            else
            {
                Response.Write("<script>alert('Service Unavailable on requested date! Please select different date or different service!')</script>");
            }
        }

        private bool serviceUnavailable()
        {
            string sql="SELECT * FROM servicingMst WHERE date_req='"+dt.ToString("dd/MM/yyyy")+"' AND service_id='"+sid +"' AND emp_un='"+eid+"';";
            cmd=new SqlCommand(sql, conn);
            dr=cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                return true; 
            }
            else 
            {
                dr.Close();
                return false;
            }
        }

        protected void date1_TextChanged(object sender, EventArgs e)
        {
            Image1.Visible = false;
            DateTime nd = DateTime.Today;
            dt = DateTime.ParseExact(date1.Text, "dd/MM/yyyy", null);
            dt= Convert.ToDateTime(dt, CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
            if (DateTime.Compare(nd.Date, dt.Date) >= 0)
            {
                Image1.Visible=true;
                date1.Text = String.Empty;
                Response.Write("<script>alert('Please select a future date only!')</script>");
                Imbtn1.Focus();
            }

        }

        private string getempid()
        {
            string eid=null;
            cmd = new SqlCommand("select username from empMst where occupied='N'", conn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                eid = dr[0].ToString();
            }
            else
                Response.Write("<script>alert('There was some errror! Please retry after sometime!')</script>");
            dr.Close();
            cmd.Dispose();
            return eid;
        }

        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = state.SelectedIndex;
            if (i > 5 || i < 1)
                Response.Write("<script>alert('Please select valid state!')</script>");
            setCities(i);
        }

        private void setCities(int i)
        {
            city.Items.Clear();
            if (i == 1)
            {
                ListItem city1 = new ListItem("Gwalior");
                ListItem city2 = new ListItem("Indore");
                ListItem city3 = new ListItem("Bhopal");
                ListItem city4 = new ListItem("Jabalpur");
                ListItem city5 = new ListItem("Samchi");
                city.Items.Add(city1);
                city.Items.Add(city2);
                city.Items.Add(city3);
                city.Items.Add(city4);
                city.Items.Add(city5);
            }
            else if (i == 2)
            {

                ListItem city1 = new ListItem("Prayagraj");
                ListItem city2 = new ListItem("Lucknow");
                ListItem city3 = new ListItem("Amethi");
                ListItem city4 = new ListItem("Gonda");
                ListItem city5 = new ListItem("Banda");
                city.Items.Add(city1);
                city.Items.Add(city2);
                city.Items.Add(city3);
                city.Items.Add(city4);
                city.Items.Add(city5);
            }
            else if (i == 3)
            {

                ListItem city1 = new ListItem("Jaipur");
                ListItem city2 = new ListItem("Chandimandir");
                ListItem city3 = new ListItem("Ganganagar");
                ListItem city4 = new ListItem("Alwar");
                ListItem city5 = new ListItem("Jodhpur");
                city.Items.Add(city1);
                city.Items.Add(city2);
                city.Items.Add(city3);
                city.Items.Add(city4);
                city.Items.Add(city5);
            }
            else if (i == 4)
            {

                ListItem city1 = new ListItem("Chandigarh");
                ListItem city2 = new ListItem("Patiala");
                ListItem city3 = new ListItem("Ludhiana");
                ListItem city4 = new ListItem("Amritsar");
                ListItem city5 = new ListItem("Bathinda");
                city.Items.Add(city1);
                city.Items.Add(city2);
                city.Items.Add(city3);
                city.Items.Add(city4);
                city.Items.Add(city5);
            }
            else if (i == 5)
            {

                ListItem city1 = new ListItem("New Delhi");
                ListItem city2 = new ListItem("Old Delhi");
                ListItem city3 = new ListItem("Noida");
                ListItem city4 = new ListItem("Gurgaon");
                city.Items.Add(city1);
                city.Items.Add(city2);
                city.Items.Add(city3);
                city.Items.Add(city4);
            }
        }

        private void setSates()
        {
            state.Items.Clear();
            ListItem select = new ListItem("--Select--");
            ListItem state1 = new ListItem();
            ListItem state2 = new ListItem();
            ListItem state3 = new ListItem();
            ListItem state4 = new ListItem();
            ListItem state5 = new ListItem();
            state1.Text = "Madhya Pradesh";
            state2.Text = "Uttar Pradesh";
            state3.Text = "Rajasthan";
            state4.Text = "Punjab";
            state5.Text = "Delhi(NCR)";
            state.Items.Add(select);
            state.Items.Add(state1);
            state.Items.Add(state2);
            state.Items.Add(state3);
            state.Items.Add(state4);
            state.Items.Add(state5);
            city.Items.Add("Please Select State!");
        }

    }
}