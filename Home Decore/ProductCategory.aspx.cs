using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindListView();
            BindListView2();
        }
        if (Request.QueryString["listing_cid"] == null)
        {
            Response.Redirect("Product.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Mini_Category_detail where MiniCid='" + Request.QueryString["listing_cid"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_listing.DataSource = dt;
            lv_listing.DataBind();
        }
        con.Close();
    }
    protected void lv_listing_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lv_listing.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindListView();
    }

    public void BindListView2()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select DISTINCT Mini_Category.MiniCategory from Mini_Category_detail inner join Mini_Category on Mini_Category_detail.MiniCid=Mini_Category.id where MiniCid='" + Request.QueryString["listing_cid"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        con.Close();
    }
}