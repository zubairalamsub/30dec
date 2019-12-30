using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
namespace Login_role
{
    public partial class Register : System.Web.UI.Page
    {

        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com;

        protected void btn_register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            com.CommandType = CommandType.Text;
            com.CommandText = "Insert into Login values(@UserName,@Password,@Role)";
            com.Parameters.Clear();
            com.Parameters.AddWithValue("@UserName", txt_UserName.Text);
            com.Parameters.AddWithValue("@Password", txt_Password.Text);
            com.Parameters.AddWithValue("@Role", rbtRole.SelectedValue);
            if (con.State == ConnectionState.Closed)
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = "Successfully Registered!!!";
            clear();
        }
        private void clear()
        {
            txt_UserName.Text = "";
            rbtRole.ClearSelection();
        }
    }
}
