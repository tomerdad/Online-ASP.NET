using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
            Response.Redirect("index.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // login user
        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM Users WHERE email='" + email.Text + "' and password='" + password.Text + "';";
        dsUser = sqlUser.chkData(stUser);
        if (dsUser.Tables[0].Rows.Count > 0)
        {
            //Session (save user login data)
            Session["UserID"] = dsUser.Tables[0].Rows[0][0];
            Session["UserFName"] = dsUser.Tables[0].Rows[0][1];


            Response.Redirect("./index.aspx");
        }
        else
        {
            //
        }
    }
}