using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Mini_Category : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Decore"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindListView();
            BindListView1();
            BindListView2();


        }
    }
    private void BindListView()
    {

        SqlConnection con = new SqlConnection(cs);
     SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM Category";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddcategory.DataSource = dt;
                    ddcategory.DataBind();
                }
            }


    private void BindListView1()
    {

        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Sub_Category where cid='"+ ddcategory.SelectedValue+"'";
        cmd.Connection = con;
        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddsubcategory.DataSource = dt;
            ddsubcategory.DataBind();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        string id = "";
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select isnull(max(id),0)+1 from Mini_Category", con);
            id = cmd.ExecuteScalar().ToString();
            con.Close();
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (submit.Text == "Submit")
            {
                string fileName = id + ".jpg";
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                cmd.CommandText = "INSERT INTO Mini_Category (cid,Subcategory_id,minicategory,image,status,rts) VALUES('" + ddcategory.SelectedValue + "','" + ddsubcategory.SelectedValue + "','" + txtminicategory.Text.Replace("'", "''") + "','" + fileName + "',1,getdate())";
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = hfSelectedRecord.Value + ".jpg";
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                    cmd.CommandText = "update Mini_Category set cid='" + ddcategory.SelectedValue + "',Subcategory_id='" + ddsubcategory.SelectedValue + "',minicategory='" + txtminicategory.Text.Replace("'", "''") + "', image='" + fileName + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Mini_Category set cid='" + ddcategory.SelectedValue + "',Subcategory_id='" + ddsubcategory.SelectedValue + "',minicategory='" + txtminicategory.Text.Replace("'", "''") + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();

            BindListView2(); 
            con.Close();

        }
    }
    protected void lstsubcategory_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void lstsubcategory_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit") {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblcid = (Label)e.Item.FindControl("lblcid");
            Label lblsubcat = (Label)e.Item.FindControl("lblsubcat");
            Label lblminicat = (Label)e.Item.FindControl("lblminicat");
            Label lblimage = (Label)e.Item.FindControl("lblimage");

            hfSelectedRecord.Value = lblid.Text;
            ddcategory.Text = lblcid.Text;
            ddsubcategory.Text = lblsubcat.Text;
            txtminicategory.Text = lblminicat.Text;
            Image1.ImageUrl = "~/Admin/images1/" + lblimage.Text;

            submit.Text = "Update";
        }

        if (e.CommandName == "active")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Mini_Category set status=1 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView2();
            con.Close();

        }
        if (e.CommandName == "deactive")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Mini_Category set status=0 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView2();
            con.Close();

        }

    }
    private void BindListView2()
    {

        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Mini_Category";
        cmd.Connection = con;
        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lstminicategory.DataSource = dt;
            lstminicategory.DataBind();
        }
    }

    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView1();
    }
}
 