using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Login_role
{
    public partial class doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=Brown>" + "WELLCOME FREE USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select UserName,BrandId from login join  AssignProduct on login.UserId=AssignProduct.UserId where Role='FreeUser'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            txtCustomerId.Text = sdr["UserName"].ToString();
                            txtName.Text = sdr["BrandId"].ToString();
                            var brandId = sdr["BrandId"];
                            Image1.ImageUrl = "https://static.ajkerdeal.com/img/brand/" + brandId + ".png";


                        }
                        con.Close();
                    }
                }
            }


        }



       
    }
}
