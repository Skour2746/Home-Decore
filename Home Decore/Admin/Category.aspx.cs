using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Category : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Decore"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindListView();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (Button1.Text == "Submit")
            {
                HttpPostedFile files = FileUpload1.PostedFile;
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string imgPath1 = "~/Admin/images1/category/" + fileName;
                int widthC = 300;
                int heightC = 400;
                Stream streamC = files.InputStream;
                using (Bitmap imageC = new Bitmap(streamC))
                {
                    using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
                    {
                        using (Graphics graphicC = Graphics.FromImage(targetC))
                        {
                            graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                            graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                            graphicC.CompositingMode = CompositingMode.SourceCopy;
                            graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                            targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                        }
                    }
                    //string fileName = id + ".jpg";
                    //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                    cmd.CommandText = "INSERT INTO Category (category,image,status,rts) VALUES('" + txtcategory.Text.Replace("'", "''") + "','" + fileName + "',1,getdate())";
                    BindListView();
                }
            }
            else
            {
                HttpPostedFile files = FileUpload1.PostedFile;
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string imgPath1 = "~/Admin/images1/category/" + fileName;
                int widthC = 300;
                int heightC = 400;
                Stream streamC = files.InputStream;
                using (Bitmap imageC = new Bitmap(streamC))
                {
                    using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
                    {
                        using (Graphics graphicC = Graphics.FromImage(targetC))
                        {
                            graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                            graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                            graphicC.CompositingMode = CompositingMode.SourceCopy;
                            graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                            targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                        }
                    }
                    if (FileUpload1.HasFile)
                    {
                        //string fileName = hfSelectedRecord.Value + ".jpg";
                        //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/images1/") + fileName);
                        cmd.CommandText = "update Category set category='" + txtcategory.Text.Replace("'", "''") + "', image='" + fileName + "'  where id=" + hfSelectedRecord.Value + "";

                    }
                    else
                    {
                        cmd.CommandText = "update Category set category='" + txtcategory.Text + "'where id=" + hfSelectedRecord.Value + "";

                    }
                }

            }

            cmd.ExecuteNonQuery();

            BindListView();
            con.Close();

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
                    lstcategory.DataSource = dt;
                    lstcategory.DataBind();
                }
            }
        }
    }
    protected void lstcategory_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //if (e.CommandName == "delete")
        //{
        //    string lblid = "";
        //    Label label1 = (Label)e.Item.FindControl("lblid");
        //    if (lblid != null)
        //        lblid = label1.Text;
        //    string Deletequery = "Delete from Category WHERE [ID] = '" + lblid + "'";
        //    SqlConnection con = new SqlConnection(cs);
        //    con.Open();
        //    SqlCommand com = new SqlCommand(Deletequery, con);
        //    com.ExecuteNonQuery();
        //    con.Close();
        //    BindListView();
        //}


        if (e.CommandName == "edit")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblcategory = (Label)e.Item.FindControl("lblcategory");
            Label lblimage = (Label)e.Item.FindControl("lblimage");


            hfSelectedRecord.Value = lblid.Text;
            txtcategory.Text = lblcategory.Text;
            Image1.ImageUrl = "~/Admin/images1/category/" + lblimage.Text;

            Button1.Text = "Update";

            BindListView();
        }
        if (e.CommandName == "active")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Category set status=1 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView();
            con.Close();

        }
        if (e.CommandName == "deactive")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Category set status=0 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView();
            con.Close();

        }


    }
    protected void lstcategory_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
    protected void lstcategory_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}