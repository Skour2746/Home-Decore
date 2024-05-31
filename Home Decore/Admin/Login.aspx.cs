using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["Decore"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("select * from login where username=@username and password=@password", con);
        cmd.Parameters.AddWithValue("@username", "Simran");
        cmd.Parameters.AddWithValue("@password", "Skour");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();

        if (txtusername.Text == "Simran" && txtpassword.Text == "Skour")
        {
            Session["adminid"] = "1";
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            Label1.Text = "Your username and password is incorrect";
            Label1.ForeColor = System.Drawing.Color.Red;

        }  
    }
}