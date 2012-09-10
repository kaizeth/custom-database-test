using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace AppHarborTest
{
    public partial class manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Return to login if session variable does not exist
            if (Session["user"] == null)
                Response.Redirect("index.aspx");

            Label1.Text = Session["user"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource(ConfigurationManager.ConnectionStrings["cs"].ConnectionString, "SELECT * FROM [users] WHERE [username]='" + GridView1.SelectedValue + "'");

            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            TextBox1.Text = dv[0].Row[0].ToString();
            TextBox2.Text = dv[0].Row[1].ToString();
            TextBox3.Text = dv[0].Row[2].ToString();
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateCommand = "UPDATE [users] SET [password] = '" + TextBox2.Text + "', [e-mail] = '" + TextBox3.Text + "' WHERE [username] = '" + TextBox1.Text + "'";
            SqlDataSource1.Update();
            Response.Redirect("manage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("manage.aspx");
        }
    }
}