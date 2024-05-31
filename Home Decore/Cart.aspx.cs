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

        if (!this.IsPostBack)
        {
            BindListView1();
            CalculateTotal_Click();

        }
    }
    private void BindListView1()
    {

        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "select Mini_Category_detail.Heading,Mini_Category_detail.image,Mini_Category_detail.Para, Mini_Category_detail.Rate,Cart.* from Cart inner join Mini_Category_detail on Cart.Product_id=Mini_Category_detail.id where Customer_id='" + Session["id"] + "'";
            cmd.Connection = con;
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lst_Cart.DataSource = dt;
                lst_Cart.DataBind();
            }
        }


    }



    protected void CalculateTotal_Click()
    {
        int total = 0;

        foreach (ListViewItem item in lst_Cart.Items)
        {
            Label lblPrice = item.FindControl("lblPrice") as Label;
            Label lblqty = item.FindControl("lblqty") as Label;

            // Retrieve controls for price and quantity
            if (lblPrice != null && lblqty != null)
            {
                int price = Convert.ToInt32(lblPrice.Text);
                int quantity = Convert.ToInt32(lblqty.Text);

                total += price * quantity;
            }
        }

        lblTotal.Text = "Total: Rs. " + total.ToString("0.00") + " /-";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("Shipping.aspx");
        }
    }

    protected void lst_Cart_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void lst_Cart_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string lblid = "";
            Label label1 = (Label)e.Item.FindControl("lblid");
            if (lblid != null)
                lblid = label1.Text;
            string Deletequery = "Delete from Cart WHERE id = '" + lblid + "'";

            con.Open();
            SqlCommand com = new SqlCommand(Deletequery, con);
            com.ExecuteNonQuery();
            BindListView1();
            CalculateTotal_Click();
            con.Close();
        }
    }
}