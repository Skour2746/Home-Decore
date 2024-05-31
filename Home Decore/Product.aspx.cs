using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            this.BindListView1();
            BindListView2();
            //BindListView3();
        }

        if (Request.QueryString["Subid"] == null)
        {
            Response.Redirect("index.aspx");
        }


    }
    public void BindListView1()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Mini_Category_detail where Subid='" + Request.QueryString["Subid"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            listing_SubCategory.DataSource = dt;
            listing_SubCategory.DataBind();
        }
        con.Close();
    }
    protected void listing_SubCategory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (listing_SubCategory.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindListView1();
    }

    public void BindListView2()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select DISTINCT Sub_Category.SubCategory from Mini_Category_detail inner join Sub_Category on Mini_Category_detail.Subid=Sub_Category.id where Subid='" + Request.QueryString["Subid"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        con.Close();
        
    }
}