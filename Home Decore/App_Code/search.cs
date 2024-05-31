using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for sellproduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class search : System.Web.Services.WebService
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Decore"].ConnectionString);

    public search()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

}