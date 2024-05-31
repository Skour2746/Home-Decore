using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_Frontend : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] == null)
        {
            btnlogin.Visible = true;
            btnlogout.Visible = false;
           

        }
        else
        {
            btnlogin.Visible = false;
            btnlogout.Visible = true;
           
        }
        if (!IsPostBack)    
        {
            BindListView1();
            lv_price_per_night();
            BindListView2();
            //Load_Username();
        }
    }


    public void BindListView1()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Category where status=1", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_mainmenu.DataSource = dt;
            lv_mainmenu.DataBind();
        }
        con.Close();
    }
    public void lv_price_per_night()
    {
        for (int i = 0; i < lv_mainmenu.Items.Count; i++)
        {
            ListView lv_submenu = lv_mainmenu.Items[i].FindControl("lv_submenu") as ListView;
            Label lblmainId = lv_mainmenu.Items[i].FindControl("lblmainId") as Label;
            Label lblsubId = lv_mainmenu.Items[i].FindControl("lblsubId") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from Sub_Category where cid='" + lblmainId.Text + "' and status=1", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                lv_submenu.DataSource = dtt;
                lv_submenu.DataBind();
            }
        }
    }

    public void BindListView2()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Category where status=1", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_category1.DataSource = dt;
            lv_category1.DataBind();
        }
        con.Close();
    }



    protected void btnaccount_Click1(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("index.aspx");
        }

    }

    protected void btncart_Click(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("Cart.aspx");
        }
    }

    protected void Btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void Btnlogout_Click(object sender, EventArgs e)
    {
        Session.Remove("id");

        Response.Redirect("index.aspx");
    }

   
}
