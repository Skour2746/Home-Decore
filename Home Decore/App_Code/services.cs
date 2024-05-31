using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for services
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class services : System.Web.Services.WebService {
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);
    static SqlDataAdapter da;
    static DataTable dt; 
    public services () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]

    public static List<string> GetSearch(string prefixText)
    {
        DataTable Result = new DataTable();
        string str = "select category from Category where category like '" + prefixText + "%'";
        da = new SqlDataAdapter(str, con);
        dt = new DataTable();
        da.Fill(dt);
        List<string> Output = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
            Output.Add(dt.Rows[i][0].ToString());
        return Output;
    }
    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> GetSearch1(string prefixText1)
    //{
    //    DataTable Result = new DataTable();
    //    string str = "select SubCategory from Sub_Category where SubCategory like '" + prefixText1 + "%'";
    //    da = new SqlDataAdapter(str, con);
    //    dt = new DataTable();
    //    da.Fill(dt);
    //    List<string> Output = new List<string>();
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //        Output.Add(dt.Rows[i][0].ToString());
    //    return Output;
    //} 
    
}
