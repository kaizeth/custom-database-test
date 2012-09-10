using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AppHarborTest
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM users WHERE (username='"+txt_user.Text+"')";

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dv.Count == 1)
            {
                Label1.Visible = true;
            }
            else
            {
                SqlDataSource1.Insert();
                this.Session["user"] = txt_user.Text;
                Response.Redirect("manage.aspx");
            }
        }
    }
}