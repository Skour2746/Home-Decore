using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView1();
            BindListView();
            BindComments();
        }

        if (Request.QueryString["detail_id"] == null)
        {
            Response.Redirect("ProductCategory.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Mini_Category_detail where id='" + Request.QueryString["detail_id"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        con.Close();
    }

    public void BindListView1()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from Mini_Category_detail where id='" + Request.QueryString["detail_id"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView2.DataSource = dt;
            ListView2.DataBind();
        }
        con.Close();
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
        else
        {
            con.Open();
            string fileName = "";
            if (FileUpload1.HasFile)
            {
                foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                {
                    fileName = Path.GetFileName(file.FileName);
                    var encoderParams = new EncoderParameters(1);
                    encoderParams.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 90L);
                    System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/Admin/images1/commenter/" + fileName), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                    System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(200, 200, () => false, IntPtr.Zero).Save(Server.MapPath("~/Admin/images1/commenter/" + fileName));

                }
            }
            SqlCommand cmd = new SqlCommand("insert into comment(P_id,Rating,comment,image,c_name,email,status,rts) values ('" + Request.QueryString["detail_id"] + "','" + Rating2.CurrentRating + "','" + TextBox1.Text + "','" + fileName + "','" + TextBox2.Text + "','" + TextBox3.Text + "',0,getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
    }

    private void BindComments()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM comment where status=1 and P_id='"+Request.QueryString["detail_id"]+"'", con);
        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView3.DataSource = dt;
            ListView3.DataBind();
        }
    }

    private List<double> GetRatingsForPlace(int placeId)
    {
        List<double> ratings = new List<double>();
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select rating from comment where P_id = '" + Request.QueryString["detail_id"] + "' and status=1", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                double rating = Convert.ToDouble(reader["rating"]);
                ratings.Add(rating);
            }
            reader.Close();
            con.Close();
        }
        //reviewcount.InnerText = "Total Reviews : " + ratings.Count.ToString();
        return ratings;
    }



    protected string RenderControlToString(Control control)
    {
        StringBuilder sb = new StringBuilder();
        StringWriter sw = new StringWriter(sb);
        HtmlTextWriter htmlWriter = new HtmlTextWriter(sw);
        control.RenderControl(htmlWriter);
        return sb.ToString();
    }
    protected string GetStarIcons(int rating)
    {
        StringBuilder starHtml = new StringBuilder();
        for (int i = 1; i <= rating; i++)
        {
            starHtml.Append("<i class='fa fa-star'></i> ");
        }
        return starHtml.ToString();
    }


    protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                int placeId = Convert.ToInt32(Request.QueryString["detail_id"]);

                List<double> ratings = GetRatingsForPlace(placeId);

                double avgRating = ratings.Any() ? ratings.Average() : 0;
                int numStars = (int)Math.Round(avgRating);
                string starHtml = "";
                for (int i = 0; i < numStars; i++)
                {
                    starHtml += "<i class='fas fa-star'></i> ";
                }




                Label ratingLabel = (Label)e.Item.FindControl("ratingLabel");
                double rating = Convert.ToDouble(DataBinder.Eval(e.Item.DataItem, "rating"));

                //        // Set the rating label text
                ratingLabel.Text = GetStarIcons((int)Math.Round(rating));
            }
        }

    protected void submit_Click1(object sender, EventArgs e)
    {

        string qty = "";
     
        foreach (ListViewItem item in ListView1.Items)
        {
            TextBox quantityTextBox = item.FindControl("quantityTextBox") as TextBox;

            if (quantityTextBox !=null)
            {
                qty = quantityTextBox.Text;
            }
          
        }
        if (Session["id"] == null)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Cart(Customer_id,Product_id,Quantity,status,rts) values ('" + Session["id"] + "','" + Request.QueryString["detail_id"] + "', '" + qty + "',1,getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
