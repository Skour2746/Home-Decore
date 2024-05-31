using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Sub_Category : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Decore"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            BindListView1();

        }
    }
    private void BindListView()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Category";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddcategory.DataSource = dt;
                    ddcategory .DataBind();
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //SqlConnection con = new SqlConnection(cs);

        //string fileName = "";
        //if (FileUpload1.HasFile)
        //{
        //     fileName = FileUpload1.FileName;
        //    string filePath = Server.MapPath("~/Admin/images1/" + fileName);
        //    FileUpload1.SaveAs(filePath);
        //}
        //SqlCommand cmd = new SqlCommand("INSERT INTO Sub_Category (cid,SubCategory,image,status,rts) VALUES('" + ddcategory.SelectedValue+ "','" + txtsubcategory.Text + "','" + fileName + "',1,getdate())", con);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();


        string id = "";
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (Button1.Text == "Submit")
            {
                string fileName = id + ".jpg";
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                cmd.CommandText = "INSERT INTO Sub_Category (cid,SubCategory,image,status,rts) VALUES('" + ddcategory.SelectedValue + "','" + txtsubcategory.Text + "','" + fileName + "',1,getdate())";
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = hfSelectedRecord.Value + ".jpg";
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                    cmd.CommandText = "update Sub_Category set cid='" + ddcategory.SelectedValue + "', SubCategory='" + txtsubcategory.Text + "' ,image='" + fileName + "'  where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Sub_Category set cid='" + ddcategory.SelectedValue + "', SubCategory='" + txtsubcategory.Text + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();

            BindListView1();
            con.Close();

        }




        }

    private void BindListView1()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Sub_Category ";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lstsubcategory.DataSource = dt;
                    lstsubcategory.DataBind();
                }
            }
        }
    }
    protected void lstsubcategory_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblcid = (Label)e.Item.FindControl("lblcid");
            Label lblcategory = (Label)e.Item.FindControl("lblSubCategory");
            Label lblimage = (Label)e.Item.FindControl("lblimage");


            hfSelectedRecord.Value = lblid.Text;
            ddcategory.Text = lblcid.Text;
            txtsubcategory.Text = lblcategory.Text;
            Image1.ImageUrl = "~/Admin/images1/" + lblimage.Text;

            Button1.Text = "Update";

            BindListView1();
        }
        if (e.CommandName == "active")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Sub_Category set status=1 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();

        }
        if (e.CommandName == "deactive")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Sub_Category set status=0 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView1();
            con.Close();

        }

    }
    protected void lstsubcategory_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //string img = "";
        //SqlConnection con = new SqlConnection(cs);
        //if (FileUpload1.HasFile)
        //{
        //    string fileName = hfSelectedRecord.Value + ".jpg";
        //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
        //    img = ",image='"+fileName+"'"; 
        //}


        //SqlCommand cmd = new SqlCommand("update Sub_Category set cid='" + ddcategory.SelectedValue + "', SubCategory='" + txtsubcategory.Text + "' " + img + "  where id=" + hfSelectedRecord.Value + "", con);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        //

//        SqlConnection con = new SqlConnection(cs);
//        SqlCommand cmd = new SqlCommand();
//        if (FileUpload1.HasFile)
//        {
//            string fileName = hfSelectedRecord.Value + ".jpg";
//            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
//            cmd = new SqlCommand("update Sub_Category set cid='" + ddcategory.SelectedValue + "', SubCategory='" + txtsubcategory.Text + "' ,image='"+fileName+"'  where id=" + hfSelectedRecord.Value + "", con);
        
//        }
//        else
//        {
//            cmd = new SqlCommand("update Sub_Category set cid='" + ddcategory.SelectedValue + "', SubCategory='" + txtsubcategory.Text + "'   where id=" + hfSelectedRecord.Value + "", con);
//        }

//con.Open();
//        cmd.ExecuteNonQuery();
//        con.Close();
   }
}