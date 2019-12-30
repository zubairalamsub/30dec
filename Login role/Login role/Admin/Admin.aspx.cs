using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Login_role
{
    public partial class clerk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=Brown>" + "WELLCOME ADMIN:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT UserId, Username FROM login "))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlUser.DataSource = cmd.ExecuteReader();
                        ddlUser.DataTextField = "UserName";
                        ddlUser.DataValueField = "UserId";
                        ddlUser.DataBind();
                        con.Close();
                    }
                }
                ddlUser.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }


        }
        [WebMethod]
        public static void saveUser(int UserId, int BrandId)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO AssignProduct VALUES(@UserId, @BrandId)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@UserId", UserId);
                    cmd.Parameters.AddWithValue("@BrandId", BrandId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
