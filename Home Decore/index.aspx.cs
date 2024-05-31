using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _index : System.Web.UI.Page
{
     SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

   static SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    static SqlDataAdapter da;
    static DataTable dt;  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            Category_Show();
            Mini_Category_detail();
            Category_dropdown();
            RandomBlog();
            commentShow();
        }
    }
    private void Category_Show()
    {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Category Where status=1";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    list_Category.DataSource = dt;
                    list_Category.DataBind();
                }
            }
        }
    private void RandomBlog()
    {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT  * FROM Mini_Category_detail Where status=1 Order by newid()";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
                }
            }
        }

    private void Mini_Category_detail()
    {
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT * FROM Mini_Category_detail Where status=1";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lst_Mini_Category_detail.DataSource = dt;
                lst_Mini_Category_detail.DataBind();
            }
        }
    }  
    private void commentShow()
    {
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT * FROM comment";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView2.DataSource = dt;
                ListView2.DataBind();
            }
        }
    }


    private void Category_dropdown()
    {
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT * FROM Category Where status=1";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lst_ddcategory.DataSource = dt;
                lst_ddcategory.DataBind(); 
            }
        }
    }



    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]

    //public static List<string> GetSearch(string prefixText)
    //{
    //    DataTable Result = new DataTable();
    //    string str = "select category from Category where category like '%" + prefixText + "%'";
    //    da = new SqlDataAdapter(str, con1);
    //    dt = new DataTable();
    //    da.Fill(dt);
    //    List<string> Output = new List<string>();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //        Output.Add(dt.Rows[i][0].ToString());
    //    return Output;
    //}


    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> GetSearch1(string prefixText)
    //{
    //    DataTable Result = new DataTable();
    //    string str = "select SubCategory from Sub_Category where SubCategory like '%" + prefixText + "%'";
    //    da = new SqlDataAdapter(str, con1);
    //    dt = new DataTable();
    //    da.Fill(dt);
    //    List<string> Output = new List<string>();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //        Output.Add(dt.Rows[i][0].ToString());
    //    return Output;
    //}




    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> GetSearch2(string prefixText)
    //{
    //    DataTable Result = new DataTable();
    //    string str = "select minicategory from Mini_Category where minicategory like '%" + prefixText + "%'";
    //    da = new SqlDataAdapter(str, con1);
    //    dt = new DataTable();
    //    da.Fill(dt);
    //    List<string> Output = new List<string>();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //        Output.Add(dt.Rows[i][0].ToString());
    //    return Output;
    //} 

    protected void Key_search_Click(object sender, EventArgs e)
    {
        string selectedOption = lst_ddcategory.SelectedValue;

        // Construct the redirect URL with the selected option in the QueryString
        string redirectUrl ="CategoryDetail.aspx?SelectedId="+ selectedOption;

        // Redirect to the specified page
        Response.Redirect(redirectUrl);
    }
}