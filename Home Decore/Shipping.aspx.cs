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
        BindListView();
        CalculateTotal_Click();

    }
    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select Mini_Category_detail.Heading,Mini_Category_detail.image,Mini_Category_detail.Para,Mini_Category_detail.Rate,Cart.* from Cart inner join Mini_Category_detail on Cart.Product_id=Mini_Category_detail.id where Customer_id='" + Session["id"] + "' ", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        con.Close();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            string lblid1 = "";
            Label lblid = item.FindControl("lblid") as Label;

            if (lblid != null)
            {
                lblid1 = lblid.Text;
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Shipping_tbl(Customer_id,Order_id,Name,Email,Contact,Address,State,City,PinCode,Order_note,status,rts) values('" + Session["id"] + "','" + lblid1 + "','" + txtname.Text + "','" + txtemail.Text + "','" + txtcontact.Text + "','" + txtaddress.Text + "','" + txtstate.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "','" + txtOrderNote.Text + "',1,getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();

            txtname.Text = "";
            txtemail.Text = "";
            txtcontact.Text = "";
            txtaddress.Text = "";
            txtstate.Text = "";
            txtcity.Text = "";
            txtpincode.Text = "";
            txtOrderNote.Text = "";
        }
    }
    protected void CalculateTotal_Click()
    {
        int total = 0;

        foreach (ListViewItem item in ListView1.Items)
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

        lblTotal.Text = total.ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int pid = 0;
        int pidss = 0;
        int total = 0;
        int price = 0;
        int DeliveryAmt = 50;

        SqlCommand cmd1 = new SqlCommand("SELECT MAX(OrderId) AS ID FROM TrnOrderMain", con);
        con.Open();
        object result = cmd1.ExecuteScalar();

        if (result != null && result != DBNull.Value)
        {
            pid = Convert.ToInt32(result) + 1;
        }
        con.Close(); 
        SqlCommand cmd2 = new SqlCommand("SELECT MAX(InvoiceNo) AS ID FROM TrnOrderDetail", con);
        con.Open();
        object result11 = cmd1.ExecuteScalar();

        if (result11 != null && result11 != DBNull.Value)
        {
            pidss = Convert.ToInt32(result11) + 1;
        }
        con.Close();

        foreach (ListViewItem item in ListView1.Items)
        {

            Label lblqty = item.FindControl("lblqty") as Label;
            Label lblid = item.FindControl("lblid") as Label;
            Label lblprice = item.FindControl("lblPrice") as Label;

            if (lblqty != null && lblprice != null)
            {
                int quantity = Convert.ToInt32(lblqty.Text);
                int Price = Convert.ToInt32(lblprice.Text);
                total += quantity;
                price += Price + DeliveryAmt;
            }
            SqlCommand cmd3 = new SqlCommand("insert into TrnOrderDetail(InvoiceNo,OrderId,ProductId,Quantity,Amount,DeliveryFees,NetAmount,Cancelled,Delivered,Returned,Dispatched,RTS,DeliveryDate,DeliveryCharges,remark)values('"+ pidss + "','"+pid+"','"+ lblid.Text + "','"+ lblqty.Text + "','"+ lblprice.Text + "','"+ DeliveryAmt + "','"+ price + "',0,0,0,0,getdate(),getdate(),'"+DeliveryAmt+"','')",con);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
        }
        int paidamount = Convert.ToInt32(lblTotal.Text) + 50;


        SqlCommand cmd = new SqlCommand("insert into TrnOrderMain(OrderId,Usercode,OrderAmount,PaidAmount,TotalQuantity,DeliveryFees,Amount,Paymode,TrnStatus,OrderThrough,ShippingName,ShippingAddress,ShippingMobileNo,ShippingEmailId,ShippingCity,ShippingZipCode,ShippingState,Delivered,Cancelled,Returned,Dispatched,Settlement,RTS)" +
            " values('" + pid + "','" + Session["id"] + "','" + lblTotal.Text + "','" + paidamount + "','" + total + "','"+ DeliveryAmt + "','" + lblTotal.Text + "','" + CheckBox1.Checked + "',1,'WEBSITE','" + txtname.Text + "','" + txtaddress.Text + "','" + txtcontact.Text + "','" + txtemail.Text + "','" + txtcity.Text + "','" + txtpincode.Text + "','" + txtstate.Text + "', 0, 0, 0, 0, 0,getdate())", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Thanks.aspx");
        txtname.Text = "";
        txtaddress.Text = "";
        txtemail.Text = "";
        txtcity.Text = "";
        txtpincode.Text = "";
        txtstate.Text = "";
    }


}