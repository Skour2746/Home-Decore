using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Category : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["SelectedId"] == null)
        {
            Response.Redirect("index.aspx");
        }

        if (!IsPostBack)
        {
            BindListView1();
            BindListView2();
        }

    }
    public void BindListView1()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Subid ORDER BY cid) AS rn FROM Mini_Category_detail) AS SubQuery WHERE rn = 1 AND cid='" + Request.QueryString["SelectedId"] + "'", con))
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
        using (SqlDataAdapter sda = new SqlDataAdapter("select DISTINCT Category.category from Mini_Category_detail inner join Category on Mini_Category_detail.cid=Category.id where Subid='" + Request.QueryString["SelectedID"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        con.Close();

    }
}