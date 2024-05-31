using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Mini_Category_Detail : System.Web.UI.Page
{

    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Decore"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            BindListView1();
            BindListView2();
            BindListView3();

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
                    ddcategory.DataBind();
                }
            }
        }
    }


    private void BindListView1()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Sub_Category where cid='" + ddcategory.SelectedValue + "'";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddsubcategory.DataSource = dt;
                    ddsubcategory.DataBind();
                }
            }
        }
    }


    private void BindListView2()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Mini_Category where SubCategory_id='" + ddsubcategory.SelectedValue + "'";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddminicategory.DataSource = dt;
                    ddminicategory.DataBind();
                }
            }
        }
    }

    private void BindListView3()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM Mini_Category_detail";
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lstminicategorydetail.DataSource = dt;
                    lstminicategorydetail.DataBind();
                }
            }
        }
    }


    protected void submit_Click(object sender, EventArgs e)
    {

        string id = "";
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (submit.Text == "Submit")
            {
                string fileName = "";
                if (FileUpload1.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                    {
                        fileName = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName));
                    }
                }
                string fileName1 = "";
                if (FileUpload2.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                    {
                        fileName1 = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName1));
                    }
                }
                string fileName2 = "";
                if (FileUpload3.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload3.PostedFiles)
                    {
                        fileName2 = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName2), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName2));
                    }
                }
              
                string fileName4 = "";
                if (FileUpload5.HasFile)
                {
                    foreach (HttpPostedFile file in FileUpload5.PostedFiles)
                    {
                        fileName4 = Path.GetFileName(file.FileName);
                        var encoderParams = new EncoderParameters(1);
                        encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                        System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName4), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                        System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName4));
                    }
                }
                cmd.CommandText = "INSERT INTO Mini_Category_detail (cid,Subid,MiniCid,image,image1,image2,image4,Heading,Para,Rate,status,rts) VALUES('" + ddcategory.SelectedValue + "','" + ddsubcategory.SelectedValue + "','" + ddminicategory.SelectedValue + "','" + fileName + "','" + fileName1 + "','" + fileName2 + "','" + fileName4 + "','" + txtheading.Text.Replace("'", "''") + "','" + txtpara.Text.Replace("'", "''") + "','" + txtrate.Text.Replace("''", "''") + "',1,getdate())";
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = "";
                    if (FileUpload1.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                        {
                            fileName = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName));
                        }
                    }
                    string fileName1 = "";
                    if (FileUpload2.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload2.PostedFiles)
                        {
                            fileName1 = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName1));
                        }
                    }
                    string fileName2 = "";
                    if (FileUpload3.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload3.PostedFiles)
                        {
                            fileName2 = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName2), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName2));
                        }
                    }
                  
                    string fileName4 = "";
                    if (FileUpload5.HasFile)
                    {
                        foreach (HttpPostedFile file in FileUpload5.PostedFiles)
                        {
                            fileName4 = Path.GetFileName(file.FileName);
                            var encoderParams = new EncoderParameters(1);
                            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("images1/MiniCatwgory/" + fileName4), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(300, 300, () => false, IntPtr.Zero).Save(Server.MapPath("images1/MiniCatwgory/" + fileName4));
                        }
                    }
                    cmd.CommandText = "update Mini_Category_detail set cid='" + ddcategory.SelectedValue + "',Subid='" + ddsubcategory.SelectedValue + "',MiniCid='" + ddminicategory.SelectedValue + "', image='" + fileName + "', image1='" + fileName1 + "', image2='" + fileName2 + "', image4='" + fileName4 + "',Heading='" + txtheading.Text.Replace("'", "''") + "',Para='" + txtpara.Text.Replace("'", "''") + "',Rate='" + txtrate.Text.Replace("'", "''") + "' where id=" + hfSelectedRecord.Value + "";

                }
                else
                {
                    cmd.CommandText = "update Mini_Category_detail set cid='" + ddcategory.SelectedValue + "',Subid='" + ddsubcategory.SelectedValue + "',MiniCid='" + ddminicategory.SelectedValue + "',Heading='" + txtheading.Text.Replace("'", "''") + "',Para='" + txtpara.Text.Replace("'", "''") + "',Rate='" + txtrate.Text.Replace("'", "''") + "' where id=" + hfSelectedRecord.Value + "";

                }
            }

            cmd.ExecuteNonQuery();

            BindListView3();
            con.Close();



        }
    }
    protected void lstminicategory_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void lstminicategory_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblcid = (Label)e.Item.FindControl("lblcid");
            Label lblsubcat = (Label)e.Item.FindControl("lblsubcat");
            Label lblminicat = (Label)e.Item.FindControl("lblminicat");
            Label lblimage = (Label)e.Item.FindControl("lblimage");
            Label lblimage1 = (Label)e.Item.FindControl("lblimage1");
            Label lblimage2 = (Label)e.Item.FindControl("lblimage2");
            Label lblimage4 = (Label)e.Item.FindControl("lblimage4");
            Label lblheading = (Label)e.Item.FindControl("lblheading");
            Label lblpara = (Label)e.Item.FindControl("lblpara");
            Label lblRate = (Label)e.Item.FindControl("lblRate");

            hfSelectedRecord.Value = lblid.Text;
            ddcategory.Text = lblcid.Text;
            ddsubcategory.Text = lblsubcat.Text;
            ddminicategory.Text = lblminicat.Text;
            Image1.ImageUrl = "~/Admin/images1/MiniCatwgory/" + lblimage.Text;
            Image2.ImageUrl = "~/Admin/images1/MiniCatwgory/" + lblimage1.Text;
            Image3.ImageUrl = "~/Admin/images1/MiniCatwgory/" + lblimage2.Text;
            Image5.ImageUrl = "~/Admin/images1/MiniCatwgory/" + lblimage4.Text;
            txtheading.Text = lblheading.Text;
            txtpara.Text = lblpara.Text;
            txtrate.Text = lblRate.Text;

            submit.Text = "Update";

        }

        if (e.CommandName == "active")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Mini_Category_detail set status=1 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView3();
            con.Close();

        }
        if (e.CommandName == "deactive")
        {
            Label label1 = (Label)e.Item.FindControl("lblid");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("update Mini_Category_detail set status=0 where id=" + label1.Text + "", con);
            con.Open();
            cmd.ExecuteNonQuery();
            BindListView3();
            con.Close();

        }
    }
    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView1();
    }
    protected void ddsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindListView2();
    }
}